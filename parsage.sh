#!/usr/bin/bash
#-*- coding: utf-8-*-
# ==============================================================================
# title           :parsage.sh                                                  #
# description     :Parse log file .                                            #
# author          :Odka33 - Elie BEN AYOUN                                     #
# date            :28/04/2019                                                  #
# version         :0.1                                                         #
# usage           : ./parsage.sh .                                             #
# ==============================================================================

#NIKTO

#NIKTO IP/DNS
cat *_NIKTO.txt | grep -i "target host" | awk -F':' '{print$NF}'"IP" | sed 's/[^;]$/&,/' > NIKTO/nikto_ip.csv  

#NIKTO PORT:
cat *_NIKTO.txt | awk '/Port/ {print $4}' | sed 's/[^;]$/&,/' > NIKTO/nikto_port.csv 

#NIKTO NAME:
cat *_NIKTO.txt | grep "Nikto" | awk '{print $2, $3 }' | sed 's/[^;]$/&,/' > NIKTO/nikto_name.csv

#NIKTO DATE:
date -r *_NIKTO.txt "+%m-%d-%Y %H:%M:%S" | sed 's/[^;]$/&,/' > NIKTO/nikto_date.csv

#NIKTO FILE LOCATION:
find /root/logs_scan/ -name "*_NIKTO.txt" | sed 's/[^;]$/&,/' > NIKTO/nikto_flocation.csv

#NIKTO SHASUM:
sha1sum *_NIKTO.txt | awk '{print $1}' | sed 's/[^;]$/&,/' > NIKTO/nikto_shasum.csv

#NIKTO CVSS:
cat  *_NIKTO.txt | grep "OSVDB" | sed 'N;s/\n/ /' | sed 's/[^;]$/&,/' > NIKTO/nikto_cvss.csv

#NIKTO BREACH:
cat *_NIKTO.txt | grep "+ GET" | tr -d ',' | paste -d " " - - - - - - - - - - - - - | sed 's/[^;]$/&,/' > NIKTO/nikto_breach.csv

#NMAP

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

#FIERCE

#FIERCE IP/DNS

cat *_fierce.txt | awk '{print $2}' | grep "www" | sed 's/[^;]$/&,/' > FIERCE/fierce_ip.csv

#FIERCE SCAN_DATE:
date -r *_fierce.txt "+%m-%d-%Y %H:%M:%S" | sed 's/[^;]$/&,/' > FIERCE/fierce_date.csv

#FIERCE SCAN_LOCATION:
find /root/logs_scan/ -name "*_fierce.txt" | sed 's/[^;]$/&,/' > FIERCE/fierce_flocation.csv

#FIERCE LOG_SHA1:
sha1sum *_fierce.txt | awk '{print $1}' | sed 's/[^;]$/&,/' > FIERCE/fierce_shasum.csv

#FIERCE BREACH:
cat *_fierce.txt | awk '{print $2}' | grep "ns" | paste -d " " - - - - - - - - - - - - - | sed 's/[^;]$/&,/' > FIERCE/fierce_breach.csv

#FIERCE CVSS:
echo "-" > FIERCE/fierce_cvss.csv

