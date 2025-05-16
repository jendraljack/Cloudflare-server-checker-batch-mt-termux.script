#!/system/bin/sh
depo="$(dirname $(realpath $0))"
busybox echo -e "\n### IP range generator rentang hingga 0.0.0.0/8\n### atau 0.0.0.0 - 0.255.255.255\n### Karya: kahlil Gibran, kurcaciJelek, dkk\n"
if [ ! -d "$depo/cache" ]
then
mkdir $depo/cache
fi
if [ -z "$1" ]
then
busybox echo -e "\nSilahkan ketik: bash $0 minIp maksIP\n### Contoh: bash $0 0.0.1.1 0.2.20.25"
kill -9 $$
fi
if [ -z "$2" ]
then
busybox echo -e "\nSilahkan ketik: bash $0 minIp maksIP\n### Contoh: bash $0 0.0.1.1 0.2.20.25"
kill -9 $$
fi

if [ "$2" == "$1" ]
then
busybox echo -e "\nSilahkan ketik: bash $0 minIp maksIP\n"
kill -9 $$
fi
busybox echo -n "$1" > $depo/min
busybox echo -n "$2" > $depo/max
busybox echo -n "$1" > $depo/mina
busybox echo -n "$2" > $depo/maxb

if [ -z "$(cat $depo/min|grep "\.")" ]
then
busybox echo -e "\nFormat IP salah\n"
kill -9 $$
fi

if [ -z "$(cat $depo/max|grep "\.")" ]
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

busybox sed -i "s|\.| |g" $depo/mina
busybox sed -i "s|\.| |g" $depo/maxb
busybox sed -i "s|\.||g" $depo/min
busybox sed -i "s|\.||g" $depo/max
sleep 2



firstpre="$(cat $depo/mina|busybox awk '{print $1}')"
scndpre="$(cat $depo/mina|busybox awk '{print $2}')"
thirdpre="$(cat $depo/mina|busybox awk '{print $3}')"
fourpre="$(cat $depo/mina|busybox awk '{print $4}')"
#
firstpost="$(cat $depo/maxb|busybox awk '{print $1}')"
scndpost="$(cat $depo/maxb|busybox awk '{print $2}')"
thirdpost="$(cat $depo/maxb|busybox awk '{print $3}')"
fourpost="$(cat $depo/maxb|busybox awk '{print $4}')"
#
#if [ "$firstpre" -gt "$firstpost" ]
#then
#busybox echo -e "\nSalah...\nMin IP harus kecil dari IP maksimal\n"
#kill -9 $$
#fi

#if [ "$scndpre" -gt "$scndpost" ]
#then
#if [ "$firstpre" == "$firstpost" ]
#then
#busybox echo -e "\nSalah...\nMin IP harus kecil dari IP maksimal\n"
#kill -9 $$
#fi
#fi

if [ "$thirdpre" -gt "$thirdpost" ]
then
if [ "$scndpre" == "$scndpost" ]
then
busybox echo -e "\nSalah...\nMin IP harus kecil dari IP maksimal\n"
kill -9 $$
fi
fi

if [ "$fourpre" -gt "$fourpost" ]
then
if [ "$thirdpre" == "$thirdpost" ]
then
busybox echo -e "\nSalah...\nMin IP harus kecil dari IP maksimal\n"
kill -9 $$
fi
fi

if [ "$fourpost" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
if [ "$thirdpost" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
if [ "$scndpost" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
if [ "$firstpost" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi

if [ "$fourpre" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
if [ "$thirdpre" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
if [ "$scndpre" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
if [ "$firstpre" -gt "255" ]
then
busybox echo -e "\nSalah..!Alamat Diluar jangkauan."
kill -9 $$
fi
busybox echo -e "### Sedang membuat rentang $1 s/d $2...\n### Tunggu yah bro...\n"
#busybox echo -e "#!$(readlink /proc/$$/exe)\nfind $depo/cache/3 -type f > $depo/ren34\ncat $depo/ren34|busybox sort -n > $depo/ren34lo\ncat $depo/ren34lo|busybox awk '{print \"cat \" \$0 \"|busybox awk -v tiga=\\\"\\\$(basename \" \$0 \")\\\" \\\x27{print \\\"$firstpre.$scndpre.\\\" tiga \\\".\\\"\\\$0}\\\x27 >> $depo/ipoutput.txt\"}' > $depo/00-\$(basename \$0)\nbash $depo/00-\$(basename \$0)" > $depo/01-$(basename $0)
#sleep 2

if [ "$scndpost" -gt "$scndpre" ]
then

if [ ! -d "$depo/kedua" ]
then
mkdir $depo/kedua
fi
if [ ! -d "$depo/ketiga" ]
then
mkdir $depo/ketiga
fi
if [ ! -d "$depo/keempat" ]
then
mkdir $depo/keempat
fi
if [ "$(($scndpost-$scndpre))" -lt "2" ]
then
busybox seq $thirdpre 255 > $depo/kedua/$scndpre
if [ "$thirdpost" == "0" ]
then
echo -n $thirdpost > $depo/kedua/$scndpost
fi
if [ "$thirdpost" -gt "0" ]
then
busybox seq 0 $thirdpost > $depo/kedua/$scndpost
fi
fi

if [ "$(($scndpost-$scndpre))" -gt "1" ]
then
busybox seq $thirdpre 255 > $depo/kedua/$scndpre
busybox seq $(($scndpre+1)) $(($scndpost-1)) > $depo/keduamiddle

if [ "$thirdpost" == "0" ]
then
echo -n $thirdpost > $depo/kedua/$scndpost
fi
if [ "$thirdpost" -gt "0" ]
then
busybox seq 0 $thirdpost > $depo/kedua/$scndpost
fi
busybox echo -e "#!$(readlink /proc/$$/exe)\nfolder=\"\$(dirname \$(realpath \$0))\"" > $depo/A-$(basename $0)
cat $depo/keduamiddle|busybox awk '{print "busybox seq 0 255 > \$folder/kedua/" $0 }' >> $depo/A-$(basename $0)
bash $depo/A-$(basename $0)
fi
find $depo/kedua -type f > $depo/ip2
busybox echo -e "#!$(readlink /proc/$$/exe)\ncurpath=\"\$(dirname \$(realpath \$0))\"" > $depo/B-$(basename $0)
cat $depo/ip2|busybox awk '{print "cat \"" $0 "\"|busybox awk -v tiga=\"\$(basename " $0 ")\" \x27{print tiga\".\" \$0}\x27 >> \$curpath/ketiga/bulanTahun.txt"}' >> $depo/B-$(basename $0)
bash $depo/B-$(basename $0)
if [ "$fourpost" == "0" ]
then
echo -n $fourpost > $depo/keempat/$scndpost.$thirdpost
fi
if [ "$fourpost" -gt "1" ]
then
busybox seq 0 $fourpost > $depo/keempat/$scndpost.$thirdpost
fi
busybox seq $fourpre 255 > $depo/keempat/$scndpre.$thirdpre
busybox echo -e "#!$(readlink /proc/$$/exe)\nfolder=\"\$(dirname \$(realpath \$0))\"" > $depo/C-$(basename $0)
cat $depo/ketiga/bulanTahun.txt|busybox awk '{print "if [ ! -f \"\$folder/keempat/" $0 "\" ]\nthen\nbusybox seq 0 255 > \$folder/keempat/" $0 "\nfi\n#"}' >> $depo/C-$(basename $0)
bash $depo/C-$(basename $0)
sleep 2
find $depo/keempat -type f > $depo/finishing.txt
cat $depo/finishing.txt|busybox sort -n > $depo/finishing2.txt
busybox echo -e "#!$(readlink /proc/$$/exe)\ncurpath=\"\$(dirname \$(realpath \$0))\"" > $depo/D-$(basename $0)
cat $depo/finishing2.txt|busybox awk -v parent=$firstpre '{print "cat \"" $0 "\"|busybox awk -v tiga=\"\$(basename " $0 ")\" \x27{print " parent "\".\" tiga \".\" \$0}\x27 >> \$curpath/outputIpRange.txt"}' >> $depo/D-$(basename $0)
bash $depo/D-$(basename $0)
busybox echo -e "\n## selesai."
fi

mv $depo/outputIpRange.txt $depo/outputIpRange-$(date +%s).txt
mv $depo/*-$(basename $0) $depo/cache
