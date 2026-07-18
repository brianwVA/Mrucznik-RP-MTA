.PHONY: build build-prod

build:
	pawncc -ipawncc/include/ -Dgamemodes gamemodes/Kotnik-RP-MTA.pwn "-;+" "-(+" -d3 "-Z+"

build-prod:
	python3 ../mta/tools/build_kotnik_amx.py --source-root . --compiler "$$(command -v pawncc)"
