target_count=21
min_diff=2
heads_count=0
tails_count=0
flips_count=0
while[[ 1 ]]
do
    (( flips_count++ ))
    echo -n  $flips_count 
    toss=$(( RANDOM % 2 ))
    if[[ $toss == 0 ]]
    then
        echo "Heads"
        (( heads_count++ ))
    else
        echo "Tails"
        (( tails_count++ ))
    fi

    diff_bt_hc_tc=$(( $heads_count - $tails_count ))
    if[[ $heads_count == $target_count && $diff_bt_hc_tc >= $min_diff ]]
    then
        echo "Heads won $diff_bt_hc_tc points"
        break
    elif[[ $tails_count == $target_count && ${diff_bt_hc_tc#-} >= $min_diff ]]
    then
         echo "Tails won ${diff_bt_hc_tc#-} points"
         break
    fi

done
echo "Heads count is $heads_count"
echo "Tails Count is $tails_count"
