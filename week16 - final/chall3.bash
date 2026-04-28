#!/bin/bash

echo "<html><body>" > report.html
echo "<h3>Access logs with IOC indicators:</h3>" >> report.html
echo "<table border='1'>" >> report.html

while read line; do
	ip=$(echo "$line" | cut -d' ' -f1)
	date=$(echo "$line" | cut -d' ' -f2)
	page=$(echo "$line" | cut -d' ' -f3)

	echo "<tr><td>$ip</td><td>$date</td><td>$page</td></tr>" >> report.html

done < report.txt

echo "</table></body></html>" >> report.html

mv report.html /var/www/html/report.html
