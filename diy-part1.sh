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

# 换源
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g' package/emortal/default-settings/files/99-default-settings-chinese


# Ôö¼Óssr
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
git clone --depth=1 -b master https://github.com/Hyy2001X/AutoBuild-Packages package/AutoBuild-Packages
git clone --depth=1 https://github.com/asvow/luci-app-tailscale package/luci-app-tailscale


#删除缺少依赖的luci
rm -rf package/openwrt-packages/luci-app-mosdns
rm -rf package/feeds/packages/strongswan

#修改最新版编译失败的bug
#rm -rf package/libs/mbedtls
#svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/libs/mbedtls package/libs/mbedtls
#rm -rf feeds/packages/lang/golang
#svn co https://github.com/immortalwrt/packages/branches/openwrt-23.05/lang/golang feeds/packages/lang/golang
#rm -rf feeds/packages/net/wget
#svn co https://github.com/openwrt/packages/branches/openwrt-19.07/net/wget feeds/packages/net/wget
#sed -i 's/04fb797d8d04b8af9c4746ab9c1d659a3575a677892c2d5d9194a4b0e210e2ab/da51732b2a55d0f2e3270f70b638a32f303b675c0db636abefa5ce316e3269f7/g' package/small/shadowsocks-rust/Makefile
#sed -i 's/2023.03.22/2023.02.28/g' package/small/chinadns-ng/Makefile
#sed -i 's/1.8.6/1.7.5/g' package/small/xray-core/Makefile
#sed -i 's/d828296c9f29f9e59a61ab73d44f072ab2a30fe979679e39aea43b33ddb7d6bf/a5fc936136a57a463bf9a895d068fdfa895b168ae6093c58a10208e098b6b2d3/g' package/small/xray-core/Makefile
#sed -i 's/1.3.4/1.3.3/g' package/small/hysteria/Makefile
#sed -i 's/13862594252dcea83d791b0cf8234874154ba623f22d94cef685561a710717c1/11ca9df98a8a17a348dcdac92a19fef0e25dde8e536a9778705f765ac208a202/g' package/small/hysteria/Makefile
#sed -i 's/1.5.0-beta.6/1.5.0-beta.5/g' package/small/sing-box/Makefile
#sed -i 's/e5674734fba4fb04e64ea0df98da3ee5889034ced7382f77fcee8cf3e37d9d93/a25204c9f2c949de666fb88c95a087269920c822bd8097d1396b96b878082c36/g' package/small/sing-box/Makefile
