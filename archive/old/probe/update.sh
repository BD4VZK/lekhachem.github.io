	   cat /etc/issue|sed -n '1p' > index.txt;
           uname -a|cut -d ' ' -f 2|sed s/^/HostName:' '/ >> index.txt;
           uname -a|cut -d ' ' -f 3|sed s/^/Kernel:' '/ >> index.txt;
           dmidecode -t system|awk -f /root/shells/servername.awk >> index.txt;
           echo -e '\n-------- CPU: -------' >> index.txt;
           lscpu  >> index.txt;
           echo -e '\n------ Mem: ------' >> index.txt;
           dmidecode -t memory|grep -A7 Physical >> index.txt;
           dmidecode -t memory|grep -e "Size.*[0-9]" -A8|awk -f /root/shells/mem.awk >> index.txt;
           htop >> index.txt;
           echo -e '\n------- Disks: -------' >> index.txt;
           lsblk >> index.txt;
	   echo -e "\n\nLast updated as of $(date)." >> index.txt;
           crontab -l > crontab.txt;
           iptables -L -n > iptables.txt
