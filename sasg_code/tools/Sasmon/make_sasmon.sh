PKGNAME="sasmon.sh"  # name of self-extracting executable to create
SCRIPTNAME="install_sasmon.sh" #name of script inside self-extracting executable that should be run when unpacked.
SCRIPTDIR="sasmon" # directory name with files to put into self-extracting executable
DATE=$(date +%Y_%m_%d_%H:%M:%S)


if [ -f "$PKGNAME" ];then
  mv $PKGNAME $PKGNAME.$DATE
fi
#/home/sasauto/Tools/reporting/bin/makeself.sh /home/sasauto/Tools/reporting/$SCRIPTDIR $PKGNAME "Sasmon Monitoring Tool" ./$SCRIPTNAME
./bin/makeself.sh ./sasmon $PKGNAME "Sasmon Monitoring Tool" ./$SCRIPTNAME

