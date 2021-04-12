#!/bin/bash

b=.rec/base.wav
c=.rec/+1.wav
d=.rec/-1.wav
clear
printf "\033[1;36mpress enter for anonymous\033[0m\n"
read
while true
do
    clear
    printf "\033[1;36msay your speech\033[0m\n"
    rec $b pitch 300 silence 1 0.0 0% 1 2.0 1% 2>/dev/null #for real voice please change the last parameter to 20%, but please don't leave this higher or equal 25. 300 is equavalent to 20% in audacity
    sox -q $b $c pitch 300
    sox -q $b $d pitch -210
    printf "\033[1;36mthe audio is playing\033[0m\n"
    play -q -m $b $c $d 2>/dev/null
    rm $b $c $d >/dev/null 2>/dev/null
    printf "type exit to exit"
    read L
    if [ "$L" == "exit" ]; then
        clear
        break
    fi
done
