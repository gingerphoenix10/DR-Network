# Conversion Utils
This project originally was made without an attached UTMT project, and relied on the `.g3mpatch` file format to export just the resources used in the mod.
Since creating one however, I decided to make the process a little easier by creating some simple conversion scripts to convert from the g3mpatch asset format to UTMT projects' format. This folder contains all of these script, however be warned that these were made specifically for this project and were very rushfully made just to get it done quickly, with the only updates being to allow argument paths rather than hardcoded ones. Because of this, I can't promise they'll work perfectly for any other projects. Despite that, I've decided to open source them anyways, and you can feel free to PR any changes you think would improve them.
They're also all designed for Windows and likely won't work on other operating systems without rewriting

## Usage
Most scripts take two parameters - The g3mpatch folder that contains the assets to convert, and the UTMT project folder to write the converted files to.

Example:
```bat
py GameObjects_G3M2UTMT.py "C:\Program Files (x86)\Steam\steamapps\common\DELTARUNE\chapter5_windows\ExampleG3MPatch" "C:\Program Files (x86)\Steam\steamapps\common\DELTARUNE\chapter5_windows\ExampleUTMTProject"
```

You can check what parameters each script take by either running without any, or by finding the script below:

# Files
## CodeEntry_CopyDiff.py
Searches through the two provided patches for each GML CodeEntry included in both patches, and finds every script that has different content between the two paths. If any do, then the file from the second path will be copied to the output project

Usage:
```bat
py CodeEntry_CopyDiff.py <input patch 1> <input patch 2> <output project>
```

## GameObjectS_G3M2UTMT.py
Finds each GameObject in the input patch, and converts it to UTMT's project format before exporting to the output project path. An example of this script is shown above under the main "Usage" section

Usage:
```bat
py GameObjects_G3M2UTMT.py <input patch> <output project>
```

## Rooms_G3M2UTMT.py
Finds each room in the input patch, and converts it to UTMT's project format before exporting to the output project path

Usage:
```bat
py Rooms_G3M2UTMT.py <input patch> <output project>
```

## Sprites_G3M2UTMT.py
Finds each sprite in the input patch, and converts it to UTMT's project format before exporting to the output project path

Usage:
```bat
py Sprites_G3M2UTMT.py <input patch> <output project>
```

## Sounds_G3M2UTMT.py
Finds each sound in the input patch, and converts it to UTMT's project format before exporting to the output project path

Usage:
```bat
py Sounds_G3M2UTMT.py <input patch> <output project>
```

## Tilesets_G3M2UTMT.py
Finds each tileset in the input patch, and converts it to UTMT's project format before exporting to the output project path

Usage:
```bat
py Tilesets_G3M2UTMT.py <input patch> <output project>
```

## Fonts_G3M2UTMT.py
Finds each font in the input patch, and converts it to UTMT's project format before exporting to the output project path

Usage:
```bat
py Fonts_G3M2UTMT.py <input patch> <output project>
```