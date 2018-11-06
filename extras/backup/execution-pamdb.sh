# Create PAM with Postgresql
ssh root@classroom rht-config-nat
ssh root@master oc new-project bxms-pamdb-dc39
ssh root@master oc label namespace bxms-pamdb-dc39 AAD='dc39'
ssh root@master oc project default

#ssh root@master oc process -f /tmp/dc39/rhpam70-authoring-db.yaml \
#          -p IMAGE_STREAM_NAMESPACE=openshift \
#          -p KIE_ADMIN_PWD=test1234! \
#          -p APPLICATION_NAME=rht \
#          -p BUSINESS_CENTRAL_HTTPS_SECRET=businesscentral-app-secret \
#          -p MAVEN_REPO_URL=http://services.lab.example.com:8081/nexus/content/groups/training-java \
#          -p POSTGRESQL_IMAGE_STREAM_TAG=9.5 \
#          -p KIE_SERVER_HTTPS_SECRET=businesscentral-app-secret > /tmp/dc39/rhpam70-authoring-db.json 
ssh root@master oc create -f https://raw.githubusercontent.com/jboss-container-images/rhpam-7-openshift-image/7.0.2.GA/example-app-secret-template.yaml -n bxms-pamdb-dc39
ssh root@master oc new-app --template=example-app-secret \
      -p SECRET_NAME=businesscentral-app-secret \
      -n bxms-pamdb-dc39
ssh root@master oc create -f /tmp/dc39/rhpam70-authoring-db.json -n bxms-pamdb-dc39
ssh root@master oc rollout resume dc/rht-rhpamcentr -n bxms-pamdb-dc39
ssh root@master oc create configmap products-cm --from-file=/tmp/dc39/products.txt -n bxms-pamdb-dc39
ssh root@master oc volume dc/rht-kieserver -n bxms-pamdb-dc39 \
        --overwrite --add -t configmap -m /data --name=products-volume --configmap-name=products-cm

ssh root@master oc rollout resume dc/rht-kieserver -n bxms-pamdb-dc39


#- include_tasks: ./wait_for_deploy.yml
#static: no
#  vars:
#    pod_to_wait:
#      - "rht-kieserver"

ssh root@master oc annotate namespace bxms-pamdb-dc39 openshift.io/requester=developer --overwrite

ssh root@master oc policy add-role-to-user admin developer -n bxms-pamdb-dc39

