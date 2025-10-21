mkdir -p Zed.app/Contents/MacOS
mkdir -p Zed.app/Contents/Resources

# Copy your binary
cp target/release/zed Zed.app/Contents/MacOS/Zed

# Create minimal Info.plist
cat > Zed.app/Contents/Info.plist <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleExecutable</key>
  <string>Zed</string>
  <key>CFBundleIdentifier</key>
  <string>dev.zed.custom</string>
  <key>CFBundleName</key>
  <string>Zed</string>
  <key>CFBundleVersion</key>
  <string>1.0</string>
  <key>CFBundlePackageType</key>
  <string>APPL</string>
</dict>
</plist>
EOF

