ssh root@services mkdir /tmp/dc39
rsync -aPv * root@services:/tmp/dc39
ssh root@services mkdir -p /var/exports/vol01
ssh root@services mkdir -p /var/exports/vol02
ssh root@services mkdir -p /var/exports/vol03
ssh root@services mkdir -p /var/exports/vol04
ssh root@services mkdir -p /var/exports/vol05
ssh root@services mkdir -p /var/exports/vol06

ssh root@services chown nfsnobody:nfsnobody /var/exports/vol*

ssh root@services chmod a+rwx /var/exports/vol*

2. Export the NFS shares

[root@services ~]# cat /etc/exports.d/jb028-volumes.exports
/var/exports/vol01 *(rw,root_squash)
/var/exports/vol02 *(rw,root_squash)
/var/exports/vol03 *(rw,root_squash)
/var/exports/vol04 *(rw,root_squash)
/var/exports/vol05 *(rw,root_squash)
/var/exports/vol06 *(rw,root_squash)

ssh root@services exportfs -a

rsync -aPv * root@master:/tmp/dc39

3. ssh root@master to create the PVs

ssh root@master oc create -f /tmp/dc39/vol01-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol02-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol03-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol04-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol05-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol06-pv.yaml