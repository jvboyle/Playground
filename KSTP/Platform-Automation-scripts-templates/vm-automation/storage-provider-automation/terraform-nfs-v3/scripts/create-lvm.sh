N=1
D=sdb
D=/dev/$D
pvcreate $D
vgcreate vg_$N $D
S=$(vgdisplay vg_$N | grep Total | perl -pe 's/[^0-9]+//g')
lvcreate -l $S vg_$N -n lv_$N
mke2fs -t ext4 /dev/vg_"$N"/lv_$N
tune2fs -m 0 /dev/vg_"$N"/lv_$N
mkdir /data
mount /dev/vg_"$N"/lv_$N /data
echo "/dev/vg_"$N"/lv_"$N"\t\t/data\t\text4\tdefaults\t\t0 2" >> /etc/fstab
