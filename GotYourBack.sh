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

if [ -d "$file_name" ]; then
	echo "Directory found! Starting the backup............."
	tar -czvf "${file_name}_backup.tar.gz" "$file_name"
else
	echo "Error: Directory '$file_name' does not exist in this path."
	exit 1
fi
