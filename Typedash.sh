#!/bin/bash

words=(
    "may" "any" "cherry" "date" "for" "apple" "leave" "good" "ice" "out"
    "kite" "eye" "few" "move" "place" "become" "work" "ask" "snake" "echo" "people"
    "world" "turn" "but" "state" "course" "many" "begin" "possible" "hand" "last" "get" "he" "back" "late" "great" "might" "home" "where" "house" "between" "time" "more" "face" "hand" "early" "after" "no" "open" "of" "how" "since" "early" "without" "can" "than" "first" "never" "on" "no" "it" "he" "school" "you" "state" "not" "late" "same" "order"
)

bold=$(tput bold)
reset=$(tput sgr0)

randomWords=$(shuf -e "${words[@]}" -n 10 | tr '\n' ' ')
randomWords=$(echo "$randomWords" | xargs)

echo
echo "---- WPM CALCULATOR ----"
echo
echo
echo "${bold}$randomWords${reset}"
echo
echo "Press ENTER to start typing"
echo
echo 

read  -s

echo "Start typing"
echo

startTime=$(date +%s)

read userInput
endTime=$(date +%s)

timeTaken=$((endTime - startTime))

randwordFinal=$(echo "$randomWords" | xargs)
userinpFinal=$(echo "$userInput" | xargs)

if [[ "$userinpFinal" == "$randwordFinal" ]]; then
    wordCount=$(echo "$randwordFinal" | wc -w)
    wpm=$((wordCount * 60 / timeTaken))
    echo "${bold}WPM is:${reset} $wpm"
else
    echo "Typing mistake!"
    echo "You typed: $userinpFinal"
    echo "Correct: $randwordFinal"
fi
