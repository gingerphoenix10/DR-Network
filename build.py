# Builds the modded data and xdelta files with the UndertaleModTool
# project applied for all base data files provided in BuildSources.json

# This script requires UndertaleModCli.exe (CLI version of UndertaleModTool)
# located in either the project folder, or in your PATH.
#
# For generation of patches, these executables are needed in one of the same locations:
# xdelta.exe / xdelta3.exe - xdelta
# G3MTool.exe - g3mpatch
# Deltamod is planned, however will be delayed until DeltamodCLI is more stable

import os
import sys
import json
import subprocess
import time

buildXdelta = True
buildG3MPatch = False

tempPath = dir_path = os.path.dirname(os.path.realpath(__file__))
os.chdir(tempPath)

buildPath = "build"

stdout = subprocess.DEVNULL
if ("-v" in sys.argv) or ("--verbose" in sys.argv):
    stdout = None

buildStart = time.time()

# Create folders & check file validity
if not os.path.isdir(buildPath):
    os.mkdir(buildPath)

if not os.path.isfile("BuildSources.json"):
    print("BuildSources.json not found in project")
    exit()

data = {}
with open("BuildSources.json", 'r') as sources:
    try:
        data = json.load(sources)
    except json.decoder.JSONDecodeError:
        print("Invalid Sources JSON file")
        exit()

if type(data) == list:
    print("Invalid Sources JSON. Root should be dict, not list")
    exit()

# Begin building sources
for key in data:
    print(f"\nAttempting to build {key}")

    # JSON validation
    if not "Data" in data[key]:
        print(f"Source \"{key}\" doesn't contain a Data filepath. Skipping")
        continue

    if not "OutputFile" in data[key]:
        print(f"Source \"{key}\" doesn't contain an Output file name. Skipping")
        continue

    if not os.path.isfile(data[key]["Data"]):
        print(f"Unable to find source {key}'s data file at `{data[key]["Data"]}`. Skipping")
        continue

    sourceBuild = os.path.join(buildPath, key)
    if not os.path.isdir(sourceBuild):
        os.mkdir(sourceBuild)

    # Start building project
    outputFile = os.path.join(sourceBuild, data[key]["OutputFile"])
    try:
        subprocess.run(["UndertaleModCli.exe", "project", "build", "project.json", "-s", data[key]["Data"], "-d", outputFile], stdout=stdout) 
    except FileNotFoundError:
        print("Unable to locate UndertaleModCli. Cancelling")
        exit()

    # Post-build (Delete json)

    # A quirk of UndertaleModTool and by extension CLI is that it will recursively search for
    # every json file anywhere in the project folder, whether it's related to the mod or not.
    # It also *creates* a json file when building a mod however, so we must remove it otherwise
    # it'll cause errors when trying to build from then on
    backupFile = os.path.join(sourceBuild, "mod-backup-manifest.json")
    if os.path.isfile(backupFile):
        os.remove(backupFile)

    if not os.path.isfile(outputFile):
        print(f"Something went wrong whilst building source {key}")
        continue
    print("Build successful")

    # Post-build (xdelta)
    if buildXdelta:
        print("Generating xdelta")
        outputXdelta = os.path.join(sourceBuild, key+".xdelta")
        command = ["xdelta.exe", "-f", "-e", "-s", data[key]["Data"], outputFile, outputXdelta]
        try:
            subprocess.run(command, stdout=stdout)
        except FileNotFoundError:
            try:
                command[0] = "xdelta3.exe"
                subprocess.run(command, stdout=stdout)
            except FileNotFoundError:
                print("Build xdelta is enabled, but xdelta.exe / xdelta3.exe could not be located. Skipping xdeltas")
                buildXdelta = False

        if buildXdelta:
            if not os.path.isfile(outputXdelta):
                print(f"Something went wrong whilst generating xdelta for source {key}")

    # Post-build (g3mpatch)
    if buildG3MPatch:
        print("Generating g3mpatch")
        outputG3M = os.path.join(sourceBuild, key+".g3mpatch")
        try:
            subprocess.run(["G3MTool.exe", "patch", "create", data[key]["Data"], outputFile, outputG3M], stdout=stdout)
        except FileNotFoundError:
            print("Build g3mpatch is enabled, but G3MTool.exe could not be located. Skipping g3mpatches")
            buildG3MPatch = False

        if buildG3MPatch:
            if not os.path.isfile(outputG3M):
                print(f"Something went wrong whilst generating g3mpatch for source {key}")

    print("Success!")

# Over-complicated elapsed time printing
elapsed = time.time() - buildStart

hours, rem = divmod(elapsed, 3600)
minutes, rem = divmod(rem, 60)
seconds, rem = divmod(rem, 1)
milliseconds = int(rem * 1000)

parts = []

if hours:
    parts.append(f"{int(hours)} hour{'s' if hours != 1 else ''}")
if minutes:
    parts.append(f"{int(minutes)} minute{'s' if minutes != 1 else ''}")
if seconds:
    parts.append(f"{int(seconds)} second{'s' if seconds != 1 else ''}")

# Always show milliseconds
parts.append(f"{milliseconds} millisecond{'s' if milliseconds != 1 else ''}")

print(f"\nAll builds complete in {' '.join(parts)}!")