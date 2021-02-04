#!/usr/bin/env bash

readarray -t list < /mnt/nfs/backup_list.lst

PS3='Please enter your choice or 0 to exit: '
select selection in "${list[@]}"; do
    if [[ $REPLY == "0" ]]; then
        echo 'Goodbye' >&2
        exit
    else
       echo $REPLY $selection
       bash /mnt/nfs/scripts/roll_back.sh $selection
        break
    fi
done
