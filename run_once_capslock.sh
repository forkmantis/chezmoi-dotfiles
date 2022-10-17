#!/usr/bin/env bash

# Quit System Preferences so it doesn't muck with your settings
osascript -e 'tell application "System Preferences" to quit'

# Remap caps-lock to escape
hidutil property --set '{
  "UserKeyMapping":[{
    "HIDKeyboardModifierMappingSrc":0x700000039,
    "HIDKeyboardModifierMappingDst":0x700000029
  }]
}'