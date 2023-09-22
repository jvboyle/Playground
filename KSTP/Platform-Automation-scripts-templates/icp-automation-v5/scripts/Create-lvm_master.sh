#master
N=icp
D=sdb
D=/dev/$D
fs1=/var/lib/docker
fs2=/var/lib/etcd
fs3=/var/lib/icp
fs4=/var/lib/mysql
fs5=/var/lib/kubelet
fs6=/var/lib/etcd-wal
fs7=/opt/ibm/cfc
s1=100G
s2=10G
s3=100G
s4=10G
s5=20G
s6=30G
s7=2G
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
#FS 5
lvcreate -L $s5 vg_$N -n lv05_$N
mke2fs -t ext4 /dev/vg_"$N"/lv05_$N
tune2fs -m 0 /dev/vg_"$N"/lv05_$N
mkdir -p $fs5
mount /dev/vg_"$N"/lv05_$N $fs5
echo "/dev/vg_"$N"/lv05_"$N"\t\t"$fs5"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
#FS 6
lvcreate -L $s6 vg_$N -n lv06_$N
mke2fs -t ext4 /dev/vg_"$N"/lv06_$N
tune2fs -m 0 /dev/vg_"$N"/lv06_$N
mkdir -p $fs6
mount /dev/vg_"$N"/lv06_$N $fs6
echo "/dev/vg_"$N"/lv06_"$N"\t\t"$fs6"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
#FS 7
lvcreate -L $s7 vg_$N -n lv07_$N
mke2fs -t ext4 /dev/vg_"$N"/lv07_$N
tune2fs -m 0 /dev/vg_"$N"/lv07_$N
mkdir -p $fs7
mount /dev/vg_"$N"/lv07_$N $fs7
echo "/dev/vg_"$N"/lv07_"$N"\t\t"$fs7"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
rm -rf /var/lib/mysql/*

