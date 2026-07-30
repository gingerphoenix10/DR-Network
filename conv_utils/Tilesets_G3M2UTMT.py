import os
import json
import shutil
import sys
if len(sys.argv) != 3:
    print("Usage: `Tilesets_G3M2UTMT.py <input patch> <output project>`")
    exit()
path = os.path.join(sys.argv[1], "Tilesets")
for file in os.listdir(path):
    if not file.endswith(".json"):
        continue
    with open(os.path.join(path, file), encoding="utf-8-sig") as f:
        old = json.loads(f.read())
        new = {
            "$type": "Background",
            "DataName": "null",
            "Transparent": old["transparent"],
            "Smooth": old["smooth"],
            "Preload": old["preload"],
            "Tileset": {
                "VersionNumber": old["gms2UnknownAlways2"], # This is probably version(?)
                "TileWidth": old["gms2TileWidth"],
                "TileHeight": old["gms2TileHeight"],
                "OutputBorderX": old["gms2OutputBorderX"],
                "OutputBorderY": old["gms2OutputBorderY"],
                "TileColumns": old["gms2TileColumns"],
                "ItemsPerTileCount": old["gms2ItemsPerTileCount"],
                "TileCount": old["gms2TileCount"],
                "ExportedSprite": "null", #gms2ExportedSpriteIndex?
                "FrameLength": old["gms2FrameLength"],
                "TileIDs": []
            }
        }

        if old["gms2TileCount"] > 0:
            for tileId in old["gms2TileIds"]:
                new["Tileset"]["TileIDs"].append(tileId)

        newfile = old["name"]+".json"
        dest = os.path.join(sys.argv[2], "backgrounds", old["name"])
        if os.path.isfile(os.path.join(path, old["name"]+".png")):
            os.makedirs(dest, exist_ok=True)
            with open(os.path.join(dest, newfile), 'w') as w:
                w.write(json.dumps(new, indent=4).replace("\"null\"", "null").replace("\"\"", "null"))
                shutil.copyfile(os.path.join(path, old["name"]+".png"), os.path.join(dest, old["name"]+".png"))

print("done.")