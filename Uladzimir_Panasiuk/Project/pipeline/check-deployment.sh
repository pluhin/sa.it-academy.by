#!/bin/bash

for (( i=0; i<$1; i++ )); do
  if curl --location --silent "$2" | grep "$3" &>/dev/null; then
    exit
  else
    sleep 1
  fi
done

exit 1
