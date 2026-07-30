import os
import json
from enum import IntFlag
import sys
class RoomFlags(IntFlag):
    EnableViews = 1
    ClearViewBackground = 2
    DoNotClearDisplayBuffer = 4,
    IsGMS2_3 = 65536
    IsGMS2 = 131072
    IsGM2024_13 = 262144

if len(sys.argv) != 3:
    print("Usage: `Rooms_G3M2UTMT.py <input patch> <output project>`")
    exit()
path = os.path.join(sys.argv[1], "Rooms")
for dir in os.walk(path):
    if len(dir[1]) > 1:
        continue
    with open(os.path.join(dir[0], "room.json")) as f:
        old = json.load(f)
        flagString = ", ".join(
            flag.name
            for flag in RoomFlags
            if flag & old["flags"]
        )
        new = {
            "$type": "Room",
            "DataName": "",
            "Caption": old["caption"],
            "Width": old["width"],
            "Height": old["height"],
            "Speed": 0,
            "Persistent": old["persistent"],
            "BackgroundColor": old["backgroundColor"],
            "DrawBackgroundColor": old["drawBackgroundColor"],
            "CreationCodeEntry": old["creationCodeId"],
            "Flags": flagString,
            "World": old["world"],
            "Top": old["top"],
            "Left": old["left"],
            "Right": old["right"],
            "Bottom": old["bottom"],
            "GravityX": old["gravityX"],
            "GravityY": old["gravityY"],
            "MetersPerPixel": old["metersPerPixel"],
            "Backgrounds": old["backgrounds"], #no idea if this is correct
            "Views": [],
            "GameObjects": [],
            "Tiles": [],
            "Layers": [],
            "InstanceCreationOrderIDs": "",
            "Sequences": []
        }
        for view in old["views"]:
            new["Views"].append({
                "Enabled": view["enabled"],
                "ViewX": view["viewX"],
                "ViewY": view["viewY"],
                "ViewWidth": view["viewWidth"],
                "ViewHeight": view["viewHeight"],
                "PortX": view["portX"],
                "PortY": view["portY"],
                "PortWidth": view["portWidth"],
                "PortHeight": view["portHeight"],
                "BorderX": view["borderX"],
                "BorderY": view["borderY"],
                "SpeedX": view["speedX"],
                "SpeedY": view["speedY"],
                "FollowsObject": view["objectId"]
            })
        
        for gameObject in old["gameObjects"]:
            new["GameObjects"].append({
                "ObjectName": gameObject["objectDefinition"],
                "X": gameObject["x"],
                "Y": gameObject["y"],
                "CreationCodeEntry": gameObject["creationCode"],
                "ScaleX": gameObject["scaleX"],
                "ScaleY": gameObject["scaleY"],
                "Color": gameObject["color"],
                "Rotation": gameObject["rotation"],
                "PreCreateCodeEntry": gameObject["preCreateCode"],
                "ImageSpeed": gameObject["imageSpeed"],
                "ImageIndex": gameObject["imageIndex"]
            })

        for layer in old["layers"]:
            if layer["layerType"] == 1:
                new["Layers"].append({
                    "$type": "BackgroundLayer",
                    "BackgroundVisible": layer["backgroundData"]["visible"],
                    "Foreground": layer["backgroundData"]["foreground"],
                    "Sprite": layer["backgroundData"]["sprite"],
                    "TiledHorizontally": layer["backgroundData"]["tiledHorizontally"],
                    "TiledVertically": layer["backgroundData"]["tiledVertically"],
                    "Stretch": layer["backgroundData"]["stretch"],
                    "Color": layer["backgroundData"]["color"],
                    "FirstFrame": layer["backgroundData"]["firstFrame"],
                    "AnimationSpeed": layer["backgroundData"]["animationSpeed"],
                    "AnimationSpeedType": "FramesPerSecond", #not sure the enum
                    "Name": layer["layerName"],
                    "ID": layer["layerId"],
                    "Depth": layer["layerDepth"],
                    "XOffset": layer["xOffset"],
                    "YOffset": layer["yOffset"],
                    "HSpeed": layer["hSpeed"],
                    "VSpeed": layer["vSpeed"],
                    "IsVisible": layer["isVisible"]
                })
            elif layer["layerType"] == 2:
                instLayer = {
                    "$type": "InstancesLayer",
                    "InstanceIndices": [],
                    "Name": layer["layerName"],
                    "ID": layer["layerId"],
                    "Depth": layer["layerDepth"],
                    "XOffset": layer["xOffset"],
                    "YOffset": layer["yOffset"],
                    "HSpeed": layer["hSpeed"],
                    "VSpeed": layer["vSpeed"],
                    "IsVisible": layer["isVisible"]
                }
                for instanceId in layer["instanceIds"]:
                    i = 0
                    for gameObject in old["gameObjects"]:
                        if gameObject["instanceID"] == instanceId:
                            instLayer["InstanceIndices"].append(i)
                            break;
                        i += 1
                new["Layers"].append(instLayer)
            elif layer["layerType"] == 3:
                assetLayer = {
                    "$type": "AssetsLayer",
                    "LegacyTiles": layer["assetsData"]["legacyTiles"],
                    "Sprites": [],
                    "Sequences": [],
                    "NineSlices": "",
                    "ParticleSystems": "",
                    "TextItems": "",
                    "Name": layer["layerName"],
                    "ID": layer["layerId"],
                    "Depth": layer["layerDepth"],
                    "XOffset": layer["xOffset"],
                    "YOffset": layer["yOffset"],
                    "HSpeed": layer["hSpeed"],
                    "VSpeed": layer["vSpeed"],
                    "IsVisible": layer["isVisible"]
                }
                for sprite in layer["assetsData"]["sprites"]:
                    assetLayer["Sprites"].append({
                        "Name": sprite["name"],
                        "Sprite": sprite["sprite"],
                        "X": sprite["x"],
                        "Y": sprite["y"],
                        "ScaleX": sprite["scaleX"],
                        "ScaleY": sprite["scaleY"],
                        "Color": sprite["color"],
                        "AnimationSpeed": sprite["animationSpeed"],
                        "AnimationSpeedType": "FramesPerSecond",
                        "FrameIndex": sprite["frameIndex"],
                        "Rotation": sprite["rotation"]
                    })
                new["Layers"].append(assetLayer)
            elif layer["layerType"] == 4:
                tilesLayer = {
                    "$type": "TilesLayer",
                    "Background": layer["tilesBackground"],
                    "TilesX": layer["tilesX"],
                    "TilesY": layer["tilesY"],
                    "TileData": [],
                    "Name": layer["layerName"],
                    "ID": layer["layerId"],
                    "Depth": layer["layerDepth"],
                    "XOffset": layer["xOffset"],
                    "YOffset": layer["yOffset"],
                    "HSpeed": layer["hSpeed"],
                    "VSpeed": layer["vSpeed"],
                    "IsVisible": layer["isVisible"]
                }
                for sublist in layer["tileData"]:
                    for tile in sublist:
                        tilesLayer["TileData"].append(tile)
                new["Layers"].append(tilesLayer)

            else:
                print(old["name"])
                raise Exception("Unknown type "+str(layer["layerType"]))

        newfile = old["name"]+".json"
        writepath = os.path.join(sys.argv[2], "rooms", newfile)
        os.makedirs(os.path.dirname(writepath), exist_ok=True)
        with open(writepath, 'w') as w:
            w.write(json.dumps(new, indent=4).replace("\"null\"", "null").replace("\"\"", "null"))
print("done")