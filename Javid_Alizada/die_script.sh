#!/bin/bash
echo -n "choose your destiny:"
read lab_var03
DESTINY="I want develop my self"
if [ $lab_var03 -ne $DESTINY ]; then
	echo "come on die young"
else
	echo "i thinks sky's hear you"
fi
exit
