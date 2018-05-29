#!/bin/bash

#my_list=(a b c)
#Import file; store in shell variable

my_list=($(<test.txt))
#Replace delimiters with spaces so that the variable will be a bash array
#my_list=${${my_list//,/" "}//;/" "}
my_list=${my_list//,/" "}
my_list=${my_list//;/" "}

for val in ${my_list[*]}; do
    echo $val
done


echo ""
echo "      ___"
echo " ,,  // \\\\"
echo "(_,\/ \_/ \\"
echo "  \ \_/_\_/>"
echo "  /_/  /_/"

#!/bin/bash
#This script is syntactic sugar for Y1's to clone an (empty) GitHub repo that they will fill (with another script) at the end of their labs.
#Their repos have to be forked (and accounts created) ahead of time.
#
#T. Golfinopoulos 25 June 2017
#Last modified 23 May 2018

#Move to home directory
cd ~


echo "----------------------------------------"
echo "------------> START IT UP! <------------"
echo "----------------------------------------"

weekday=$(date +%A)
month=$(date +%B)
day_of_month=$(date +%e)
this_year=$(date +%Y)
this_year_last_2=$(date +%y)

seconds_since_epoch=$(date +%s)

echo ""

seconds_since_start_of_meet=$(( $seconds_since_epoch - 1532851200 )) #1500796800=2017 date
days_since_start_of_meet=$(( $seconds_since_start_of_meet / 86400 ))

echo "(: Hello, there! :)"
echo "Today is $weekday, $day_of_month $month $this_year."
echo "It's been $seconds_since_start_of_meet seconds since you started your first summer at MEET"

if [ "$days_since_start_of_meet" -gt 1 ] || [ "$days_since_start_of_meet" -lt -1 ]; then
    echo "($days_since_start_of_meet days)."
else
    echo "($days_since_start_of_meet day)."
fi

if [ "$seconds_since_start_of_meet" -gt 50400 ]; then #After first day
    echo "Welcome to another MEET lab!"
else
    echo "Welcome to your first MEET lab!"
fi

echo "----------------------------------------"
echo "(if you want to exit, hold down CTRL and press c)"
echo ""
echo "Please enter your MEET GitHub username (example: myname19-meet), and then press enter:"

read username

declare -l username #Force string to lowercase
username=$username

#Pull list of usernames from Github
wget https://github.com/meet-projects/lab-setup-scripts/blob/master/check_name.txt

all_user_names=($(<check_name.txt))
#Replace delimiters with spaces so that the variable will be a bash array
#my_list=${${my_list//,/" "}//;/" "}
all_user_names=${all_user_names//,/" "}
all_user_names=${all_user_names//;/" "}

#Remove file with usernames
rm check_name.txt

#Check to make sure the user entered a username that actually belongs to a student.
correct_username=false
for this_name in ${all_user_names[*]}; do
    if [ "$this_name" == "$username" ]; then
        correct_username=true
        break  
    fi
done

if [ "$correct_username" != true ]; then
    echo "$username is not your username.  Check your spelling (look closely).  Startlab will start again automatically."
    #source startlab #Call script again recursively
    read temp
    echo $temp
    return #exit 1 #Exit recursive stack
fi

#Remove -meet from GitHub username to get MEET username.
#Do this after username is verified
name_only=${username:0:-5}


echo "----------------------------------------"
#export username #Save username for use in endlab script
echo "Please enter the module number you'd like to work on, and then press enter. "

if [ "$days_since_start_of_meet" -ge 8 ]; then
    echo "If you want work on the mini project, type"
    echo "mini-proj"
    echo "and then hit enter"
fi

if [ "$days_since_start_of_meet" -ge 14 ]; then
    echo "If you want work on the final project, type"
    echo "final-proj"
    echo "and then hit enter"
fi
read lab_id

declare -l lab_id #Force string to lowercase
lab_id=$lab_id

#Make sure lab_id is an integer.
re='^[0-9]+$'
while (! [[ $lab_id =~ $re ]]) && ( [ "$lab_id" != 'mini-proj' ] && [ "$lab_id" != 'final-proj' ] ) ; then
   echo "Error: couldn't recognize this lab.">&2;
   echo "Please enter an integer lab number (like 1, 2, 3, etc.), or mini-proj, or final-proj: "
   read lab_id
   declare -l lab_id #Force string to lowercase
    lab_id=$lab_id
fi

if [[ $lab_id =~ $re ]] ; then
    #Create lab name: meet2017y1lab###, if lab_id is a number
    lab_name="meet"$(date +%Y)"y1lab"$lab_id 
    dir_name=$name_only"_lab"$lab_id
else
    #If lab_id is final-proj of mini-proj, change name accordingly
    lab_name="meet"$(date +%Y)"y1"$lab_id 
    dir_name=$name_only"_"$lab_id
fi

git_path="https://github.com/"$username"/"$lab_name".git"

#Make a directory with the student's username to avoid collisions
mkdir $dir_name
cd $dir_name

#Configure git username and e-mail address
email_address="$name_only@meet.mit.edu" 
echo "$email_address"

git config --global user.name "$username"
git config --global user.email "$email_address"

#Clone repo.
git clone $git_path
cd $lab_name
#Make sure most up-to-date version is in folder (in case student has already cloned proj. on this computer)
git pull

echo "#!/bin/bash" > ~/.working_dir.sh
echo "#Git working directory for $username" >> ~/.working_dir.sh
echo "cd ~/$dir_name/$lab_name" >> ~/.working_dir.sh
echo "echo 'Moved to ~/$dir_name/$lab_name'"

#Return to home
#cd ~ #23 July 2017 - leave students in directory they are supposed to be in. TG

echo "----------------------------------------"
#echo "Please enter this into the Linux shell:"
#echo "cd "$dir_name"/"$lab_name
#echo "Then, enter this:"
#echo "Type"
#echo "ls"
echo "----------------------------------------"
#echo "After that, you're ready for module "$lab_id
echo "You're ready for module "$lab_id
echo "You can open a file for editing using idle3."
echo "For example, to make a new file called hello_world.py, you would enter"
echo ""
echo "idle3 hello_world.py &"
echo ""
echo "*Make sure you use the correct name for your files.*"
echo "---------------"
echo "Shell commands:"
echo "---------------"
echo "ls -> list all of the files in the folder"
echo "cd my_directory -> change to a folder called 'my_directory'"
echo "cd .. -> move the folder up one level"
echo "---------------"
echo "NOW, GO FOR IT!"
echo "----------------------------------------------------------------"
#idle3 & #Open up idle3

#Print a turtle upon success
echo ""
echo "      ___"
echo " ,,  // \\\\"
echo "(_,\/ \_/ \\"
echo "  \ \_/_\_/>"
echo "  /_/  /_/"


