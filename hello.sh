#!/usr/bin/env bash


file=$(hexdump -n 16 -v -e '/1 "%02x"' /dev/urandom)

echo -e "\n$file"
# Timestamp function
timestamp() {
    date +"%T"
}
timestamp

echo -e "What's your name?" 
read varname
echo -e "Cool, nice name\n"

echo "$varname," >> Desktop/scripts/survey.csv

yes=("Yes" "yes" "yeah" "yep")
no=("No" "no" "nope")
repeat=1

    while [ $repeat == 1 ]; do
        echo -e "Ok $varname, have you been arrested in the last year?" 
        read vararrest
            if [ "$vararrest" == $yes ]; then   
                echo -e "It's alright i'm not a cop. Your secret is safe with me\n"
                repeat=0
            elif [ "$vararrest" == $no ]; then
                echo -e "Yeah of course you haven't, cause they never caught you\n"
                repeat=0
            else    
                echo -e "Sorry, I'm going to need a straight answer. Type yes or no\n"
                repeat=1
            fi
    done 
    
    echo "$vararrest," >> Desktop/scripts/survey.csv

    while [ $repeat == 0 ]; do
        echo -e "How many months old is the pair of shoes you are currently wearing?" 
        read varshoes
            if ! [ "$varshoes" -eq "$varshoes" ] 2> /dev/null; then
                echo "Sorry im gonna need you to enter the number of months as an integer"
                repeat=0
            else
                echo -e "Dang, nice. Those must be some sweet kicks\n"
                repeat=1
            fi  
    done

    echo "$varshoes," >> Desktop/scripts/survey.csv

    while [ $repeat == 1 ]; do
        echo -e "How many months has it been since you went to the dentist?" 
        read varteeth
            if [ "$varteeth" -eq "$varteeth" ] 2> /dev/null; then
                echo -e "Statistically speaking, most people lie when asked that question. But I'm sure you wouldn't do that\n"
                repeat=0
            else
                echo -e "Sorry chief, I'm gonna need that as an integer\n"
                repeat=1
            fi
    done

echo "$varteeth," >> Desktop/scripts/survey.csv

echo -e "What is your mothers middle name?" 
read varmname
echo -e "I'm sure she is a lovely woman\n"

echo "$varmname," >> Desktop/scripts/survey.csv
while [ $repeat == 0 ]; do
    echo -e "Is a hot dog a sandwhich?" 
    read vardog
        if [ "$vardog" == "yes" ]; then
            echo -e "Alright well that's just your bad opinion\n"
            repeat=1
        elif [ "$vardog" == "no" ]; then
            echo -e "Good answer\n"
            repeat=1
        else
            echo -e "Look, we take hot dog related questions seriously around here. Type either yes or no\n"
            repeat=0
        fi
done

echo "$vardog," >> Desktop/scripts/survey.csv

    echo -e "Thanks for taking my little bash survey"


