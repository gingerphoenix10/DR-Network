import os
import json
import shutil
import sys
if len(sys.argv) != 3:
    print("Usage: `Sprites_G3M2UTMT.py <input patch> <output project>`")
    exit()
path = os.path.join(sys.argv[1], "Sprites")
for dir in os.walk(path):
    if len(dir[1]) > 1:
        continue
    with open(os.path.join(dir[0], os.path.basename(dir[0])+".json"), encoding="utf-8-sig") as f:
        text = f.read()
        old = json.loads(text)
        new = {
            "$type": "Sprite",
            "DataName": "null",
            "Width": old["width"],
            "Height": old["height"],
            "MarginLeft": old["marginLeft"],
            "MarginRight": old["marginRight"],
            "MarginBottom": old["marginTop"],
            "MarginTop": old["marginBottom"],
            "Transparent": old["transparent"],
            "Smooth": old["smooth"],
            "Preload": old["preload"],
            "BBoxMode": old["bboxMode"],
            "CollisionKind": old["sepMasksDescription"],
            "OriginX": old["originX"],
            "OriginY": old["originY"],
            "TextureCount": old["textureCount"],
            "MaskCount": old["sepMasks"],
            "Sequence": "null"
        }
        newfile = os.path.basename(dir[0])+".json"
        writedir = os.path.join(sys.argv[2], "sprites", os.path.basename(dir[0]))
        writepath = os.path.join(writedir, newfile)
        os.makedirs(os.path.dirname(writepath), exist_ok=True)
        with open(writepath, 'w') as w:
            w.write(json.dumps(new, indent=4).replace("\"null\"", "null"))
        for infile in os.listdir(dir[0]):
            if infile.endswith(".png"):
                shutil.copyfile(os.path.join(dir[0], infile), os.path.join(writedir, infile))
print("done")