#master
N=icp
D=sdb
D=/dev/$D
fs1=/var/lib/docker
fs2=/var/lib/icp
fs3=/var/lib/kubelet
fs4=/opt/ibm/cfc
s1=100G
s2=100G
s3=20G
s4=2G
pvcreate $D
vgcreate vg_$N $D
#FS 1
lvcreate -L $s1 vg_$N -n lv01_$N
mke2fs -t ext4 /dev/vg_"$N"/lv01_$N
tune2fs -m 0 /dev/vg_"$N"/lv01_$N
mkdir -p $fs1
mount /dev/vg_"$N"/lv01_$N $fs1
echo "/dev/vg_"$N"/lv01_"$N"\t\t"$fs1"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
#FS 2
lvcreate -L $s2 vg_$N -n lv02_$N
mke2fs -t ext4 /dev/vg_"$N"/lv02_$N
tune2fs -m 0 /dev/vg_"$N"/lv02_$N
mkdir -p $fs2
mount /dev/vg_"$N"/lv02_$N $fs2
echo "/dev/vg_"$N"/lv02_"$N"\t\t"$fs2"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
#FS 3
lvcreate -L $s3 vg_$N -n lv03_$N
mke2fs -t ext4 /dev/vg_"$N"/lv03_$N
tune2fs -m 0 /dev/vg_"$N"/lv03_$N
mkdir -p $fs3
mount /dev/vg_"$N"/lv03_$N $fs3
echo "/dev/vg_"$N"/lv03_"$N"\t\t"$fs3"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
#FS 4
lvcreate -L $s4 vg_$N -n lv04_$N
mke2fs -t ext4 /dev/vg_"$N"/lv04_$N
tune2fs -m 0 /dev/vg_"$N"/lv04_$N
mkdir -p $fs4
mount /dev/vg_"$N"/lv04_$N $fs4
echo "/dev/vg_"$N"/lv04_"$N"\t\t"$fs4"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
