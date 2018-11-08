ssh root@services mkdir /tmp/dc39
ssh root@services rsync -aPv * /tmp/dc39
ssh root@services systemctl stop nexus
ssh root@services rm -rf /opt/nexus*
ssh root@services wget https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -p /opt
ssh root@services tar xzvf /opt/nexus*.tar.gz -C /opt
ssh root@services chown -R nexus:nexus /opt/nexus*
ssh root@services chown -R nexus:nexus /opt/sonatype-work
nexus_dir=$(ssh root@services ls /opt/nexus*)
ssh root@services ln -s /opt/${nexus_dir} /opt/nexus
ssh root@services systemctl start nexus