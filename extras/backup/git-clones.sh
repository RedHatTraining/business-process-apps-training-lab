ssh root@services git clone https://github.com/gpe-mw-training/gpte-ng-dmf.git
ssh root@services "sed -i -e 's|git+https://github.com/gpe-mw-training/gpte-ng-dmf.git|http://services.lab.example.com/gpte-ng-dmf|' /root/gpte-ng-dmf/package.json"
ssh root@services "sed -i -e 's|npm install express && npm install http && npm install path && node server.js|npm config set registry \"http://services.lab.example.com:8081/nexus/content/groups/nodejs\" && npm install express && npm install http && npm install path && node server.js|' /root/gpte-ng-dmf/package.json"
ssh root@services mkdir /var/www/git/gpte-ng-dmf
ssh root@services 'cd /var/www/git/gpte-ng-dmf/ && git init --bare'
ssh root@services 'cd /var/www/git/gpte-ng-dmf/ && git update-server-info'
ssh root@services 'cd /var/www/git/gpte-ng-dmf/ && chown -R apache:apache .'
ssh root@services 'cd /var/www/git/gpte-ng-dmf/ && chcon -R -t git_rw_content_t .'
ssh root@services 'cd gpte-ng-dmf && rm -rf .git'
ssh root@services 'cd gpte-ng-dmf && git init'
ssh root@services 'cd gpte-ng-dmf && git add .'
ssh root@services 'cd gpte-ng-dmf && git commit -m "Establish remote repository"'
ssh root@services 'cd gpte-ng-dmf && git push -u http://localhost/gpte-ng-dmf master'
ssh root@services rm -rf gpte-ng-dmf

ssh root@services git clone https://github.com/gpe-mw-training/bxms_decision_mgmt_foundations_lab.git
ssh root@services mkdir /var/www/git/bxms_decision_mgmt_foundations_lab
ssh root@services 'cd /var/www/git/bxms_decision_mgmt_foundations_lab/ && git init --bare'
ssh root@services 'cd /var/www/git/bxms_decision_mgmt_foundations_lab/ && git update-server-info'
ssh root@services 'cd /var/www/git/bxms_decision_mgmt_foundations_lab/ && chown -R apache:apache .'
ssh root@services 'cd /var/www/git/bxms_decision_mgmt_foundations_lab/ && chcon -R -t git_rw_content_t .'
ssh root@services 'cd bxms_decision_mgmt_foundations_lab && rm -rf .git'
ssh root@services 'cd bxms_decision_mgmt_foundations_lab && git init'
ssh root@services 'cd bxms_decision_mgmt_foundations_lab && git add .'
ssh root@services 'cd bxms_decision_mgmt_foundations_lab && git commit -m "Establish remote repository"'
ssh root@services 'cd bxms_decision_mgmt_foundations_lab && git push -u http://localhost/bxms_decision_mgmt_foundations_lab master'
ssh root@services rm -rf bxms_decision_mgmt_foundations_lab

ssh root@services git clone https://github.com/gpe-mw-training/dm7-customer-greeting.git
ssh root@services mkdir /var/www/git/dm7-customer-greeting
ssh root@services 'cd /var/www/git/dm7-customer-greeting/ && git init --bare'
ssh root@services 'cd /var/www/git/dm7-customer-greeting/ && git update-server-info'
ssh root@services 'cd /var/www/git/dm7-customer-greeting/ && chown -R apache:apache .'
ssh root@services 'cd /var/www/git/dm7-customer-greeting/ && chcon -R -t git_rw_content_t .'
ssh root@services 'cd dm7-customer-greeting && rm -rf .git'
ssh root@services 'cd dm7-customer-greeting && git init'
ssh root@services 'cd dm7-customer-greeting && git add .'
ssh root@services 'cd dm7-customer-greeting && git commit -m "Establish remote repository"'
ssh root@services 'cd dm7-customer-greeting && git push -u http://localhost/dm7-customer-greeting master'
ssh root@services rm -rf dm7-customer-greeting

ssh root@services git clone https://github.com/RedHatTraining/business-process-apps-training-lab.git
ssh root@services mkdir /var/www/git/business-process-apps-training-lab
ssh root@services 'cd /var/www/git/business-process-apps-training-lab/ && git init --bare'
ssh root@services 'cd /var/www/git/business-process-apps-training-lab/ && git update-server-info'
ssh root@services 'cd /var/www/git/business-process-apps-training-lab/ && chown -R apache:apache .'
ssh root@services 'cd /var/www/git/business-process-apps-training-lab/ && chcon -R -t git_rw_content_t .'
ssh root@services 'cd business-process-apps-training-lab && rm -rf .git'
ssh root@services 'cd business-process-apps-training-lab && git init'
ssh root@services 'cd business-process-apps-training-lab && git add .'
ssh root@services 'cd business-process-apps-training-lab && git commit -m "Establish remote repository"'
ssh root@services 'cd business-process-apps-training-lab && git push -u http://localhost/business-process-apps-training-lab master'
ssh root@services rm -rf business-process-apps-training-lab


ssh root@services git clone https://github.com/jbossdemocentral/rhpam7-mortgage-demo-repo.git
ssh root@services mkdir /var/www/git/rhpam7-mortgage-demo-repo
ssh root@services 'cd /var/www/git/rhpam7-mortgage-demo-repo/ && git init --bare'
ssh root@services 'cd /var/www/git/rhpam7-mortgage-demo-repo/ && git update-server-info'
ssh root@services 'cd /var/www/git/rhpam7-mortgage-demo-repo/ && chown -R apache:apache .'
ssh root@services 'cd /var/www/git/rhpam7-mortgage-demo-repo/ && chcon -R -t git_rw_content_t .'
ssh root@services 'cd rhpam7-mortgage-demo-repo && rm -rf .git'
ssh root@services 'cd rhpam7-mortgage-demo-repo && git init'
ssh root@services 'cd rhpam7-mortgage-demo-repo && git add .'
ssh root@services 'cd rhpam7-mortgage-demo-repo && git commit -m "Establish remote repository"'
ssh root@services 'cd rhpam7-mortgage-demo-repo && git push -u http://localhost/rhpam7-mortgage-demo-repo master'
ssh root@services rm -rf rhpam7-mortgage-demo-repo

ssh root@services git clone https://github.com/gpe-mw-training/advanced-process-development-labs-etc.git
ssh root@services mkdir /var/www/git/advanced-process-development-labs-etc
ssh root@services 'cd /var/www/git/advanced-process-development-labs-etc/ && git init --bare'
ssh root@services 'cd /var/www/git/advanced-process-development-labs-etc/ && git update-server-info'
ssh root@services 'cd /var/www/git/advanced-process-development-labs-etc/ && chown -R apache:apache .'
ssh root@services 'cd /var/www/git/advanced-process-development-labs-etc/ && chcon -R -t git_rw_content_t .'
ssh root@services 'cd advanced-process-development-labs-etc && rm -rf .git'
ssh root@services 'cd advanced-process-development-labs-etc && git init'
ssh root@services 'cd advanced-process-development-labs-etc && git add .'
ssh root@services 'cd advanced-process-development-labs-etc && git commit -m "Establish remote repository"'
ssh root@services 'cd advanced-process-development-labs-etc && git push -u http://localhost/advanced-process-development-labs-etc master'
ssh root@services rm -rf advanced-process-development-labs-etc
