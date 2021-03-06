#!/usr/bin/env bash

cat << ALLDONE > ~/Library/LaunchAgents/pl.andsn.upkeep2.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>pl.andsn.upkeep2</string>
    <key>ProgramArguments</key>
    <array>
      <string>$(which upkeep)</string>
    </array>
    <key>EnvironmentVariables</key>
    <dict>
      <key>PATH</key>
      <string>$PATH</string>
      <key>TERM</key>
      <string>xterm-color</string>
    </dict>
    <key>StartCalendarInterval</key>
    <dict>
      <key>Hour</key>
      <integer>15</integer>
      <key>Minute</key>
      <integer>30</integer>
    </dict>
    <key>RunAtLoad</key>
    <string>true</string>
  </dict>
</plist>
ALLDONE

launchctl unload ~/Library/LaunchAgents/pl.andsn.upkeep2.plist
launchctl load ~/Library/LaunchAgents/pl.andsn.upkeep2.plist

