#!/bin/bash
packages=("packagel" "package2" "package3")
for package in "${packages[@]}"; do
  sudo apt-get install "$package"-y
done
echo "Packages installed successfully."
