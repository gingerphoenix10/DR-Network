# Simple script to transfer a data.win file to Nintendo Switch over USB.
# Currently only supports UMS transfer, but FTP / MTP may be added later
import os
import shutil

SourceName = "Nintendo Switch v240"
Chapter = 5
SwitchDrive = "F"

tempPath = dir_path = os.path.dirname(os.path.realpath(__file__))
os.chdir(tempPath)

buildPath = "build"
fileName = "game.win"

atmosphere = os.path.join(SwitchDrive+":", "atmosphere", "contents")
dest = os.path.join(atmosphere, "0100a0d022a68000", "romfs")
chapterdest = dest
if Chapter != None:
    chapterdest = os.path.join(dest, f"chapter{Chapter}_switch")

if not os.path.isdir(atmosphere):
    print("Could not locate Atmosphère's LayeredFS contents. Please ensure your switch is in UMS mode or your SD Card is inserted, and that the drive letter in the script is accurate")
    exit()

src = os.path.join(buildPath, SourceName, fileName)
if not os.path.isfile(src):
    print(f"Unable to locate {fileName} inside {buildPath}/{SourceName}")
    exit()

try:
    os.makedirs(chapterdest, exist_ok=True)
    shutil.copyfile(src, os.path.join(chapterdest, fileName))
except Exception as e:
    print("Something went wrong whilst transferring file: "+str(e))
    exit()

# mus is required otherwise the game will crash attempting to load them, unlike PC which just continues anyways
if os.path.isdir("External Assets"):
    print("Successfully transfered data file. Starting transfer of external assets")
    try:
        shutil.copytree("External Assets", dest, dirs_exist_ok=True)
    except Exception as e:
        print("Something went wrong whilst transferring file: "+str(e))
        exit()

print("Success")