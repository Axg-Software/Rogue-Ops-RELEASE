# ChangeLog
This is inspired by the [FNF changelog](https://github.com/FunkinCrew/Funkin/blob/main/CHANGELOG.md?plain=1)

Written by [Axuko](https://github.com/Ethan-makes-music?tab=repositories)

## V1.3.0 - 7-18-25
### Added
- Full Controller Support
    - For CO-OP the controller only works for player 1
    - You can enable controller support by going in the options menu
- A .txt file that explains the story for the campaign
- A easter egg somewhere in the menu ;> (Only able to acess with KBM)
- A a keybind to erase your save data (R + S)
- A Running animation for player 1
### Changed
- Made cursor hide whenever you go into CampaignTransitionState
### Fixed
- A bug where after you finish campaign you enter the options menu
### Removed
- The video in assets to reduce game size

## V1.2.0 - 6-9-25
### Added
- Offically added back player levels and they are fully working!
- After u complete a co-op game u have a results screen and it shows how much xp you gained
- When u hover over one of the level select buttons its grows a little
- Whenever u click your mouse button u hear a click sound
- A custom cursor
- Added a quit button to the Level select state (You can still use backspace if you really want to tho)
### Changed
- Made it so cursor hides in game (ONLY FOR CO-OP)
- Made it so cursor hides in the splashscreen
### Fixed
- Fixed the save button still apearing in the pause menu
- Bug where if you press replay after you finish the CO-OP game you get a black bg with dev textures
### Removed
- Beta stuff in the files

## V1.1.0 – 5-2-25
### Added
- HTML5 port
- An option to always skip the splash screen
- A level select screen after pressing the CO-OP button (which you can leave by pressing backspace)
### Changed
- Replaced `.axh` file saving with `FlxG.save` to make the code cleaner and more efficient
### Fixed
- Removed the stray `~` before `package;` in `SplashScreenState.hx`
- Fixed the bug where restarting the game mid-campaign caused a black screen
- Fixed stuttering when loading into a new level during the campaign
- Stopped that one sound from continuing after leaving `MenuState.hx`
### Removed
- `DialogueSystem.hx` (was never used)
- Levels in the pause and main menus (might re-add later)
- The save button in the pause menu (it didn’t serve a purpose)

## V1.0.0 - 4-4-25
### Added
- First release of the game.