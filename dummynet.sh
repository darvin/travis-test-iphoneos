#!/bin/bash



case "$1" in
        enable)
echo "
dummynet in all pipe 1
dummynet out all pipe 2
" | pfctl -ef -
dnctl pipe 1 config  plr 1 delay 100000 bw 1kb/s queue 10kb

            ;;
         
        disable)
dnctl pipe delete 1
pfctl -d

            ;;
         
         
        *)
            echo $"Usage: $0 {enable|disable}"
            exit 1
 
esac





