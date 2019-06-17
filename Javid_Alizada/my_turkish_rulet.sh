#!/bin/bash
for i in `seq 1`
do
	echo $RANDOM
done
if [ $RANDOM -ne 7788 ]; then
	echo "BANG BANG BANG"
else
	echo "WOOOOWWWW"
fi
exit
