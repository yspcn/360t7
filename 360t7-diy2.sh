#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
# sed '1,3s/my/your/g'
# sed -i '93s/0xf60000/0x1fb0000/g' target/
#=================================================
# Modify default IP
# sed -i 's/15744/32448/g'
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# Modify hostname
sed -i 's/ImmortalWrt/OpenWrt-360T7/g' package/base-files/files/bin/config_generate

# 取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 删除原主题包
#rm -rf package/lean/luci-theme-argon
# rm -rf openwrt/package/lean/luci-theme-netgear

# 添加新的主题包
# git clone https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# git clone https://github.com/sypopo/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial
# git clone https://github.com/sypopo/luci-theme-argon-mc.git package/lean/luci-theme-argon-mc
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat
#git clone https://github.com/garypang13/luci-theme-edge.git package/lean/luci-theme-edge
git clone https://github.com/gngpp/luci-theme-design package/luci-theme-design

# 更新
# ./scripts/feeds update -a && ./scripts/feeds install -a

##########
# Modify the version number
#sed -i "s/OpenWrt /ysp build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/emortal/default-settings/files/zzz-default-settings

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#rm -rf feeds/packages/lang/golang
#git clone --depth=1 -b 23.05 https://github.com/Lienol/openwrt-packages #https://github.com/immortalwrt/packages
#cp -rf openwrt-packages/lang/golang feeds/packages/lang/  && rm -rf openwrt-packages

sed -i 's/ +libopenssl-legacy//g' package/small/shadowsocksr-libev/Makefile
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

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="yspcn"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"yspcn"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
