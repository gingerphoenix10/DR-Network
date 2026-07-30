import os
import json
import shutil
import sys
if len(sys.argv) != 3:
    print("Usage: `Fonts_G3M2UTMT.py <input patch> <output project>`")
    exit()
path = os.path.join(sys.argv[1], "Fonts")
for dir in os.walk(path):
    if len(dir[1]) > 1:
        continue
    with open(dir[0]+"\\"+"font.json", encoding="utf-8-sig") as f:
        text = f.read()
        old = json.loads(text)
        new = {
            "$type": "Font",
            "DataName": "null",
            "DisplayName": old["displayName"],
            "EmSizeIsFloat": old["emSizeIsFloat"],
            "EmSize": old["emSize"],
            "Bold": old["bold"],
            "Italic": old["italic"],
            "RangeStart": old["rangeStart"],
            "Charset": old["charset"],
            "AntiAliasing": old["antiAliasing"],
            "RangeEnd": old["rangeEnd"],
            "ScaleX": old["scaleX"],
            "ScaleY": old["scaleY"],
            "Ascender": old["ascender"],
            "SDFSpread": old["sdfSpread"],
            "LineHeight": old["lineHeight"],
            "AscenderOffset": old["ascenderOffset"],
            "Glyphs": []
        }
        for glyph in old["glyphs"]:
            new["Glyphs"].append({
                "C":glyph["character"],
                "X":glyph["sourceX"],
                "Y":glyph["sourceY"],
                "W":glyph["sourceWidth"],
                "H":glyph["sourceHeight"],
                "S":glyph["shift"],
                "O":glyph["offset"],
                "K":[]
            })

        newfile = os.path.basename(dir[0])+".json"
        writedir = os.path.join(sys.argv[2], "fonts", os.path.basename(dir[0]))
        writepath = os.path.join(writedir, newfile)
        os.makedirs(os.path.dirname(writepath), exist_ok=True)
        with open(writepath, 'w') as w:
            w.write(json.dumps(new, indent=4).replace("\"null\"", "null"))
        if os.path.isfile(os.path.join(dir[0], "texture.png")):
            shutil.copyfile(os.path.join(dir[0], "texture.png"), writedir+"\\"+os.path.basename(dir[0])+".png")
print("done")