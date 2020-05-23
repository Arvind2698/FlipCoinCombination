#!/bin/bash

echo Welcon to the flip coin combination program

flip=$((RANDOM%2))

if [[ $flip -eq 1 ]]
then
	echo HEAD
else
	echo TAIL
fi

