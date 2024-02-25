#!/bin/bash

echo "Enter the Source path!"
read source
echo "Enter the Destination path!"
read destination
echo "Enter How much copies you want to keep"
read max

if [ -d $source ];then
	echo "checking source path"
	sleep 5
	echo "completed scanning...!"
else
	echo "file path does'nt exist"
	exit 1
fi

if [ -d $destination ];then
        echo "checking Destination path"
	sleep 5
        echo "completed scanning...!"
else
        echo "file path does'nt exist"
        mkdir $destination
fi

echo "starting backup process!"
sleep 5
echo "creating timestamped directory"
current_time=$(date '+%Y-%m-%d %H:%M:%S')

mkdir "$destination/backup-$current_time"
cp -r "$source" "$destination/backup-$current_time"

sleep 3
echo "retaining $max directories"

count=0
for i in `ls -r $destination`
do
	if [ $count -lt $max ];then
		continue
	else
		rm -r "$destination/$i"
	fi
	((count++))
done

echo "backing up completed"
echo "click 1 to view the backup"
read choice

if [ $choice -eq 1 ];then
	cd $destination
	ls -l
	ls -l >> backup.txt
fi




