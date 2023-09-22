#master
N=icp
D=sdb
D=/dev/$D
fs1=/storage
s1=199G
pvcreate $D
vgcreate vg_$N $D
#FS 1
lvcreate -L $s1 vg_$N -n lv01_$N
mke2fs -t ext4 /dev/vg_"$N"/lv01_$N
tune2fs -m 0 /dev/vg_"$N"/lv01_$N
mkdir -p $fs1
mount /dev/vg_"$N"/lv01_$N $fs1
echo "/dev/vg_"$N"/lv01_"$N"\t\t"$fs1"\t\text4\tdefaults\t\t0 2" >> /etc/fstab
