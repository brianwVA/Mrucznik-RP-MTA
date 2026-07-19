#!/usr/bin/env python3
"""Build a ServerProject-ready MTA Linux x86 deployment archive."""

from __future__ import annotations

import argparse
import hashlib
import http.cookiejar
import json
import shutil
import tarfile
import tempfile
import time
import urllib.request
import zipfile
from pathlib import Path, PurePosixPath
from xml.etree import ElementTree as ET


MTA_BUILD = "1.6.0-rc-24124-linux-x86"
OBJECT_PREVIEW_PAGE = (
    "https://community.multitheftauto.com/index.php?"
    "p=resources&resource=11836&s=download&selectincludes=1"
)
OBJECT_PREVIEW_URL = (
    "https://community.multitheftauto.com/modules/resources/"
    "doDownload.php?file=object_preview_0.7.0.zip&name=object_preview.zip"
)
OBJECT_PREVIEW_SHA256 = "17f3455d20083782e897fe9bb7ce45f0349d1fd2fc74975a990db1f8344f7625"
SAMP_ASSETS = {
    "wall025.dff": "3f41e84551b6d7ed04f66cbe5fcaad2e8cb1734ace8380a4b8a56200c3e8e87c",
    "all_walls.txd": "3c37105bc9bd3612ad6fcf5e79e35312ae7c401b6a95b74cae43cf236f363241",
    "19377.col": "beb1aca6de4ac61601ff016f5fc79954f0e0a1335010e7dde5989bd53316e67c",
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def download(url: str, destination: Path, expected_sha256: str, opener=None) -> None:
    if destination.exists() and sha256(destination) == expected_sha256:
        return
    destination.parent.mkdir(parents=True, exist_ok=True)
    for attempt in range(1, 7):
        try:
            request = urllib.request.Request(url, headers={"User-Agent": "Mrucznik-MTA-Linux/1"})
            with (opener or urllib.request).open(request, timeout=300) as response:
                with destination.open("wb") as output:
                    shutil.copyfileobj(response, output)
            actual = sha256(destination)
            if actual != expected_sha256:
                raise RuntimeError(f"SHA-256 {destination.name}: {actual}")
            return
        except Exception:
            destination.unlink(missing_ok=True)
            if attempt == 6:
                raise
            time.sleep(min(attempt * 2, 10))


def copy_tree(source: Path, destination: Path) -> None:
    shutil.copytree(source, destination, dirs_exist_ok=True)


def safe_archive_path(name: str) -> PurePosixPath:
    path = PurePosixPath(name)
    if path.is_absolute() or ".." in path.parts:
        raise RuntimeError(f"Niebezpieczna ścieżka w archiwum: {name}")
    return path


def extract_member(archive: tarfile.TarFile, name: str, destination: Path) -> None:
    member = archive.getmember(name)
    if not member.isfile():
        raise RuntimeError(f"Oczekiwano pliku w serverfiles.tar.gz: {name}")
    source = archive.extractfile(member)
    if source is None:
        raise RuntimeError(f"Nie można odczytać: {name}")
    destination.parent.mkdir(parents=True, exist_ok=True)
    with source, destination.open("wb") as output:
        shutil.copyfileobj(source, output)


def extract_prefix(archive: tarfile.TarFile, prefix: str, destination: Path) -> None:
    prefix_path = PurePosixPath(prefix)
    for member in archive.getmembers():
        path = safe_archive_path(member.name)
        try:
            relative = path.relative_to(prefix_path)
        except ValueError:
            continue
        if not member.isfile() or relative.name == "DANGEROUS_SERVER_ROOT":
            continue
        source = archive.extractfile(member)
        if source is None:
            continue
        output_path = destination.joinpath(*relative.parts)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with source, output_path.open("wb") as output:
            shutil.copyfileobj(source, output)


def extract_plugin(package: Path, archive_type: str, destination: Path) -> Path:
    if archive_type == "file":
        return package
    destination.mkdir(parents=True, exist_ok=True)
    if archive_type == "zip":
        with zipfile.ZipFile(package) as archive:
            for name in archive.namelist():
                safe_archive_path(name)
            archive.extractall(destination)
    elif archive_type == "tar.gz":
        with tarfile.open(package, "r:gz") as archive:
            for member in archive.getmembers():
                safe_archive_path(member.name)
            archive.extractall(destination, filter="data")
    else:
        raise RuntimeError(f"Nieobsługiwane archiwum: {archive_type}")
    return destination


def update_amx_meta(meta_path: Path, plugins: list[str]) -> None:
    tree = ET.parse(meta_path)
    root = tree.getroot()
    settings = {node.attrib.get("name"): node for node in root.findall("./settings/setting")}
    settings["plugins"].set("value", " ".join(plugins))
    settings["filterscripts"].set("value", "animy realtime sobeitblock SAN_extPSq")
    tree.write(meta_path, encoding="utf-8", xml_declaration=True)


def update_models_meta(meta_path: Path, assets: Path) -> None:
    tree = ET.parse(meta_path)
    root = tree.getroot()
    for old in list(root.findall("file")):
        if old.attrib.get("src", "").startswith("assets/"):
            root.remove(old)
    for asset in sorted(path for path in assets.rglob("*") if path.is_file()):
        relative = asset.relative_to(assets).as_posix()
        ET.SubElement(root, "file", {"src": f"assets/{relative}"})
    tree.write(meta_path, encoding="utf-8", xml_declaration=True)


def write_filter_resource(resources: Path, name: str, amx_source: Path) -> None:
    resource = resources / f"amx-fs-{name}"
    resource.mkdir(parents=True, exist_ok=True)
    shutil.copy2(amx_source, resource / f"{name}.amx")
    root = ET.Element("meta")
    ET.SubElement(root, "info", {"name": f"Mrucznik RP filterscript {name}", "type": "script"})
    ET.SubElement(root, "amx", {"src": f"{name}.amx"})
    ET.ElementTree(root).write(resource / "meta.xml", encoding="utf-8", xml_declaration=True)


def make_database_dump(project: Path, destination: Path) -> None:
    files = []
    files.extend(sorted(path for path in (project / "database/schema").glob("*.sql") if not path.name.startswith("view_")))
    files.append(project / "database/routines.sql")
    files.extend(sorted((project / "database/schema").glob("view_*.sql")))
    files.extend(sorted((project / "database/data").glob("*.sql")))
    with destination.open("w", encoding="utf-8", newline="\n") as output:
        output.write("SET NAMES utf8;\nSET FOREIGN_KEY_CHECKS=0;\n")
        for sql_file in files:
            output.write(f"\n-- ===== {sql_file.relative_to(project).as_posix()} =====\n")
            output.write(sql_file.read_text(encoding="utf-8", errors="replace"))
            output.write("\n")
        output.write("\nSET FOREIGN_KEY_CHECKS=1;\n")


def build(args: argparse.Namespace) -> tuple[Path, Path]:
    project = args.project.resolve()
    serverfiles = project / "serverfiles.tar.gz"
    lock_path = project / "mta/plugins.linux-x86.lock.json"
    for required in (serverfiles, lock_path, args.king_so, args.colandreas_so):
        if not required.exists():
            raise FileNotFoundError(required)
    if serverfiles.stat().st_size < 700 * 1024 * 1024:
        raise RuntimeError("serverfiles.tar.gz jest wskaźnikiem LFS, a nie pełnym archiwum")

    output_dir = args.output.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    work = Path(tempfile.mkdtemp(prefix="mrp-mta-linux-"))
    deploy = work / "Mrucznik-RP-MTA-Linux-x86"
    resources = deploy / "mods/deathmatch/resources"
    modules = deploy / "mods/deathmatch/modules"
    resources.mkdir(parents=True)
    modules.mkdir(parents=True)
    shutil.copy2(args.king_so, modules / "king.so")
    (modules / "king.so").chmod(0o755)

    amx_resource = resources / "amx"
    copy_tree(project / "mta/vendor/mta-amx/amx", amx_resource)

    lock = json.loads(lock_path.read_text(encoding="utf-8"))
    downloads = work / "downloads"
    plugin_names: list[str] = []
    for plugin in lock["plugins"]:
        extension = {"zip": ".zip", "tar.gz": ".tar.gz", "file": ".so"}[plugin["archive"]]
        package = downloads / f"{plugin['name']}-{plugin['version']}{extension}"
        download(plugin["url"], package, plugin["sha256"])
        package_root = extract_plugin(package, plugin["archive"], work / f"plugin-{plugin['name']}")
        for source_name, destination_name in plugin["files"].items():
            source = package_root if source_name == "." else package_root / source_name
            destination = amx_resource / destination_name
            if not source.is_file():
                raise FileNotFoundError(source)
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, destination)
            destination.chmod(0o755)
        plugin_names.append(plugin["load_name"])

    colandreas_destination = amx_resource / lock["built_plugins"][0]["destination"]
    colandreas_destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(args.colandreas_so, colandreas_destination)
    colandreas_destination.chmod(0o755)
    plugin_names.append(lock["built_plugins"][0]["load_name"])
    update_amx_meta(amx_resource / "meta.xml", plugin_names)

    extracted = work / "serverfiles"
    with tarfile.open(serverfiles, "r:gz") as archive:
        extract_member(archive, "serverfiles/gamemodes/Mrucznik-RP.amx", extracted / "Mrucznik-RP.amx")
        for name in ("animy", "realtime", "sobeitblock", "SAN_extPSq"):
            extract_member(archive, f"serverfiles/filterscripts/{name}.amx", extracted / f"{name}.amx")
        extract_prefix(archive, "serverfiles/scriptfiles", extracted / "scriptfiles")
        extract_prefix(archive, "serverfiles/models", extracted / "models")

    baseline = resources / "amx-mrucznik"
    baseline.mkdir()
    shutil.copy2(extracted / "Mrucznik-RP.amx", baseline)
    shutil.copy2(project / "mta/server/mods/deathmatch/resources/amx-mrucznik/meta.xml", baseline)

    for name in ("animy", "realtime", "sobeitblock", "SAN_extPSq"):
        write_filter_resource(resources, name, extracted / f"{name}.amx")
    write_filter_resource(resources, "callbackfix", extracted / "scriptfiles/callbackfix.amx")
    for suffix in "ABCDEFGHIJKLMNOP":
        name = f"fs-count-{suffix}"
        write_filter_resource(resources, name, extracted / f"scriptfiles/{name}.amx")

    copy_tree(extracted / "scriptfiles", amx_resource / "scriptfiles")
    copy_tree(extracted / "scriptfiles", deploy / "scriptfiles")
    copy_tree(extracted / "models", deploy / "models")
    mysql_config = (
        f"Host={args.mysql_host}\nUser={args.mysql_user}\n"
        f"DB={args.mysql_database}\nPass={args.mysql_password}\n"
    )
    redis_config = f"host={args.redis_host}\nport={args.redis_port}\npassword={args.redis_password}\n"
    for root in (amx_resource / "scriptfiles", deploy / "scriptfiles"):
        (root / "MySQL").mkdir(parents=True, exist_ok=True)
        (root / "MySQL/connect.ini").write_text(mysql_config, encoding="ascii")
        (root / "redis.ini").write_text(redis_config, encoding="ascii")

    copy_tree(project / "mta/server/mods/deathmatch/resources/mrp_bridge", resources / "mrp_bridge")
    models_resource = resources / "mrp_models"
    copy_tree(project / "mta/server/mods/deathmatch/resources/mrp_models", models_resource)
    model_assets = models_resource / "assets"
    model_assets.mkdir(parents=True, exist_ok=True)
    for pattern in ("*.dff", "*.txd"):
        for source in (extracted / "models").glob(pattern):
            shutil.copy2(source, model_assets / source.name)
    copy_tree(extracted / "models/vc4samp", model_assets / "vc4samp")
    samp_assets = model_assets / "samp"
    samp_assets.mkdir(parents=True, exist_ok=True)
    for name, digest in SAMP_ASSETS.items():
        download(f"https://gtastuff.com/api/file?name={name}", samp_assets / name, digest)
    shutil.copy2(extracted / "models/vc4samp/dff/concerth04.dff", deploy / "models/concerth04.dff")
    update_models_meta(models_resource / "meta.xml", model_assets)

    cookie_jar = http.cookiejar.CookieJar()
    opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookie_jar))
    opener.open(urllib.request.Request(OBJECT_PREVIEW_PAGE, headers={"User-Agent": "Mozilla/5.0"}), timeout=60).close()
    preview_zip = downloads / "object_preview.zip"
    if not preview_zip.exists() or sha256(preview_zip) != OBJECT_PREVIEW_SHA256:
        request = urllib.request.Request(
            OBJECT_PREVIEW_URL,
            headers={"User-Agent": "Mozilla/5.0", "Referer": OBJECT_PREVIEW_PAGE},
        )
        with opener.open(request, timeout=300) as response, preview_zip.open("wb") as output:
            shutil.copyfileobj(response, output)
        if sha256(preview_zip) != OBJECT_PREVIEW_SHA256:
            raise RuntimeError("Niepoprawny SHA-256 Object Preview")
    with zipfile.ZipFile(preview_zip) as archive:
        archive.extractall(resources / "object_preview")

    instructions = f"""Mrucznik RP MTA — paczka dla ServerProject
Platforma: {MTA_BUILD}

Wymagany silnik w panelu: MTA 1.6 Linux 32-bit (x86), build 24124.
Do mtaserver.conf dodaj:
  <module src=\"king.so\" />
  <resource src=\"object_preview\" startup=\"1\" protected=\"0\" />
  <resource src=\"mrp_models\" startup=\"1\" protected=\"0\" />
  <resource src=\"amx\" startup=\"1\" protected=\"0\" />
  <resource src=\"mrp_bridge\" startup=\"1\" protected=\"0\" />

Do grupy Admin w acl.xml dodaj:
  <object name=\"resource.amx\" />

Nie uruchamiaj ręcznie amx-mrucznik — zrobi to most po gotowości AMX.
"""
    (deploy / "MRP-LINUX-INSTALL.txt").write_text(instructions, encoding="utf-8")

    archive_path = output_dir / "Mrucznik-RP-MTA-ServerProject-Linux-x86.zip"
    archive_path.unlink(missing_ok=True)
    with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        for path in sorted(deploy.rglob("*")):
            if path.is_file():
                archive.write(path, path.relative_to(deploy).as_posix())

    database_path = output_dir / "Mrucznik-RP-MTA-ServerProject-database.sql"
    make_database_dump(project, database_path)
    manifest = {
        "platform": MTA_BUILD,
        "archive": archive_path.name,
        "archive_sha256": sha256(archive_path),
        "archive_bytes": archive_path.stat().st_size,
        "database": database_path.name,
        "database_sha256": sha256(database_path),
        "database_bytes": database_path.stat().st_size,
    }
    (output_dir / "ServerProject-SHA256.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    shutil.rmtree(work)
    return archive_path, database_path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--project", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--output", type=Path, default=Path("dist/linux"))
    parser.add_argument("--king-so", type=Path, required=True)
    parser.add_argument("--colandreas-so", type=Path, required=True)
    parser.add_argument("--mysql-host", default="__MYSQL_HOST__")
    parser.add_argument("--mysql-user", default="__MYSQL_USER__")
    parser.add_argument("--mysql-database", default="__MYSQL_DATABASE__")
    parser.add_argument("--mysql-password", default="__MYSQL_PASSWORD__")
    parser.add_argument("--redis-host", default="127.0.0.1")
    parser.add_argument("--redis-port", type=int, default=6379)
    parser.add_argument("--redis-password", default="")
    return parser.parse_args()


if __name__ == "__main__":
    archive, database = build(parse_args())
    print(archive)
    print(database)
