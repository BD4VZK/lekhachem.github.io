	   cat /etc/issue|sed -n '1p' > index.html;
           uname -a|cut -d ' ' -f 2|sed s/^/HostName:' '/ >> index.html;
           uname -a|cut -d ' ' -f 3|sed s/^/Kernel:' '/ >> index.html;
           dmidecode -t system|awk -f /root/shells/servername.awk >> index.html;
           echo -e '\n-------- CPU: -------' >> index.html;
           lscpu  >> index.html;
           echo -e '\n------ Mem: ------' >> index.html;
           dmidecode -t memory|grep -A7 Physical >> index.html;
           dmidecode -t memory|grep -e "Size.*[0-9]" -A8|awk -f /root/shells/mem.awk >> index.html;
           echo -e '\n------- Disks: -------' >> index.html;
           lsblk >> index.html;
	   echo -e "\n\nLast updated as of $(date)." >> index.html;
           crontab -l > crontab.html;
           iptables -L -n > iptables.html
