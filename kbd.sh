s=1.0594630943592953                                                                                  # s = 2^(1/12) for equal temperment
o=0                                                                                                   # o = loop counter variable (starts at 0)
c=261.625                                                                                             # c = middle C
declare -A ks;                                                                                        # ks = empty map

trap '{ echo "Goodbye"; stty "'$(stty -g)'"; exit; }' INT                                             # Ensure the terminal is reset after a C-c
stty -icanon -echo min 1 time 0                                                                       # Set the terminal to not echo or buffer inputs
for k in a w s e d f t g y h u j k; do ks[$k]=$(echo "$c*$s^$o" | bc -l); o=$((o+1)); done            # Prepare the mapping ks of keys->freqs (for dvorak change this line)
while ((1)); do f="${ks[$(dd bs=1 count=1 2>/dev/null)]}"; [[ -n "$f" ]] && beep -f "$f" -l 70; done  # Main loop.  Terminate with C-c
