#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# Modify default golang
rm -rf feeds/packages/lang/golang
#svn co https://github.com/immortalwrt/packages/branches/openwrt-23.05/lang/golang feeds/packages/lang/golang
git clone --depth=1 -b 23.05 https://github.com/Lienol/openwrt-packages #https://github.com/immortalwrt/packages
cp -rf openwrt-packages/lang/golang feeds/packages/lang/  && rm -rf openwrt-packages
sed -i 's/ +libopenssl-legacy//g' package/small/shadowsocksr-libev/Makefile

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="yspcn"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"yspcn"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
