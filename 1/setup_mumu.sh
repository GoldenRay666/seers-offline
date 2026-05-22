#!/bin/bash
# ===================================================
# Setup script for offline MuMu emulator testing
# Run after MuMu emulator is started
# ===================================================
set -e

ADB="D:/MuMuPlayer/nx_device/12.0/shell/adb.exe"
APK="C:/javatools/1_offline.apk"

echo "=== Step 1: Connect ADB to MuMu ==="
"$ADB" connect 127.0.0.1:16384 2>&1 || true
"$ADB" connect 127.0.0.1:7555 2>&1 || true
"$ADB" connect 127.0.0.1:5555 2>&1 || true

echo "=== Step 2: Check device ==="
"$ADB" devices

echo "=== Step 3: Set up reverse port forwarding ==="
echo "  HTTP Login Server: 127.0.0.1:8000 -> host:8000"
"$ADB" reverse tcp:8000 tcp:8000 2>&1 || echo "  (may need to run adb root first)"
echo "  TCP Login Server: 127.0.0.1:8001 -> host:8001"
"$ADB" reverse tcp:8001 tcp:8001 2>&1 || true
echo "  TCP Game Server: 127.0.0.1:8002 -> host:8002"
"$ADB" reverse tcp:8002 tcp:8002 2>&1 || true

echo "=== Step 4: Install APK ==="
"$ADB" install -r "$APK" 2>&1

echo "=== Step 5: Start logcat ==="
echo "Starting logcat... (Ctrl+C to stop)"
"$ADB" logcat -v time | grep -iE "seer|taomee|cocos|error|crash|fatal|lua|network|connect"
