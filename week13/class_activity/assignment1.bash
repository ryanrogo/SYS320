#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

# TODO - 1
function coursesByLocation() {
	echo "Input a class location"
	read location

	cat "$courseFile" | grep "$location" | cut -d ';' -f1,2,5,6,7 | sed 's/;/ | /g'
}

# TODO - 2
function availableCourses() {
	echo "Input a subject name"
	read subjectName

	cat "$courseFile" | grep "^$subjectName" | \
	awk -F';' '$4 > 0 {print $1 " | " $2 " | " $3 " | " $4 " | " $5 " | " $6 " | " $7 " | " $8 " | " $9 " | " $10}' |\
	sed 's/;/ | /g'
}


while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display course of a certain classroom"
	echo "[4] Display available courses of a subject"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		coursesByLocation

	elif [[ "$userInput" == "4" ]]; then
		availableCourses

	# TODO - 3 Display a message, if an invalid input is given
	else
		echo "Invalid input, please try again."

	fi
done
