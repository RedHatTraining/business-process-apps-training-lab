oc new-project bxms-dm-dc39

oc label namespace bxms-dm-dc39 AAD='dc39'

oc project default

mkdir /tmp/dc39

oc create -f /tmp/dc39/dm-image-streams.yaml -n bxms-dm-dc39
oc create -f rhdm7-full-ng.yaml -n bxms-dm-dc39
oc new-app --name=dm-demo -n bxms-dm-dc39 --template=rhdm7-full-ng \
      -p RHT_IMAGE_STREAM_NAMESPACE=bxms-dm-dc39 \
      -p KIE_ADMIN_PWD=test1234! \
      -p MAVEN_REPO_PASSWORD=test1234! \
      -p CLUSTER=master.lab.example.com \
      -p PROJECT=bxms-dm-dc39 \
      -p APPLICATION_NAME=gpte > /tmp/dc39/gpte-dm-demo.txt

oc rollout resume dc/gpte-rhdmcentr -n bxms-dm-dc39
oc rollout resume dc/gpte-kieserver -n bxms-dm-dc39

oc rollout resume dc/gpte-ng-dmf -n bxms-dm-dc39



oc annotate namespace bxms-dm-dc39 openshift.io/requester=developer --overwrite

oc policy add-role-to-user admin developer -n bxms-dm-dc39
