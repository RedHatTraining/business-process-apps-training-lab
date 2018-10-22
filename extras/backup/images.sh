rsync -aPv docker-clean root@services:/etc/sysconfig/docker
ssh root@services systemctl restart docker

ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.2
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.2
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-controller-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-controller-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-controller-openshift:1.2
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-kieserver-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-kieserver-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-kieserver-openshift:1.2
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-smartrouter-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-smartrouter-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhpam-7/rhpam70-smartrouter-openshift:1.2
ssh root@services docker pull registry.access.redhat.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.2
ssh root@services docker pull registry.access.redhat.com/rhdm-7/rhdm70-decisioncentral-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhdm-7/rhdm70-decisioncentral-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhdm-7/rhdm70-kieserver-openshift:1.0
ssh root@services docker pull registry.access.redhat.com/rhdm-7/rhdm70-kieserver-openshift:1.1
ssh root@services docker pull registry.access.redhat.com/rhscl/nodejs-8-rhel7:latest

ssh root@services docker tag registry.access.redhat.com/rhdm-7/rhdm70-decisioncentral-openshift:1.0 registry.lab.example.com/rhdm-7/rhdm70-decisioncentral-openshift:1.0
ssh root@services docker tag registry.access.redhat.com/rhdm-7/rhdm70-decisioncentral-openshift:1.1 registry.lab.example.com/rhdm-7/rhdm70-decisioncentral-openshift:1.1
ssh root@services docker tag registry.access.redhat.com/rhdm-7/rhdm70-kieserver-openshift:1.0 registry.lab.example.com/rhdm-7/rhdm70-kieserver-openshift:1.0
ssh root@services docker tag registry.access.redhat.com/rhdm-7/rhdm70-kieserver-openshift:1.1 registry.lab.example.com/rhdm-7/rhdm70-kieserver-openshift:1.1
ssh root@services docker tag registry.access.redhat.com/rhscl/nodejs-8-rhel7:latest registry.lab.example.com/node:latest
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.0 registry.lab.example.com/rhpam-7/rhpam70-businesscentral-openshift:1.0 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.1 registry.lab.example.com/rhpam-7/rhpam70-businesscentral-openshift:1.1 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.2  registry.lab.example.com/rhpam-7/rhpam70-businesscentral-openshift:1.2
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.0 registry.lab.example.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.0
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.1 registry.lab.example.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.1 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.2 registry.lab.example.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.2 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-controller-openshift:1.0 registry.lab.example.com/rhpam-7/rhpam70-controller-openshift:1.0 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-controller-openshift:1.1 registry.lab.example.com/rhpam-7/rhpam70-controller-openshift:1.1 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-controller-openshift:1.2 registry.lab.example.com/rhpam-7/rhpam70-controller-openshift:1.2 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-kieserver-openshift:1.0 registry.lab.example.com/rhpam-7/rhpam70-kieserver-openshift:1.0 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-kieserver-openshift:1.1 registry.lab.example.com/rhpam-7/rhpam70-kieserver-openshift:1.1 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-kieserver-openshift:1.2 registry.lab.example.com/rhpam-7/rhpam70-kieserver-openshift:1.2 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-smartrouter-openshift:1.0 registry.lab.example.com/rhpam-7/rhpam70-smartrouter-openshift:1.0 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-smartrouter-openshift:1.1 registry.lab.example.com/rhpam-7/rhpam70-smartrouter-openshift:1.1 
ssh root@services docker tag registry.access.redhat.com/rhpam-7/rhpam70-smartrouter-openshift:1.2 registry.lab.example.com/rhpam-7/rhpam70-smartrouter-openshift:1.2 
ssh root@services docker tag registry.access.redhat.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.0 registry.lab.example.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.0 
ssh root@services docker tag registry.access.redhat.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.1 registry.lab.example.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.1 
ssh root@services docker tag registry.access.redhat.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.2 registry.lab.example.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.2 

ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-businesscentral-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-businesscentral-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-businesscentral-openshift:1.2
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-businesscentral-monitoring-openshift:1.2
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-controller-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-controller-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-controller-openshift:1.2
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-kieserver-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-kieserver-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-kieserver-openshift:1.2
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-smartrouter-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-smartrouter-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhpam-7/rhpam70-smartrouter-openshift:1.2
ssh root@services docker push registry.lab.example.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhpam-7-tech-preview/rhpam70-businesscentral-indexing-openshift:1.2

ssh root@services docker push registry.lab.example.com/rhdm-7/rhdm70-decisioncentral-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhdm-7/rhdm70-decisioncentral-openshift:1.1
ssh root@services docker push registry.lab.example.com/rhdm-7/rhdm70-kieserver-openshift:1.0
ssh root@services docker push registry.lab.example.com/rhdm-7/rhdm70-kieserver-openshift:1.1
ssh root@services docker push registry.lab.example.com/node:latest

rsync -aPv docker root@services:/etc/sysconfig/docker
ssh root@services systemctl restart docker