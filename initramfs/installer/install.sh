#!/bin/sh

clear
echo "sth404_OS Installer"
echo
DISKS=""

for d in /sys/block*; do
	name=$(basename "$d")
	case "$name" in
		sd*|vd*|nvme*n*)
			DISKS="$DISKS /dev/$name"
		;;
	esac
done

if [ -z "$DISKS" ]; then
	echo "No disks found"
	exit 1
fi

echo "Available disks:"
i=1
for d in $DISKS; do
	size=$(cat /sys/block/$(basename $d)/size)
	size_mb=$((size / 2048))
	echo " [$i] $d (${size_mb}MB)"
	i=$((i+1))
done

echo
echo -n "Select disk number: "
read choice

i=1
for d in $DISKS; do
	if [ "$i" = "$choice" ]; then
		TARGET="$d"
		break
	fi
	i=$((i+1))
done

if [ -z "$TARGET" ]; then
	echo "Invalid selection"
	exit 1
fi

echo
echo "Selected: $TARGET"
echo -n "THIS WILL ERASE THE DISK. Type YES(in the same case) to continue:"
read confirm

[ "$confirm" = "YES" ] || exit 1

mkfs.ext4 "$TARGET" || exit 1

mkdir -p /mnt/target
mount "$TARGET" /mnt/target || exit 1

cd /mnt/target || exit 1
tar -xzf /rootfs.gz || exit 1

sync
umount /mnt/target

echo
echo "Installation complete..."
echo "Now you can either continue testing or remove the installation media and reboot"
echo
