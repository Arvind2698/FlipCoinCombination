#!/bin/bash

echo Welcon to the flip coin combination program


declare -A result

read -p "How many time do you want to toss" iteration


for ((count=0;count<$iteration;count++))
do

    flip1=$((RANDOM%2))
    flip2=$((RANDOM%2))
    flip3=$((RANDOM%2))

    if [[ $flip1 -eq 1 ]]
    then
        if [[ $flip2 -eq 1 ]]
        then
            if [[ $flip3 -eq 1 ]]
            then
                if [[ ${result["HHH"]} -eq null ]]
                then
                    result["HHH"]=1
                else
                    result["HHH"]=$((${result["HHH"]}+1))
                fi
            else
                if [[ ${result["HHT"]} -eq null ]]
                then
                    result["HHT"]=1
                else
                    result["HHT"]=$((${result["HHT"]}+1))
                fi
            fi
        else
            if [[ $flip3 -eq 1 ]]
            then
                if [[ ${result["HTH"]} -eq null ]]
                then
                    result["HTH"]=1
                else
                    result["HTH"]=$((${result["HTH"]}+1))
                fi
            else
                if [[ ${result["HTT"]} -eq null ]]
                then
                    result["HTT"]=1
                else
                    result["HTT"]=$((${result["HTT"]}+1))
                fi
            fi
        fi
    else
        if [[ $flip2 -eq 1 ]]
        then
            if [[ $flip3 -eq 1 ]]
            then
                if [[ ${result["THH"]} -eq null ]]
                then
                    result["THH"]=1
                else
                    result["THH"]=$((${result["THH"]}+1))
                fi
            else
                if [[ ${result["THT"]} -eq null ]]
                then
                    result["THT"]=1
                else
                    result["THT"]=$((${result["THT"]}+1))
                fi
            fi
        else
            if [[ $flip3 -eq 1 ]]
            then
                if [[ ${result["TTH"]} -eq null ]]
                then
                    result["TTH"]=1
                else
                    result["TTH"]=$((${result["TTH"]}+1))
                fi
            else
                if [[ ${result["TTT"]} -eq null ]]
                then
                    result["TTT"]=1
                else
                    result["TTT"]=$((${result["TTT"]}+1))
                fi
            fi
        fi
    fi

done

for i in ${!result[@]}
do
        echo "$i => ${result[$i]}"
done

