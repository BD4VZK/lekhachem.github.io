# Environment
- Glances v2.3 with psutil v3.4.2
- Hardware Lister (lshw) - B.02.17

# Bash script examples

```
# To start the Glances webserver.

glances -w
```

```
#!/bin/bash

date >> /home/lekha/log
echo "Shell starting" >> /home/lekha/log

while :
do

cd /home/lekha/lekhachem.github.io
rm index.html* && wget localhost:61208

sed -i -e 's/ <title> Glances/ <title> LekhaChem’s System Status/' index.html
sed -i -e 's/link rel="icon"/link rel="shortcut icon"/' index.html
sed -i '/refresh/d' index.html
sed -i -e 's/Uptime:/Update: #defineDate <br />  Uptime:/' index.html

DEFINEDATE=\`date \+"%Y-%m-%d %H:%M:%S %Z"\`
sed -i -e "s/#defineDate/$DEFINEDATE</a>/" index.html

git add -A && git commit -m "bot: auto update"
git push origin master

date >> /home/lekha/log
echo "Git pushing" >> /home/lekha/log

sleep 60

done
```


```
#!/bin/bash

date >> /home/lekha/log
echo "Starting shell (lshw)..." >> /home/lekha/log

while :
do

rm /home/lekha/lekhachem.github.io/hardinfo.html
cp /root/hardinfo.html /home/lekha/lekhachem.github.io

# Define sample multi-line literal.

replace=`lshw`

# Escape it for use as a Sed replacement string.

IFS= read -d '' -r < <(sed -e ':a' -e '$!\{N;ba' -e '\}' -e 's/[&/]/\\&/g; s/\\n/\\&/g' <<<"$replace")
replaceEscaped=$\{REPLY%$'\\n'\}

sed -i -e "s/#defineLshw/$replaceEscaped/" /home/lekha/lekhachem.github.io/hardinfo.html

date >> /home/lekha/log
echo "Generating lshw report..." >> /home/lekha/log

sleep 1d

done
```
