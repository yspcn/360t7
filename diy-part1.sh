#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================
# Ôö¼Óhttps://github.com/kenzok8/openwrt-packagesµ½¸üÐÂÔ´
# src-git kenzo https://github.com/kenzok8/openwrt-packages

# fw876/helloworld
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# sed -i 's@coolsnowwolf/packages@P3TERX/packages@' feeds.conf.default

#»ñÈ¡Lienol-xiaorouji-passwall
# git clone https://github.com/xiaorouji/openwrt-package/lienol/ package/diy-packages/lienol
# git clone https://github.com/xiaorouji/openwrt-package/tree/master/lienol/luci-app-passwall package/luci-app-passwall
# git clone https://github.com/kenzok8/openwrt-packages.git package/diy-packages
# git clone https://github.com/kenzok8/small.git package/small



# Ôö¼Óssr
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
git clone https://github.com/9iqyOS/op-npc package/npc
svn co https://github.com/immortalwrt/packages/trunk/lang/lua-neturl package/lang/lua-neturl
# git clone https://github.com/fw876/helloworld.git package/openwrt-packages/luci-app-ssr-plus
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/emortal package/emortal
rm -rf package/emortal/default-settings
svn co https://github.com/Lienol/openwrt/branches/22.03/package/default-settings package/default-settings
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ramfree package/lean/luci-app-ramfree
# git clone https://github.com/Lienol/openwrt-OpenAppFilter package/openwrt-OpenAppFilter
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-autoreboot package/lean/luci-app-autoreboot
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-cpufreq package/lean/luci-app-cpufreq
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-guest-wifi package/lean/luci-app-guest-wifi
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-homeassistant package/lean/luci-app-homeassistant
# svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mwan3helper package/lean/luci-app-mwan3helper
# svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-turboacc package/lean/luci-app-turboacc
# svn co https://github.com/kiddin9/openwrt-packages/trunk/shortcut-fe package/lean/shortcut-fe
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-zerotier package/lean/luci-app-zerotier
svn co https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/lean/vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/dnsforwarder package/lean/dnsforwarder
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-iform package/lean/luci-lib-iform
svn co https://github.com/kiddin9/openwrt-packages/trunk/pdnsd-alt package/lean/pdnsd-alt
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-syncdial package/lean/luci-app-syncdial
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-netdata package/lean/luci-app-netdata
svn co https://github.com/kiddin9/openwrt-packages/trunk/netdata package/lean/netdata
