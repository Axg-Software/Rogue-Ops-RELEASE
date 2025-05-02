# ChangeLog
This is inspired by the [FNF changelog](https://github.com/FunkinCrew/Funkin/blob/main/CHANGELOG.md?plain=1)

Written by [Axuko](https://github.com/Ethan-makes-music?tab=repositories)

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