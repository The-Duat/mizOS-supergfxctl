local packageInfo = {}

packageInfo.exists = true -- Do not edit.



packageInfo.pacman_depends = {"curl", "git", "base-devel", "pkg-config"}

packageInfo.aur_depends = {}



packageInfo.install = [[
#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

rm -rf /var/mizOS/download/*
cd /var/mizOS/download

git clone https://gitlab.com/asus-linux/supergfxctl.git
cd supergfxctl
make && sudo make install
sudo systemctl enable supergfxd.service --now
]]



packageInfo.remove = [[
#!/bin/bash

rm -rf /var/mizOS/download/*
cd /var/mizOS/download

git clone https://gitlab.com/asus-linux/supergfxctl.git
cd supergfxctl
make && sudo make uninstall
]]



packageInfo.update = [[
#!/bin/bash

rm -rf /var/mizOS/download/*
cd /var/mizOS/download

git clone https://gitlab.com/asus-linux/supergfxctl.git
cd supergfxctl
make && sudo make update
]]



return packageInfo
