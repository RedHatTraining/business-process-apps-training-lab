ssh root@master oc new-project bxms-dm-dc39

ssh root@master oc label namespace bxms-dm-dc39 AAD='dc39'

ssh root@master oc project default

ssh root@master mkdir /tmp/dc39

rsync -aPv * root@master:/tmp/dc39

ssh root@master oc create -f /tmp/dc39/dm-image-streams.yaml -n openshift
ssh root@master oc create -f /tmp/dc39/rhdm7-full-ng.yaml -n bxms-dm-dc39
ssh root@master oc import-image node:latest --from=registry.lab.example.com/node:latest --confirm -n openshift
ssh root@master oc new-app --name=dm-demo -n bxms-dm-dc39 --template=rhdm7-full-ng \
      -p RHT_IMAGE_STREAM_NAMESPACE=openshift \
      -p KIE_ADMIN_PWD=test1234! \
      -p MAVEN_REPO_PASSWORD=test1234! \
      -p CLUSTER=master.lab.example.com \
      -p PROJECT=bxms-dm-dc39 \
      -p APPLICATION_NAME=gpte > /tmp/dc39/gpte-dm-demo.txt

ssh root@master oc rollout resume dc/gpte-rhdmcentr -n bxms-dm-dc39
ssh root@master oc rollout resume dc/gpte-kieserver -n bxms-dm-dc39

ssh root@master oc rollout resume dc/gpte-ng-dmf -n bxms-dm-dc39



ssh root@master oc annotate namespace bxms-dm-dc39 openshift.io/requester=developer --overwrite

ssh root@master oc policy add-role-to-user admin developer -n bxms-dm-dc39
