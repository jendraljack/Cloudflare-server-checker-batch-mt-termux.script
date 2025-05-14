#!/system/bin/sh
cloud="$(dirname $(realpath $0))"
busybox echo -e "\n### Cloudflare cek kode\n### Karya Khalil Gibran\n"
if [ -z "$1" ]
then
busybox echo -e "\nSalah..!\n#### gunakan: bash $0 berkasBerisiHostAtauIp.txt"
kill -9 $$
fi
#
if [ ! -d "$cloud/hasilKeepAlive" ]
then
mkdir $cloud/hasilKeepAlive
fi
##
cat "$1"|busybox grep -v " " > $cloud/ip1
cat $cloud/ip1|busybox grep "\." > $cloud/ip2
busybox echo -e "<html><head><title>Gollum Scanner</title><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=0\"/></head><body><h1>Result scan 200 OK dari berkas $1, jika tersedia.</h1><h2><br/>Karya: Kahlil gibran, dkk.<h2/>" > $cloud/hasilKeepAlive/$(basename $1).html

busybox echo -e "#!$(readlink /proc/$$/exe)\nfolder=\"\$(dirname \$(realpath \$0))\"" > $cloud/00-$(basename $0)
cat $cloud/ip2|busybox awk -v html=$1 '{print "echo \"Cek status: " $0 "\"\ncurl --connect-timeout 5 -i -X GET http://" $0 " > \$folder/hasilKeepAlive/" NR+0 ".log\nif [ ! -z \"\$(cat \"\$folder/hasilKeepAlive/" NR+0 ".log\"|busybox grep -i \"200 OK\")\" ]\nthen\necho \"<a href=\\\"http://" $0 "\\\">Buka Tautan " $0 "</a><br/>\" >> \$folder/hasilKeepAlive/\$(basename " html ").html\nfi\n#sleep 2\nrm \"\$folder/" NR+0 ".log\"\n\n##"}' >> $cloud/00-$(basename $0)
#echo "rm $cloud/hasilKeepAlive/*.log" >> $cloud/00-$(basename $0)
$(readlink /proc/$$/exe) $cloud/00-$(basename $0)
busybox echo -e "</body></html>" >> $cloud/hasilKeepAlive/$(basename $1).html
sleep 2
mv -f $cloud/hasilKeepAlive/$(basename $1).html $cloud/hasilKeepAlive/$(basename $1)-$(date +%s).html
busybox echo -e "\n### Scan selesai ###\n### Lihat jika ada hasil di folder: $cloud/hasilKeepAlive\nLalu lihat jika ada $(basename $1).html. sentuh tahan -> jenis -> buka dengan -> saran sistem###\n\n### Cloudflare cek kode\n### Karya: Khalil Gibran, dkk\n##### MT Manager skrip\n"
