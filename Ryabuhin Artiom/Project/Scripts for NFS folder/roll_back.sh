# rolling back from backup file
# /mnt/nfs/html
# /mnt/nfs/sqldata
tar zxvf /mnt/nfs/backup/$1 -C /tmp/tmproll/
cp --recursive /tmp/tmproll/mnt/ /
rm -rf /tmp/tmproll/mnt
