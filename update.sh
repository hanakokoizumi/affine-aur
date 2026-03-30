#!/bin/bash

LATEST_TAG=$(curl -sL https://api.github.com/repos/toeverything/AFFiNE/releases/latest | jq -r .tag_name)

if [ -z "$LATEST_TAG" ] ||[ "$LATEST_TAG" == "null" ]; then
    echo "获取最新版本失败！"
    exit 1
fi

LATEST_VER="${LATEST_TAG#v}"
CURRENT_VER=$(grep -Po '(?<=^pkgver=).*' PKGBUILD)

echo "最新版本: $LATEST_VER | 当前版本: $CURRENT_VER"

if [ "$LATEST_VER" != "$CURRENT_VER" ]; then
    echo "发现新版本，开始更新..."
    
    sed -i "s/^pkgver=.*/pkgver=$LATEST_VER/" PKGBUILD
    sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
    
    echo "正在下载 DEB 包并计算 sha256sums..."
    sudo -u builder updpkgsums
    
    sudo -u builder makepkg --printsrcinfo > .SRCINFO
    
    echo "UPDATED=true" >> $GITHUB_ENV
    echo "NEW_VER=$LATEST_VER" >> $GITHUB_ENV
else
    echo "当前已是最新版本，无需更新。"
    echo "UPDATED=false" >> $GITHUB_ENV
fi
