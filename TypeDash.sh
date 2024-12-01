#!/bin/bash

words=(
    "apple" "banana" "cherry" "date" "elephant" "fig" "grape" "honeydew" "ice" "jackal"
    "kite" "lemon" "mango" "nectar" "orange" "pear" "quilt" "rose" "sunflower" "tulip"
    "umbrella" "violet" "watermelon" "xylophone" "yellow" "zebra" "artichoke" "blueberry" "cantaloupe" "dandelion"
    "elephant" "firefly" "giraffe" "hyacinth" "iris" "jasmine" "kiwi" "lily" "melon" "nightshade"a
    "yarn" "zigzag" "alligator" "butterfly" "cactus" "dolphin" "eagle" "falcon" "grizzly" "hummingbird"
    "iguana" "jaguar" "koala" "lemur" "monkey" "narwhal" "octagon" "peacock" "quail" "rabbit"
    "snake" "tortoise" "unicorn" "viper" "wolf" "xerox" "yak" "zebu" "acorn" "blossom"
    "cloud" "dawn" "earth" "fire" "gale" "harbor" "island" "jade" "knight" "lighthouse"
    "moon" "nimbus" "ocean" "plume" "quiver" "reef" "sky" "tide" "underbrush" "volcano"
    "whisper" "xeno" "yellowstone" "zenith" "amber" "breeze" "crimson" "dusk" "echo"
)

bold=$(tput bold)
reset=$(tput sgr0)
ent=""
echo
echo "----WPM CALCULATOR----"
echo
echo

randomWords=($(shuf -e "${words[@]}" -n 1))
randomWords=$(IFS=" "; echo "${randomWords[*]}")
echo "$randomWords"
echo "${bold}	$randomWords${reset}"
echo
echo
echo

while :; do
 read -n 1 -s key
 if [[ "$key" == "$ent" ]]; then
	 echo "START TYPING"
	 startTime=$(date +%s)
	 break
 else
	 echo "Press enter to start"
 fi
done

echo "$startTime"
userInput=""
declare -i count=0
while :; do
	read -n 1 key
	if [[ "$key" == "$ent" ]]; then
		count+=1
		if [[ "$count" -ne 1 ]]; then
		userInput+=" "
		fi

		if [[ "$count" -eq 2 ]]; then
			break
			endTime=$(date +%s)
		fi
	fi
	userInput+="$key"
done

wordCount=$(echo "$userInput" | wc -w)
timeTaken=$((endTime - startTime))
randwordFinal=$(echo "$randomWords" | xargs)
userinpFinal=$(echo "$userInput" | xargs)

if [[ "$userinpFinal" -eq "$randwordFinal" ]]; then
	minuteTime=$((timeTaken/60))
	wpm=$((wordCount/minuteTime))
	echo "${bold}WPM is:${reset} $wpm"
else
	echo "Typing mistake"
	echo "You typed $userInput"
fi
