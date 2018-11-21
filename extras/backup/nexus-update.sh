ssh root@classroom rht-config-nat
ssh root@services mkdir /tmp/dc39
rsync -aPv * root@services:/tmp/dc39
ssh root@services systemctl stop nexus
ssh root@services rm -rf /opt/nexus*
ssh root@services wget -O /opt/nexus-latest-bundle.tar.gz https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz 
ssh root@services tar xzvf /opt/nexus-latest-bundle.tar.gz -C /opt
ssh root@services chown -R nexus:nexus /opt/nexus*
ssh root@services chown -R nexus:nexus /opt/sonatype-work
nexus_dir=$(ssh root@services "ls /opt | grep nexus-2.14")
ssh root@services ln -s /opt/${nexus_dir} /opt/nexus
ssh root@services systemctl start nexus