import os
import json
import shutil
import sys
if len(sys.argv) != 3:
    print("Usage: `Sounds_G3M2UTMT.py <input patch> <output project>`")
    exit()
path1 = os.path.join(sys.argv[1], "Sounds")
path2 = os.path.join(sys.argv[1], "EmbeddedAudio")
for dir in os.walk(path1):
    if len(dir[1]) > 1:
        continue
    with open(os.path.join(dir[0], os.path.basename(dir[0])+".json"), encoding="utf-8-sig") as f:
        old = json.loads(f.read())
        embeddedName = "audio_"+str(old["audioID"]).rjust(4, '0')
        if not os.path.isdir(os.path.join(path2, embeddedName)):
            continue

        new = {
            "$type": "Sound",
            "DataName": "",
            "Filename": old["file"],
            "Type": old["type"],
            "Volume": old["volume"],
            "Pitch": old["pitch"],
            "Streamed": False,
            "DecompressOnLoad": not old["preload"],
            "GroupID": old["groupID"],
            "Effects": old["effects"],
            "AudioLength": 0
        }

        newfile = old["name"]+".json"
        dest = os.path.join(sys.argv[2], "sounds", old["name"])
        if os.path.isfile(os.path.join(path2, embeddedName, embeddedName+".bin")):
            os.makedirs(dest, exist_ok=True)
            with open(os.path.join(dest, newfile), 'w') as w:
                w.write(json.dumps(new, indent=2).replace("\"null\"", "null").replace("\"\"", "null"))
                shutil.copyfile(os.path.join(path2, embeddedName, embeddedName+".bin"), os.path.join(dest, old["name"]+old["type"]))
print("done")