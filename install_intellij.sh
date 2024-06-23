#!/bin/bash

# Update package list
sudo apt update

# Install prerequisites
sudo apt install -y wget

# Download IntelliJ IDEA tarball from JetBrains
wget https://download.jetbrains.com/idea/ideaIC-2023.1.1.tar.gz -P /tmp

# Extract the tarball to /opt
sudo tar -xzf /tmp/ideaIC-2023.1.1.tar.gz -C /opt

# Create a symbolic link to the IntelliJ IDEA binary
sudo ln -s /opt/idea-IC-231.8770.65/bin/idea.sh /usr/local/bin/idea

# Clean up
rm /tmp/ideaIC-2023.1.1.tar.gz

# Optional: Create a desktop entry
cat <<EOF | sudo tee /usr/share/applications/intellij-idea.desktop
[Desktop Entry]
Name=IntelliJ IDEA Community Edition
Comment=Capable and Ergonomic IDE for JVM
Exec=/opt/idea-IC-231.8770.65/bin/idea.sh %f
Icon=/opt/idea-IC-231.8770.65/bin/idea.png
Terminal=false
Type=Application
Categories=Development;IDE;
StartupWMClass=jetbrains-idea-ce
EOF

