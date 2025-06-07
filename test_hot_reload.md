# Flutter Hot Reload Implementation for Zed Debugger

## Overview
This implementation adds hot reload functionality for Flutter when running with the debugger in Zed.

## Changes Made

### 1. Added HotReload Action
- Added `HotReload` to the debugger actions in `debugger_ui/src/debugger_ui.rs`
- Registered the action handler in the workspace

### 2. UI Integration
- Added a hot reload button in the debugger toolbar (only visible when debugging Dart/Flutter projects)
- The button uses the `RotateCw` icon
- Added tooltip "Hot Reload" for the button

### 3. Session Implementation
- Added `hot_reload()` method to `Session` in `project/src/debugger/session.rs`
- The method checks if the adapter is "Dart" before proceeding
- Uses the `$hotReload` evaluate expression, which is the standard way Flutter's debug adapter handles hot reload

### 4. Keybinding
- Added `Ctrl+R` as the hot reload keybinding for Linux

## How It Works

1. When the hot reload button is clicked or the keybinding is pressed:
   - The UI calls `hot_reload()` on the running state
   - The running state forwards the call to the session
   
2. The session:
   - Checks if the current debug adapter is "Dart"
   - Sends an evaluate request with the expression "$hotReload"
   - Flutter's debug adapter interprets this special expression as a hot reload command
   
3. The debug adapter performs the hot reload and returns the result
   - Success: Shows "Hot reload successful" in the console
   - Failure: Shows the error message in the console

## Testing

To test the hot reload functionality:

1. Start debugging a Flutter application
2. Make changes to the Flutter code
3. Either:
   - Click the hot reload button in the debugger toolbar (circular arrow icon)
   - Press `Ctrl+R` (Linux)
4. The hot reload should execute and show the result in the debug console

## Notes

- Hot reload is only available when debugging Flutter/Dart projects
- The button is only visible when the debug adapter is "Dart"
- Hot reload preserves the application state while updating the code
- This is different from hot restart (which resets the state)