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
svn co https://github.com/immortalwrt/packages/trunk/lang/lua-neturl package/lang/lua-neturl
# git clone https://github.com/fw876/helloworld.git package/openwrt-packages/luci-app-ssr-plus
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-npc package/luci-app-npc
#git clone https://github.com/khongpt/luci-app-cloudflared package/lean/luci-app-cloudflared
sed -i 's/2023.03.22/2023.02.28/g' package/small/chinadns-ng/Makefile
sed -i 's/1.8.0/1.7.5/g' package/small/xray-core/Makefile
sed -i 's/35339ee4c2ebd46cebd95ad7791d38a97db3a6afd97277a33e4ee7be35c9a3b2/a5fc936136a57a463bf9a895d068fdfa895b168ae6093c58a10208e098b6b2d3/g' package/small/xray-core/Makefile
sed -i 's/1.3.4/1.3.3/g' package/small/hysteria/Makefile
