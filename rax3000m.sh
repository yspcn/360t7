#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/ImmortalWrt/CMCC-rax3000m/g' package/base-files/files/bin/config_generate

# Modify default golang
rm -rf feeds/packages/lang/golang
#svn co https://github.com/immortalwrt/packages/branches/openwrt-23.05/lang/golang feeds/packages/lang/golang
git clone --depth=1 -b 23.05 https://github.com/Lienol/openwrt-packages #https://github.com/immortalwrt/packages
cp -rf openwrt-packages/lang/golang feeds/packages/lang/  && rm -rf openwrt-packages
#sed -i 's/ +libopenssl-legacy//g' package/small/shadowsocksr-libev/Makefile

# tailscale install
mkdir -p package/utils/ucode
wget -P package/utils/ucode/ https://github.com/openwrt/openwrt/raw/openwrt-22.03/package/utils/ucode/Makefile
#git clone --depth=1 -b openwrt-23.05 https://github.com/openwrt/packages packages-temp
#rm -rf feeds/packages/net/tailscale && cp -rf packages-temp/net/tailscale feeds/packages/net/
#rm -rf packages-temp
rm -f feeds/packages/net/tailscale/Makefile
wget -P feeds/packages/net/tailscale/ https://github.com/openwrt/packages/raw/openwrt-23.05/net/tailscale/Makefile
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
rm -rf package/feeds/luci/luci-app-ipsec-vpnd package/feeds/luci/luci-app-ipsec-vpnserver-manyusers package/openwrt-packages/luci-app-homeproxy
cd package/small/luci-app-passwall && git reset --hard c2108834abea9cbb7248400bc3d94743516eb921 && cd ../../
cd package/small/luci-app-passwall2 && git reset --hard c2108834abea9cbb7248400bc3d94743516eb921 && cd ../../

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="yspcn"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"yspcn"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
