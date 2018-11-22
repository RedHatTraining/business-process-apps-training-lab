ssh root@workstation yum install -y libreoffice-calc
rsync -aPv /home/kiosk/Downloads/devstudio-*.jar student@workstation:/home/student
rsync -aPv InstallConfigRecord.xml student@workstation:/home/student
ssh student@workstation java -jar /home/student/devstudio-*.jar /home/student/InstallConfigRecord.xml
rsync -aPv JBDS.desktop student@workstation:/home/student/Desktop/
ssh root@workstation chown -R student:student /home/student/jbds
ssh root@workstation chown -R student:student /home/student/Desktop/*
ssh root@workstation rm -rf /home/student/devstudio-*.jar
ssh root@workstation rm -rf /home/student/InstallConfigRecord.xml