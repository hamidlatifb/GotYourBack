#!/bin/bash

echo
echo "HALLO! Welcome"
echo "
 ██████╗     ██╗   ██╗    ██████╗
██╔════╝     ╚██╗ ██╔╝    ██╔══██╗
██║  ███╗     ╚████╔╝     ██████╔╝
██║   ██║      ╚██╔╝      ██╔══██╗
╚██████╔╝OT     ██║OUR    ██████╔╝ACK
 ╚═════╝        ╚═╝       ╚═════╝"
echo
echo "This is a simple backup script that will create a compressed backup of your chosen directory."
read -p "Enter the directory name you want to backup: " file_name

today=$(date +%Y-%m-%d)


if [ -d "$file_name" ]; then
	echo "Directory found! Starting the backup............."
	tar -czvf "${file_name}_backup_${today}.tar.gz" "$file_name"
else
	echo "Error: Directory '$file_name' does not exist in this path."
	exit 1
fi
read -p "Enable automatic backup deletion? (Y/N): " answer

case "$answer" in
    [yY]|[yY][eE][sS])
        read -p "After how many days you want the backup file to be deleted: " delete_time
	if [[ "$delete_time" =~ ^[0-9]+$ ]]; then
            # FIX 2: Actually remove backups older than the specified days
            find . -name "${file_name}_backup_*.tar.gz" -type f -mtime +"$delete_time" -exec rm -f {} \;
            echo "Backup created! Older backups matching this name (> $delete_time days old) have been cleaned up."
        else
            echo "Invalid number of days entered. Skipping deletion step."
	fi
        ;;
    [nN]|[nN][oO])
        echo "Backup complete. Goodbye!"
        ;;
    *)
        echo "Invalid Input. Skipping deletion step."
        ;;
esac
