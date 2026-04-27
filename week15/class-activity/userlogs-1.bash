#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
function getFailedLogins() {
	lines=$(cat "$authfile" | grep "password check failed for user")
	dateUser=$(echo "$lines" | cut -d ' ' -f1,2,3,11 | tr -d '\.')
	echo "$dateUser"
}

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

echo "To: ryan.rogowski@mymail.champlain.edu" > emailform.txt
echo "Subject: Failed Logins" >> emailform.txt
echo "" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp ryan.rogowski@mymail.champlain.edu
