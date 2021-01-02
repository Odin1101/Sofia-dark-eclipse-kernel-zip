# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Dark-Eclipse-Kernel-v2.0-beta
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=Sofia
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 755 $ramdisk/*;
# set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

ui_print " **********************disclaimer*********************"
ui_print ""
ui_print "  This kernel is a work in progress.";
ui_print "  No guarantees or warranties are given or implied."
ui_print "  you are choosing to make these modifications,"
ui_print "  use at your own risk."
ui_print ""
ui_print " *****************************************************"

## AnyKernel install
dump_boot;

if [ -d $ramdisk/.backup ]; then

write_boot;

else

abort "spectrum components in the zip require magisk to function";

fi;
## end install
