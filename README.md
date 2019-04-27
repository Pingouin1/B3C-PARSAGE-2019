# B3C-PARSAGE-2019

Parsage simple.

NIKTO

NIKTO IP :
```cat *_NIKTO.txt | grep -i "target host" | awk -F':' '{print$NF}'"IP" ```(modifié)

NIKTO PORT:
```cat *_NIKTO.txt | awk '/Port/ {print $4}'```

NIKTO SCAN_NAME:
```cat *_NIKTO.txt | grep "Nikto" | awk '{print $2, $3 }'```

NIKTO SCAN_DATE:
```ddate -r *_NIKTO.txt "+%m-%d-%Y %H:%M:%S"```

NIKTO SCAN_LOCATION:
```find /root/logs_scan/ -name "*_NIKTO.txt"```

NIKTO LOG_SHA1:
```sha1sum *_NIKTO.txt | awk '{print $1}'```

NIKTO CVSS:
```cat  *_NIKTO.txt | grep "OSVDB"```

NIKTO BREACH:
```Cat *_NIKTO.txt | grep "+ GET" ```

_______________________________________________


NMAP IP:
```cat *_NMAP.txt | grep -a "addr=" | cut -d'"' -f2```

NMAP PORT:
```cat  *_NMAP.txt | grep "portid=" | cut -d'"' -f4```

NMAP SCAN_NAME:
```cat *_NMAP.txt | grep "Nmap 7" | awk '{print $2, $3 }'```

NMAP SCAN_DATE:
```date -r *_NMAP.txt "+%m-%d-%Y %H:%M:%S"```

NMAP SCAN_LOCATION:
```find /root/logs_scan/ -name "*_NMAP.txt"```

NMAP LOG_SHA1:
```sha1sum *_NMAP.txt | awk '{print $1}'```

NMAP CVSS:
	- 

NMAP BREACH:
```cat *_NMAP.txt | grep "state" | awk '{print $7$8$9$10$11}'```




FIERCE

FIERCE SCAN_DATE:
```date -r *_FIERCE.txt "+%m-%d-%Y %H:%M:%S"```

FIERCE SCAN_LOCATION:
```find /root/logs_scan/ -name "*_FIERCE.txt"```

FIERCE LOG_SHA1:
```sha1sum *_FIERCE.txt | awk '{print $1}'```

FIERCE IP:
``` $IpS >> ```


Commandes après flux de redirection.


Ajout de séparateur "," dans le script.

