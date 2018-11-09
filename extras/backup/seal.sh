ssh root@workstation 'echo -e "RHT_VENUE=ilt\nRHT_ROLE=workstation\nRHT_ENROLLMENT=\nRHT_COURSE=\nRHT_TITLE=\nRHT_VMTREE=rhel7.5/x86_64\nRHT_NETWORK=no" > /etc/rht'
ssh root@master "sed -i -e 's|^RHT_COURSE=.*|RHT_COURSE=|' /etc/rht"
ssh root@node1 "sed -i -e 's|^RHT_COURSE=.*|RHT_COURSE=|' /etc/rht"
ssh root@node2 "sed -i -e 's|^RHT_COURSE=.*|RHT_COURSE=|' /etc/rht"
ssh root@services "sed -i -e 's|^RHT_COURSE=.*|RHT_COURSE=|' /etc/rht"