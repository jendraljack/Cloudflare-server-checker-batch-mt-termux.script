#!/system/bin/sh
depo="$(dirname $(realpath $0))"
busybox echo -e "\n### IP range generator rentang hingga 0.0.0.0/16\n### atau 0.0.0.0-0.0.255.255\n### Karya: kahlil Gibran, kurcaciJelek, dkk\n"
if [ -f "$depo/ipoutput.txt" ]
then
rm $depo/ipoutput.txt
fi
###
if [ ! -d "$depo/cache/3" ]
then
mkdir -p $depo/cache/3
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

if [ "$firstpre$scndpre" != "$firstpost$scndpost" ]
then
busybox echo -e "\nMaaf...\nSementara hanya untuk rentang 0.0.0.0-0.0.255.255 atau 0.0.0.0/16\n"
kill -9 $$
fi

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
busybox echo -e "#!$(readlink /proc/$$/exe)\nfind $depo/cache/3 -type f > $depo/ren34\ncat $depo/ren34|busybox sort -n > $depo/ren34lo\ncat $depo/ren34lo|busybox awk '{print \"cat \" \$0 \"|busybox awk -v tiga=\\\"\\\$(basename \" \$0 \")\\\" \\\x27{print \\\"$firstpre.$scndpre.\\\" tiga \\\".\\\"\\\$0}\\\x27 >> $depo/ipoutput.txt\"}' > $depo/00-\$(basename \$0)\nbash $depo/00-\$(basename \$0)" > $depo/01-$(basename $0)
sleep 2
if [ "$fourpre" -gt "$fourpost" ]
then
if [ "$thirdpost" -gt "$thirdpre" ]
then
#mkdir $depo/cache/3
if [ "$((thirdpost-thirdpre))" -gt "1" ]
then
busybox seq $(($thirdpre+1)) $(($thirdpost-1)) > $depo/cache/ren3
cat $depo/cache/ren3|busybox awk '{print "busybox seq 0 255 > \$(dirname \$(realpath $0))/cache/3/" $0}' > $depo/00-$(basename $0)
bash $depo/00-$(basename $0)
busybox seq $fourpre 255 > $depo/cache/3/$thirdpre
busybox seq 0 $fourpost > $depo/cache/3/$thirdpost
bash $depo/01-$(basename $0)
fi
if [ "$((thirdpost-thirdpre))" -lt "2" ]
then
echo -n $(($thirdpre+1)) > $depo/cache/ren3
cat $depo/cache/ren3|busybox awk '{print "busybox seq 0 255 > \$(dirname \$(realpath $0))/cache/3/" $0}' > $depo/00-$(basename $0)
bash $depo/00-$(basename $0)
busybox seq $fourpre 255 > $depo/cache/3/$thirdpre
busybox seq 0 $fourpost > $depo/cache/3/$thirdpost
bash $depo/01-$(basename $0)
fi
fi
fi
##

if [ "$fourpre" -lt "$fourpost" ]
then
if [ "$thirdpost" == "$thirdpre" ]
then
busybox seq $fourpre $fourpost > $depo/cache/3/$thirdpost
bash $depo/01-$(basename $0)
fi
fi

if [ "$fourpost" -gt "$fourpre" ]
then
if [ "$thirdpost" -gt "$thirdpre" ]
then
#mkdir $depo/cache/3
if [ "$((thirdpost-thirdpre))" -gt "1" ]
then
busybox seq $(($thirdpre+1)) $(($thirdpost-1)) > $depo/cache/ren3
cat $depo/cache/ren3|busybox awk '{print "busybox seq 0 255 > \$(dirname \$(realpath $0))/cache/3/" $0}' > $depo/00-$(basename $0)
bash $depo/00-$(basename $0)
busybox seq $fourpre 255 > $depo/cache/3/$thirdpre
busybox seq 0 $fourpost > $depo/cache/3/$thirdpost
bash $depo/01-$(basename $0)
fi
if [ "$((thirdpost-thirdpre))" -lt "2" ]
then
echo -n $(($thirdpre+1)) > $depo/cache/ren3
cat $depo/cache/ren3|busybox awk '{print "busybox seq 0 255 > \$(dirname \$(realpath $0))/cache/3/" $0}' > $depo/00-$(basename $0)
bash $depo/00-$(basename $0)
busybox seq $fourpre 255 > $depo/cache/3/$thirdpre
busybox seq 0 $fourpost > $depo/cache/3/$thirdpost
bash $depo/01-$(basename $0)
fi
fi
fi
cat $depo/ipoutput.txt
busybox echo -e "\n### Mencetak urutan IP $1 s/d $2 selesai...\n"
sleep 2
#busybox echo -e "#!$(readlink /proc/$$/exe)\nfind $depo/cache/3 -type f > $depo/ren34\ncat $depo/ren34|busybox sort -n > $depo/ren34lo\ncat $depo/ren34lo|busybox awk '{print \"cat \" \$0 \"|busybox awk -v tiga=\\\"\\\$(basename \" \$0 \")\\\" \\\x27{print \\\"$firstpre.$scndpre.\\\" tiga \\\".\\\"\\\$0}\\\x27 >> $depo/ipoutput.txt\"}' > $depo/00-\$(basename \$0)\nbash $depo/00-\$(basename \$0)" > $depo/01-$(basename $0)
mv $depo/ipoutput.txt $depo/ipoutput-$(date +%s).txt
if [ ! -z "$(find $depo/cache/3 -type f)" ]
then
rm $depo/cache/3/*
fi
mv -f $depo/*-$(basename $0) $depo/cache
