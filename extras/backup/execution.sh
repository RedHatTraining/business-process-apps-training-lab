1. ssh root@services to create the NFS shares

mkdir -p /var/exports/vol01
mkdir -p /var/exports/vol02
mkdir -p /var/exports/vol03
chown nfsnobody:nfsnobody /var/exports/vol*
chmod a+rwx /var/exports/vol*

2. Export the NFS shares

[root@services ~]# cat /etc/exports.d/jb028-volumes.exports
/var/exports/vol01 *(rw,root_squash)
/var/exports/vol02 *(rw,root_squash)
/var/exports/vol03 *(rw,root_squash)


exportfs -a

3. ssh root@master to create the PVs

oc create -f vol01-pv.yaml
oc create -f vol02-pv.yaml
oc create -f vol03-pv.yaml

oc new-project bxms-pam-dc39
oc label namespace bxms-pam-dc39 AAD='dc39'
oc project default
mkdir /tmp/dc39
    oc process -f https://raw.githubusercontent.com/jboss-container-images/rhpam-7-openshift-image/7.0.2.GA/templates/rhpam70-authoring.yaml \
          -p IMAGE_STREAM_NAMESPACE=bxms-pam-dc39 \
          -p KIE_ADMIN_PWD=test1234! \
          -p APPLICATION_NAME=rht \
          -p BUSINESS_CENTRAL_HTTPS_SECRET=businesscentral-app-secret \
          -p MAVEN_REPO_URL=http://services.lab.example.com:8081/nexus/content/groups/training-java \
          -p KIE_SERVER_HTTPS_SECRET=businesscentral-app-secret > /tmp/dc39/rhpam70-authoring.json 

#- name: Modify template with pause build configs
  #replace:
    #path: '/tmp/dc39/rhpam70-authoring.json'
    #regexp: '("replicas": 1,\n)'
    #replace: '\1\t\t\t\t\t"paused": true,\n'

oc create -f https://raw.githubusercontent.com/jboss-container-images/rhpam-7-openshift-image/7.0.2.GA/example-app-secret-template.yaml -n bxms-pam-dc39
oc create -f /tmp/dc39/rhpam70-image-streams.yaml -n bxms-pam-dc39
oc new-app --template=example-app-secret \
      -p SECRET_NAME=businesscentral-app-secret \
      -n bxms-pam-dc39
oc create -f /tmp/dc39/rhpam70-authoring.json -n bxms-pam-dc39
oc rollout resume dc/rht-rhpamcentr -n bxms-pam-dc39
#  get_url:
#    url: 'https://raw.githubusercontent.com/gpe-mw-training/rhpam-order-fulfillment/master/src/main/resources/products.txt'
#    dest: /tmp/dc39/products.txt

oc create configmap products-cm --from-file=/tmp/dc39/products.txt -n bxms-pam-dc39

oc volume dc/rht-kieserver -n bxms-pam-dc39 \
        --overwrite --add -t configmap -m /data --name=products-volume --configmap-name=products-cm

oc rollout resume dc/rht-kieserver -n bxms-pam-dc39

#- include_tasks: ./wait_for_deploy.yml
#static: no
#  vars:
#    pod_to_wait:
#      - "rht-kieserver"

oc annotate namespace bxms-pam-dc39 openshift.io/requester=developer --overwrite

oc policy add-role-to-user admin developer -n bxms-pam-dc39
