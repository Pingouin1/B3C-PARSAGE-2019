
cat *_NIKTO.txt | grep -i "target host" | awk -F':' '{print$NF}'"IP" | sed 's/[^;]$/&,/' > NIKTO/nikto_ip.csv  

cat *_NIKTO.txt | awk '/Port/ {print $4}' | sed 's/[^;]$/&,/' > NIKTO/nikto_port.csv 

cat *_NIKTO.txt | grep "Nikto" | awk '{print $2, $3 }' | sed 's/[^;]$/&,/' > NIKTO/nikto_name.csv

date -r *_NIKTO.txt "+%m-%d-%Y %H:%M:%S" | sed 's/[^;]$/&,/' > NIKTO/nikto_date.csv

find /root/logs_scan/ -name "*_NIKTO.txt" | sed 's/[^;]$/&,/' > NIKTO/nikto_flocation.csv

sha1sum *_NIKTO.txt | awk '{print $1}' | sed 's/[^;]$/&,/' > NIKTO/nikto_shasum.csv

cat  *_NIKTO.txt | grep "OSVDB" | sed 'N;s/\n/ /' | sed 's/[^;]$/&,/' > NIKTO/nikto_cvss.csv

cat *_NIKTO.txt | grep "+ GET" | tr -d ',' | paste -d " " - - - - - - - - - - - - - | sed 's/[^;]$/&,/' > NIKTO/nikto_breach.csv


#NMAP IP/DNS

cat *_NMAP.txt | grep -a "addr=" | cut -d'"' -f2 | sed 's/[^;]$/&,/' > NMAP/nmap_ip.csv

#NMAP PORT:
cat  *_NMAP.txt | grep "portid=" | cut -d'"' -f4 | paste -d " " - - - - - - - - - - - | sed 's/[^;]$/&,/' > NMAP/nmap_port.csv

#NMAP SCAN_NAME:
cat *_NMAP.txt | grep "Nmap 7" | awk '{print $2, $3 }' | sed 's/[^;]$/&,/' > NMAP/nmap_name.csv

#NMAP SCAN_DATE:
date -r *_NMAP.txt "+%m-%d-%Y %H:%M:%S" | sed 's/[^;]$/&,/' > NMAP/nmap_date.csv

#NMAP SCAN_LOCATION:
find /root/logs_scan/ -name "*_NMAP.txt" | sed 's/[^;]$/&,/' > NMAP/nmap_flocation.csv

#NMAP LOG_SHA1:
sha1sum *_NMAP.txt | awk '{print $1}' | sed 's/[^;]$/&,/' > NMAP/nmap_shasum.csv

#NMAP CVSS:

echo "-," > NMAP/nmap_cvss.csv

#NMAP BREACH:
cat *_NMAP.txt | grep "state" | awk '{print $7$8$9$10$11}' | paste -d " " - - - - - - - - - - - | sed 's/[^;]$/&,/' > NMAP/nmap_breach.csv
