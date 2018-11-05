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

rsync -aPv jb028-volumes.exports root@services:/etc/exports.d/

ssh root@services exportfs -a

