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
git clone https://github.com/ghosthgytop/npc package/npc
svn co https://github.com/immortalwrt/packages/trunk/lang/lua-neturl package/lang/lua-neturl
# git clone https://github.com/fw876/helloworld.git package/openwrt-packages/luci-app-ssr-plus
git clone https://github.com/yufan666/luci-app-npc package/openwrt-packages/luci-app-npc
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/emortal package/emortal
rm -rf package/emortal/default-settings
svn co svn co https://github.com/Lienol/openwrt/branches/22.03/package/default-settings package/default-settings
