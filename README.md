# DELTARUNE: Network Ported
DR: Network Ported is a W.I.P port of CMD28's DELTARUNE: Network mod to Chapter 5, as well as potentially updating previous chapters to the latest version of the game.

This repository is in the UndertaleModTool project structure, and can be loaded by opening Chapter 5's data.win file in UndertaleModTool, then browsing to `Project -> Open Project`.

The original chapter 5 port I was working on was just a straight .win file patch, so this is a remake in the UTMT format to make it significantly easier to work on. This does mean however that features I've previously shown off working may not work anymore, but will be fixed in later patches.

DO NOT EXPECT THIS TO BE STABLE. It is still very experimental. There will be a gamebanana release once I think it's stable enough for one.

# Platform compatibility

| Platform | Tested | Can Connect | Can Host | Can change type (IP, Port, Name) | Extra Notes |
| -------- | ------ | ----------- | -------- | -------------------------------- | ----------- |
| Windows  |   ✅   |     ✅     |    ✅    |                ✅               |             |         
| MacOS    |   ❌   |             |          |                                  |             |
| Linux    |   ✅   |     ❌     |    ❌    |                ✅               | Only tested on SteamOS in Game Mode. Tried on the current Proton Stable (Proton 11.0-2) and Proton Experimental (as of 2026-11-13).<br>Hosting claims the address is already in use, and joining claims the server doesn't exist |
| Switch 1 |   ✅   |     ✅     |    ✅    |                ❌               |             |
| Switch 2 |   ❌   |             |          |                                  |             |
| PS4      |   ✅   |     ✅     |    ✅    |                ❌               |             |
| PS5      |   ❌   |             |          |                                  |             |
| [Butterscotch](https://github.com/ButterscotchRunner/Butterscotch) | ✅ | ❌ | ❌ | ℹ️ | Only tested on Butterscotch's official Windows runner.<br>Host and connect seem to be emulated to always return a success making it seem in-game like you're connected, however it never actually attempts to connect or host a server.<br>Typing works on the tested Windows build, however backspace does noto. Likely also does not work on any console versions of Butterscotch |
