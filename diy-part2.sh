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

# Modify hostname
sed -i 's/OpenWrt/Acrh17/g' package/base-files/files/bin/config_generate

# 取消bootstrap为默认主题
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
# 替换默认官方源为腾讯源
sed -i "24i sed -i 's/downloads.openwrt.org/mirrors.cloud.tencent.com\/openwrt/g' /etc/opkg/distfeeds.conf" package/default-settings/files/zzz-default-settings

# 修改luci默认分类
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/aria2.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/services/nas/g' /usr/lib/lua/luci/view/aria2/overview_status.htm" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/hd_idle.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba4.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/minidlna.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/transmission.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/mjpg-streamer.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/p910nd.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/usb_printer.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/xunlei.lua" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/services/nas/g'  /usr/lib/lua/luci/view/minidlna_status.htm" package/default-settings/files/zzz-default-settings
#sed -i "25i sed -i 's/services/nas/g' /usr/lib/lua/luci/controller/fileassistant.lua" package/default-settings/files/zzz-default-settings

# 删除原主题包
rm -rf package/lean/luci-theme-argon
# rm -rf openwrt/package/lean/luci-theme-netgear

# 添加新的主题包
# git clone https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# git clone https://github.com/sypopo/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial
# git clone https://github.com/sypopo/luci-theme-argon-mc.git package/lean/luci-theme-argon-mc
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat
git clone https://github.com/garypang13/luci-theme-edge.git package/lean/luci-theme-edge

# 更新
# ./scripts/feeds update -a && ./scripts/feeds install -a

##########
# Modify the version number
#sed -i "s/OpenWrt /Leopard build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile



# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="eysp"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"Leopard"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config


# 删除lean里的百度文本（编译失败），增加百度PCS-web
# rm -rf package/lean/baidupcs-web
# git clone https://github.com/liuzhuoling2011/baidupcs-web.git package/lean/baidupcs-web
