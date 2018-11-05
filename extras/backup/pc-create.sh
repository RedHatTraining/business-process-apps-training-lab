rsync -aPv * root@master:/tmp/dc39

ssh root@master oc create -f /tmp/dc39/vol01-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol02-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol03-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol04-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol05-pv.yaml
ssh root@master oc create -f /tmp/dc39/vol06-pv.yaml