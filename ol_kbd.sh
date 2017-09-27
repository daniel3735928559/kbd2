trap '{ echo "Goodbye"; stty "'$(stty -g)'"; exit; }' INT
stty -icanon -echo min 1 time 0
while ((1)); do x=$(dd bs=1 count=1 2>/dev/null); beep -f $(echo "261.625*1.0594630943592953^("$(echo "a w s e d f t g y h u j k" | tr ' ' '\n' | nl -n ln | grep "$x" | sed 's/ .*//')"-1)" | bc -l) -l 80; done
