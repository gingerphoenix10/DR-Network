from pathlib import Path
import filecmp
import shutil
import os
import sys

if len(sys.argv) != 4:
    print("Usage: `CodeEntry_CopyDiff.py <input patch 1> <input patch 2> <output project>`")
    exit()

dir1 = Path(os.path.join(sys.argv[1], "CodeEntries"))
dir2 = Path(os.path.join(sys.argv[2], "CodeEntries"))
output = os.path.join(sys.argv[3], "code")

def compare(d1, d2, out):
    cmp = filecmp.dircmp(d1, d2)

    # Files in both but with different contents
    for name in cmp.diff_files:
        oldpath = os.path.join(d2, name)
        newpath = os.path.join(out, name)
        if (os.path.isfile(oldpath)):
            print(oldpath)
            shutil.copyfile(oldpath, newpath)

    # Recurse into subdirectories
    for sub in cmp.common_dirs:
        compare(d1 / sub, d2 / sub)

compare(dir1, dir2, output)