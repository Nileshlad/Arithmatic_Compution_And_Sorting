#!/bin/bash -x
echo "--------------------------------Arithmetic Compution And Sorting ----------------------------------"

#TO DECLEAR THE DICTIONARY
declare -A ArithmaticOperation

#TO TAKING INPUT FROM USER
read -p "Enter first input :" firstInput
read -p "Enter second input:" secondInput
read -p "Enter third input :" thirdInput

#COMPUTE ARITHMETIC OPERATION
result=`echo "scale=2;$firstInput + $secondInput * $thirdInput" | bc`
echo "Result:" $result

resultOne=`echo "scale=2;$firstInput * $secondInput + $thirdInput" | bc`
echo "Result:" $resultOne

resultTwo=`echo "scale=2;$thirdInput + $firstInput / $secondInput " | bc`
echo "Result:" $resultTwo

resultThree=`echo "scale=2;$firstInput % $secondInput + $thirdInput" | bc`
echo "Result:" $resultThree

#TO STORE THE DICTIONARY
ArithmaticOperation[result]=$result
ArithmaticOperation[resultOne]=$resultOne
ArithmaticOperation[resultTwo]=$resultTwo
ArithmaticOperation[resultThree]=$resultThree

