# Simple script to transfer a data.win file to Nintendo Switch over USB.
# Currently only supports UMS transfer, but FTP / MTP may be added later
import os
import shutil
import math
from ftplib import FTP
progress = False
try:
    from tqdm import tqdm
except ImportError:
    progress = False

Mode = "FTP"
SourceName = "Nintendo Switch v240"
Chapter = 5

# UMS
SwitchDrive = "F"

# FTP
IP = "192.168.1.69"
Port = 5000

tempPath = dir_path = os.path.dirname(os.path.realpath(__file__))
os.chdir(tempPath)

buildPath = "build"
fileName = "game.win"

if Mode == "USB_UMS":
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

elif Mode == "FTP":
    # Connect
    try:
        ftp = FTP()
        print(ftp.connect(IP, Port))
    except TimeoutError:
        print("Could not connect to Nintendo Switch. Please ensure FTP is running, and that the IP and Port in the script are correct")
        exit()
    print(ftp.login())

    # Enter /atmosphere/contents/ whilst checking existance
    atmosphere = "atmosphere/contents"
    for pathSection in atmosphere.split("/"):
        found = False
        for name, data in list(ftp.mlsd()):
            if name == pathSection and data["type"] == "dir":
                found = True
                break
        if not found:
            print("Could not locate Atmosphère's LayeredFS contents. Make sure that you're connected to the right ftp server I guess? Idk what else would cause this")
            print(ftp.quit())
            exit()
        print(ftp.cwd(pathSection))
    # CWD = /atmosphere/contents/

    src = os.path.join(buildPath, SourceName, fileName)
    if not os.path.isfile(src):
        print(f"Unable to locate {fileName} inside {buildPath}/{SourceName}")
        exit()

    # Check for DELTARUNE title ID. Move into if exists, otherwise create and enter
    foundTitle = False
    titleId = "0100a0d022a68000"
    for name, data in list(ftp.mlsd()):
        if name == titleId and data["type"] == "dir":
            foundTitle = True
            break
    if not foundTitle:
        print(ftp.mkd(titleId))
    print(ftp.cwd(titleId))

    # Same as above but looks for romfs in title id
    foundRomFS = False
    for name, data in list(ftp.mlsd()):
        if name == "romfs" and data["type"] == "dir":
            foundRomFS = True
            break
    if not foundRomFS:
        print(ftp.mkd("romfs"))
    print(ftp.cwd("romfs"))

    # Return to this CWD after installing Data (could be in chapter folder) for external assets
    romfsDir = ftp.pwd()
    print(romfsDir)

    # Create and enter chapter folder if set
    if Chapter != None:
        chapterdest = f"chapter{Chapter}_switch"
        foundChapter = False
        for name, data in list(ftp.mlsd()):
            if name == chapterdest and data["type"] == "dir":
                foundChapter = True
                break
        if not foundChapter:
            print(ftp.mkd(chapterdest))
        print(ftp.cwd(chapterdest))
    with open(src, 'rb') as data:
        # Source - https://stackoverflow.com/a/44991436
        # Posted by MatthewEnderle
        # Retrieved 2026-07-27, License - CC BY-SA 3.0
        filesize = os.path.getsize(src)
        if progress:
            with tqdm(unit = 'blocks', unit_scale = True, leave = False, miniters = 1, desc = 'Uploading......', total = filesize) as tqdm_instance:
                    ftp.storbinary('STOR ' + fileName, data, 2048, callback = lambda sent: tqdm_instance.update(len(sent)))
        else:
            uploaded = 0
            def progUpdate(amnt):
                global uploaded
                uploaded += amnt
                print(f"{str(uploaded/filesize*100)}%")

            ftp.storbinary('STOR ' + fileName, data, 2048, callback = lambda sent: progUpdate(len(sent)))
            

    # Return to romfs and load external assets
    print(ftp.cwd(romfsDir))

    print(ftp.quit())
    exit()