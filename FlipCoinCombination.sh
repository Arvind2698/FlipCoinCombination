#!/bin/bash 

echo Welcon to the flip coin combination program


#VARIABLES
headWinCounter=0
tailWinCounter=0

declare -A result1


read -p "How many time do you want to flip the coin" iteration

echo The Single Coin Toss

for((count=0;count<$iteration;count++))
do
	flip=$((RANDOM%2))
	if [[ $flip -eq 1 ]]
	then
		if [[ ${result1["H"]} -eq null ]]
		then
			result1["H"]=1
		else
			result1["H"]=$((${result1["H"]}+1))
		fi

	else
	 	if [[ ${result1["T"]} -eq null ]]
      then
         result1["T"]=1
      else
         result1["T"]=$((${result1["T"]}+1))
      fi

	fi
done


echo The win percentage of each combination in the singlet coin toss:

for i in ${!result1[@]}
do
   percentWin=$( echo ${result1[$i]} $iteration | awk '{print $1/$2 * 100}' )
   echo "$i => $percentWin %"
done




declare -A result2

echo The Double Coin Toss

for ((count=0;count<$iteration;count++))
do

	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))

	if [[ $flip1 -eq 1 ]]
	then

		if [[ $flip2 -eq 1 ]]
		then
			if [[ ${result2["HH"]} -eq null ]]
			then
				result2["HH"]=1
			else
				result2["HH"]=$((${result2["HH"]}+1))
			fi
		else
			if [[ ${result2["HT"]} -eq null ]]
         then
            result2["HT"]=1
         else
            result2["HT"]=$((${result2["HT"]}+1))
         fi
		fi

	else

		if [[ $flip2 -eq 1 ]]
      then
         if [[ ${result2["TH"]} -eq null ]]
         then
            result2["TH"]=1
         else
            result2["TH"]=$((${result2["TH"]}+1))
         fi
      else
         if [[ ${result2["TT"]} -eq null ]]
         then
            result2["TT"]=1
         else
            result2["TT"]=$((${result2["TT"]}+1))
      	fi

		fi

	fi


done


echo The win percentage of each combination in the doublet coin toss:

for i in ${!result2[@]}
do
   percentWin=$( echo ${result2[$i]} $iteration | awk '{print $1/$2 * 100}' )
   echo "$i => $percentWin %"
done


