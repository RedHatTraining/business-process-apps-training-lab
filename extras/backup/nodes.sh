rsync -aPv training.repo root@master:/etc/yum.repos.d/
rsync -aPv training.repo root@node1:/etc/yum.repos.d/
rsync -aPv training.repo root@node2:/etc/yum.repos.d/
rsync -aPv training.repo root@services:/etc/yum.repos.d/
rsync -aPv training.repo root@workstation:/etc/yum.repos.d/
