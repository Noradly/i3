#!/usr/bin/env bash



while (( 1 )); do

    #usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
    usage=$(grep 'cpu ' /proc/stat | awk '{usage=($3)} END {print usage "%"}')    
    usage=$(echo $usage | tr '\0' ' ')
    usage=$(echo $usage | cut -d '.' -f 1)
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    sound=$(pamixer --get-volume)
    
    mem=$(free -h | grep Mem | awk '{print $4}')
    available=$(free -h | grep Mem | awk '{print $7}')

    swap=$(free -h | grep Swap | awk '{print $3}')
    #mem= "aa"
    printf "%s" "swap_used: $swap | mem available: $available | mem_free: $mem | Sound: $sound% | CPU: $usage | $dt"
    
    #printf "$sound     " "$usage                  " "$dt"
    sleep 0.1
done
