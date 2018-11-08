#!/bin/bash

course=jb373
RHELVER=7.5
DATE=`date +%Y%m%d`
cd /var/lib/libvirt/images
tgtdir=/content/cache

echo "Generating 40GB VDA disks"
for i in node1 node2 master ; do
  echo Generating $i
  qemu-img commit do999-$i-vda.ovl
  srcqc=do999-$i-vda.qcow2
  dstqc=$course-$i-vda-40G-$RHELVER-$DATE.qcow2
  virt-sparsify --compress ${srcqc} ${tgtdir}/${dstqc}
done

echo
echo
echo "Generating 100GB VDA from workstation"
qemu-img commit $course-workstation-vda.ovl
srcqc=do999-workstation-vda.qcow2
dstqc=$course-workstation-vda-100G-$RHELVER-$DATE.qcow2
virt-sparsify --compress ${srcqc} ${tgtdir}/${dstqc}

echo
echo
echo "Generating 20GB VDB disks"
for i in node1 node2 master ; do
  echo Generating $i
  qemu-img commit $course-$i-vdb.ovl
  srcqc=do999-$i-vdb.qcow2
  dstqc=$course-$i-vdb-20G-$RHELVER-$DATE.qcow2
  virt-sparsify --compress ${srcqc} ${tgtdir}/${dstqc}
done

echo "Generating 100GB VDA from services"
qemu-img commit $course-services-vda.ovl
srcqc=do999-services-vda.qcow2
dstqc=$course-services-vda-100G-$RHELVER-$DATE.qcow2
virt-sparsify --compress ${srcqc} ${tgtdir}/${dstqc}