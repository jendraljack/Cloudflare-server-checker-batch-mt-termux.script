#!/system/bin/sh
folderip="$(dirname $(realpath $0))"
if [ ! -f "$folderip/ipRangeGen.v1.1.sh" ]
then
busybox echo -e "\n### Tidak ada program kedua ipRangeGen.v1.1.sh\n### silahkan unduh di github jendraljack\n"
kill -9 $$
fi

if [ ! -f "$folderip/ipRangeGen.v1.2.sh" ]
then
busybox echo -e "\n### Tidak ada program kedua ipRangeGen.v1.1.sh\n### silahkan unduh di github jendraljack\n"
kill -9 $$
fi

busybox echo -e "\n### IP range generator rentang hingga 0.0.0.0/8\n### atau 0.0.0.0 - 0.255.255.254 / 16juta host\n### Karya: kahlil Gibran, kurcaciJelek, dkk\n"
if [ -f "$folderip/ipoutput.txt" ]
then
rm $folderip/ipoutput.txt
fi
###
if [ ! -d "$folderip/cache/3" ]
then
mkdir -p $folderip/cache/3
fi
if [ -z "$1" ]
then
busybox echo -e "\nSilahkan ketik: bash $0 minIp maksIP\n### Contoh: bash $0 0.0.1.1 0.0.20.25"
kill -9 $$
fi
if [ -z "$2" ]
then
busybox echo -e "\nSilahkan ketik: bash $0 minIp maksIP\n### Contoh: bash $0 0.0.1.1 0.0.20.25"
kill -9 $$
fi

if [ "$2" == "$1" ]
then
busybox echo -e "\nSilahkan ketik: bash $0 minIp maksIP\n"
kill -9 $$
fi
busybox echo -n "$1" > $folderip/min
busybox echo -n "$2" > $folderip/max
busybox echo -n "$1" > $folderip/mina
busybox echo -n "$2" > $folderip/maxb

if [ -z "$(cat $folderip/min|grep "\.")" ]
then
busybox echo -e "\nFormat IP salah\n"
kill -9 $$
fi

if [ -z "$(cat $folderip/max|grep "\.")" ]
then
busybox echo -e "\nFormat IP salah\n"
kill -9 $$
fi

if [ ! -z "$(echo $1|grep "[a-zA-Z]")" ]
then
busybox echo -e "Salah ..\nHarus angka\n"
kill -9 $$
fi

if [ ! -z "$(echo $2|grep "[a-zA-Z]")" ]
then
busybox echo -e "Salah ..\nHarus angka\n"
kill -9 $$
fi

busybox sed -i "s|\.| |g" $folderip/mina
busybox sed -i "s|\.| |g" $folderip/maxb
busybox sed -i "s|\.||g" $folderip/min
busybox sed -i "s|\.||g" $folderip/max
sleep 2



firstpre="$(cat $folderip/mina|busybox awk '{print $1}')"
scndpre="$(cat $folderip/mina|busybox awk '{print $2}')"
thirdpre="$(cat $folderip/mina|busybox awk '{print $3}')"
fourpre="$(cat $folderip/mina|busybox awk '{print $4}')"
#
firstpost="$(cat $folderip/maxb|busybox awk '{print $1}')"
scndpost="$(cat $folderip/maxb|busybox awk '{print $2}')"
thirdpost="$(cat $folderip/maxb|busybox awk '{print $3}')"
fourpost="$(cat $folderip/maxb|busybox awk '{print $4}')"

if [ "$firstpre" != "$firstpost" ]
then
busybox echo -e "\n### Maaf.\n### belum mendukung rentang < 0.0.0.0/8\n### terlalu banyak host.\n"
kill -9 $$
fi


if [ "$firstpre" == "$firstpost" ]
then
if [ "$scndpre" == "$scndpost" ]
then
busybox echo -e "#!$(readlink /proc/$$/exe)\n$(readlink /proc/$$/exe) \"$folderip/ipRangeGen.v1.1.sh\" $1 $2" > $folderip/main$(basename $0)
$(readlink /proc/$$/exe) "$folderip/main$(basename $0)"
fi
fi

if [ "$firstpre" == "$firstpost" ]
then
if [ "$scndpre" -lt "$scndpost" ]
then
busybox echo -e "#!$(readlink /proc/$$/exe)\n$(readlink /proc/$$/exe) \"$folderip/ipRangeGen.v1.2.sh\" $1 $2" > $folderip/main$(basename $0)
$(readlink /proc/$$/exe) "$folderip/main$(basename $0)"
fi
fi