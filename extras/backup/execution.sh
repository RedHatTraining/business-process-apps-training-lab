# Create PAM without database
ssh root@classroom rht-config-nat
ssh root@master oc new-project bxms-pam-dc39
ssh root@master oc label namespace bxms-pam-dc39 AAD='dc39'
ssh root@master oc project default
ssh root@master mkdir /tmp/dc39
rsync -aPv * root@master:/tmp/dc39

ssh root@master oc create -f https://raw.githubusercontent.com/jboss-container-images/rhpam-7-openshift-image/7.0.2.GA/example-app-secret-template.yaml -n bxms-pam-dc39
ssh root@master oc create -f /tmp/dc39/rhpam70-image-streams.yaml -n openshift
ssh root@master oc new-app --template=example-app-secret \
      -p SECRET_NAME=businesscentral-app-secret \
      -n bxms-pam-dc39
ssh root@master oc create -f /tmp/dc39/rhpam70-authoring.json -n bxms-pam-dc39
ssh root@master oc rollout resume dc/rht-rhpamcentr -n bxms-pam-dc39
ssh root@master oc create configmap products-cm --from-file=/tmp/dc39/products.txt -n bxms-pam-dc39

ssh root@master oc volume dc/rht-kieserver -n bxms-pam-dc39 \
        --overwrite --add -t configmap -m /data --name=products-volume --configmap-name=products-cm

ssh root@master oc rollout resume dc/rht-kieserver -n bxms-pam-dc39

#- include_tasks: ./wait_for_deploy.yml
#static: no
#  vars:
#    pod_to_wait:
#      - "rht-kieserver"

ssh root@master oc annotate namespace bxms-pam-dc39 openshift.io/requester=developer --overwrite

ssh root@master oc policy add-role-to-user admin developer -n bxms-pam-dc39

