#!/bin/bash -x
echo "--------------------------------Arithmetic Compution And Sorting ----------------------------------"

#TO DECLAER THE DICTIONARY
declare -A arithmaticOperation

#TO TAKING INPUT FROM USER
read -p "Enter first input :" firstInput
read -p "Enter second input:" secondInput
read -p "Enter third input :" thirdInput

#COMPUTE ARITHMETIC OPERATION
result1=`echo "scale=2;$firstInput + $secondInput * $thirdInput" | bc`
echo "Result:" $result1

result2=`echo "scale=2;$firstInput * $secondInput + $thirdInput" | bc`
echo "Result:" $result2

result3=`echo "scale=2;$thirdInput + $firstInput / $secondInput " | bc`
echo "Result:" $result3

result4=`echo "scale=2;$firstInput % $secondInput + $thirdInput" | bc`
echo "Result:" $result4

#TO STORE THE DICTIONARY
arithmaticOperation[result1]=$result1
arithmaticOperation[result2]=$result2
arithmaticOperation[result3]=$result3
arithmaticOperation[result4]=$result4

#TO READ THE DICTIONARY VALUE IN ARRAY
for((index=0; index<=${#arithmaticOperation[@]}; index++))
do
  array[index]=${arithmaticOperation[result$((index+1))]}
done
#TO PRINT
echo "${array[@]}"

#TO FUNCTION SORTING RESULTS IN DECENDING ORDER
function descendingOrderSort()
{
	for(( index=0; index<${#array[@]}; index ++ ))
	do
		for(( indexOne=0; indexOne<${#array[@]}-1; indexOne ++ ))
		do
			if (( $(echo "${array[indexOne+1]} > ${array[indexOne]}" | bc -l ) ))
			then
				temp=${array[indexOne]}
				array[indexOne]=${array[indexOne+1]}
				array[indexOne+1]=$temp
			fi
		done
	done
echo "To data descending order:"${array[@]}
}

#TO FUNCTION CALL FOR SORTING IN DECENDING ORDER
descendingOrderSort ${array[@]}

#TO FUNCTION SORTING RESULTS IN ASCENDING ORDER
function ascendingOrderSort()
{
   for(( index=0; index<${#array[@]}; index ++ ))
   do
      for(( indexOne=0; indexOne<${#array[@]}-1; indexOne ++ ))
      do
         if (( $(echo "${array[indexOne+1]} < ${array[indexOne]}" | bc -l ) ))
         then
            temp=${array[indexOne]}
            array[indexOne]=${array[indexOne+1]}
            array[indexOne+1]=$temp
         fi
      done
   done
   echo "To data ascending order:"${array[@]}
}

#TO FUNCTION CALL FOR SORTING IN ASCENDING ORDER
ascendingOrderSort ${array[@]}
