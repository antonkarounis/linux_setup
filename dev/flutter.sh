#!/bin/bash
set -e

sudo apt install -y clang ninja-build mesa-utils libgtk-3-dev
sudo apt install -y android-sdk-platform-tools-common

# --- Config ---
FLUTTER_DIR="${HOME}/flutter"
FLUTTER_SDK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.6-stable.tar.xz"

# --- Clean up any old install ---
rm -rf "${FLUTTER_DIR}"

# --- Download & extract ---
curl -o flutter_sdk.tar.xz -L "${FLUTTER_SDK}"
mkdir -p "${FLUTTER_DIR}"
tar -xf flutter_sdk.tar.xz -C "${HOME}"
rm flutter_sdk.tar.xz

# --- Add to PATH ---
if ! grep -q 'flutter/bin' "${HOME}/.bashrc"; then
  echo "export PATH=\"\$PATH:${FLUTTER_DIR}/bin\"" >> "${HOME}/.bashrc"
fi
export PATH="$PATH:${FLUTTER_DIR}/bin"

# --- Verify ---
flutter --version
