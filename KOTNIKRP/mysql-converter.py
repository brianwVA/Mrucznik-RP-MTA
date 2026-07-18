import re

script = '''p<|>s[20]s[20]s[20]s[20]s[20]dddddddddd",
		Fishes[playerid][pFish1],
		Fishes[playerid][pFish2],
		Fishes[playerid][pFish3],
		Fishes[playerid][pFish4],
		Fishes[playerid][pFish5],
		Fishes[playerid][pWeight1],
		Fishes[playerid][pWeight2],
		Fishes[playerid][pWeight3],
		Fishes[playerid][pWeight4],
		Fishes[playerid][pWeight5],
		Fishes[playerid][pFid1],
		Fishes[playerid][pFid2],
		Fishes[playerid][pFid3],
		Fishes[playerid][pFid4],
		Fishes[playerid][pFid5]'''

lines = script.splitlines()

for i in range(len(lines)):
    if i == 0:
        continue

    sscanf = lines[0]

    start_index = sscanf.find('p<|>') + len('p<|>')

    # Find the index of the next double quotation mark (")
    end_index = sscanf.find('"', start_index)

    # Extract the substring
    lol = sscanf[start_index:end_index]
    extracted = re.sub(r'\[\d+\]', '', lol)

    if extracted[i-1] == 's': value_type = ""
    if extracted[i-1] == 'd': value_type = "_int"
    if extracted[i-1] == 'f': value_type = "_float"
    if extracted[i-1] == 'l': value_type = "_bool"
    print(f"cache_get_value_index{value_type}(i, {i-1}, {lines[i].replace(',', '')});")