#!/system/bin/sh
scan="$(dirname $(realpath $0))"
busybox echo -e "\n### Scaner range IP/hostname online\n### Karya: KurcaciJelek, kahlil gibran, dkk.\n"
if [ ! -d "$scan/cache" ]
then
mkdir $scan/cache
fi
sleep 3
if [ ! -d "$scan/cacheip" ]
then
mkdir $scan/cacheip
fi
#
if [ -z "$1" ]
then
busybox echo -e "\nSalah..\n### Gunakan: bash $(basename $0) alamatIp/2*/hostname\n### contoh: bash $(basename $0) 1.1.1.1/24 atau google.com/24"
kill -9 $$
fi
#

busybox echo -e "\n### Memulai mencari online rentang $1\n"

busybox echo -n "$1" > $scan/ipscan
busybox sed -i "s|/||g" $scan/ipscan
output="$(cat $scan/ipscan)"
nmap -sP $1 > $scan/cacheip/iplist
busybox echo -e "#!$(readlink /proc/$$/exe)\ncat $scan/cacheip/iplist|grep \" for [0-9]\"|busybox awk '{print \$5}'\ncat $scan/cacheip/iplist|grep \" for [0-9]\"|busybox awk '{print \$5}' > $scan/cacheip/$output-$(date +%s).txt" > $scan/00-$(basename $0)
$(readlink /proc/$$/exe) "$scan/00-$(basename $0)"
#
sleep 2
mv $scan/00-$(basename $0) "$scan/cache/00-$(basename $0)"
