#!/bin/bash

echo Welcon to the flip coin combination program


declare -A result

read -p "How many time do you want to toss" iteration


for ((count=0;count<$iteration;count++))
do

	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))

	if [[ $flip1 -eq 1 ]]
	then

		if [[ $flip2 -eq 1 ]]
		then
			if [[ ${result["HH"]} -eq null ]]
			then
				result["HH"]=1
			else
				result["HH"]=$((${result["HH"]}+1))
			fi
		else
			if [[ ${result["HT"]} -eq null ]]
         then
            result["HT"]=1
         else
            result["HT"]=$((${result["HT"]}+1))
         fi
		fi

	else

		if [[ $flip2 -eq 1 ]]
      then
         if [[ ${result["TH"]} -eq null ]]
         then
            result["TH"]=1
         else
            result["TH"]=$((${result["TH"]}+1))
         fi
      else
         if [[ ${result["TT"]} -eq null ]]
         then
            result["TT"]=1
         else
            result["TT"]=$((${result["TT"]}+1))
      	fi

		fi

	fi


done


echo The win percentage of each combination in the doublet coin toss:
for i in ${!result[@]}
do
   percentWin=$( echo ${result[$i]} $iteration | awk '{print $1/$2 * 100}' )
   echo "$i => $percentWin %"
done


