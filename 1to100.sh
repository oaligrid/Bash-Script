#!/bin/bash
# This is the personal property of Owais Ali
for ((num=1; num<=100; num++)); do
    if (( num % 3 == 0 )) && (( num % 5 == 0 )); then
        echo "FizzBuzz"
    elif (( num % 3 == 0 )); then
        echo "Fizz"
    elif (( num % 5 == 0 )); then
        echo "Buzz"
    else 
        echo "$num"
    fi
done


