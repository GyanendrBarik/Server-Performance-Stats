echo "######################"
echo "# System Uptime Info #"
echo "######################"

echo

uptime

echo

echo "###################"
echo "# Total CPU Usage #"
echo "###################"

echo

top -bn1 | grep "%Cpu(s):"|cut -d ',' -f4 | awk '{print "Usage: " 100-$1 "% " " Ideal: " $1 "%"}'

echo

echo "######################"
echo "# Total Memory Usage #"
echo "######################"

echo

free -m | awk '/^Mem:/ {
    used=$3
    avail=$7
    total=$2

    printf "Used: %.1fGi (%.2f%%)\n", used, used/total*100
    printf "Available: %.1fGi (%.2f%%)\n", avail, avail/total*100
}'


echo

echo "####################"
echo "# Total Disk Usage #"
echo "####################"

df -h | grep "/" -w | awk '{printf "Total: %.1fGB\nUsed: %.2fGB (%.2f%)\nAvail: %.2fGB (%.2f%)\n",$2,$3,$5,$4,100-$5}'

echo

echo "###################################"
echo "# Top 5 Processes by Memory Usage #"
echo "###################################"

ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo

echo "################################"
echo "# Top 5 Processes by CPU Usage #"
echo "################################"

ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'
