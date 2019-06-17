#!/bin/bash
for i in `seq 1`
do
	echo $RANDOM
done
if [ $RANDOM -eq 3344 ]; then
	echo "BANG"
else
	echo "WOOW"
fi
exit
