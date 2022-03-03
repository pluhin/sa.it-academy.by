helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/

helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
             --set nfs.server=192.168.37.105 \
             --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-19-22/Dmitry_Boyko/storage/ \
             --set storageClass.accessModes=ReadWriteMany
