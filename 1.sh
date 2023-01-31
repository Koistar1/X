#!/bin/bash
cd Koistar1/X

# 下载广告规则源，大佬间谍乘风常规超人造反
wget -O i1.txt https://adguardteam.github.io/HostlistsRegistry/assets/filter_29.txt
wget -O i2.txt https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
wget -O i3.txt https://cdn.jsdelivr.net/gh/xinggsf/Adblock-Plus-Rule@master/mv.txt
wget -O i4.txt https://cdn.jsdelivr.net/gh/o0HalfLife0o/list@master/ad-mo.txt
wget -O i5.txt https://abp.oisd.nl
wget -O i6.txt https://adguardteam.github.io/HostlistsRegistry/assets/filter_21.txt

# 合并与删除重复项
cat i*.txt > mergd.txt
cat mergd.txt | grep &#39;^|&#39; > block.txt
cat mergd.txt | grep &#39;^@&#39; > allow.txt
cat mergd.txt | grep &#39;^/&#39; > test1.txt
cat test1.txt block.txt allow.txt > tmpp.txt
sort -n tmpp.txt | uniq > tmp.txt

# 计数规则
num=`cat tmp.txt | wc -l`

# 添加标题与日期
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "! Total count: $num" >> tpdate.txt
cat title.dd tpdate.txt tmp.txt > final.txt

mv final.txt ../../dns.txt
rm *.txt
cd ../../
exit
