#!/bin/bash

cd ~/Documents/MyStuff/learning/shell_script/books_img

convert_all_imgs() {

	##IF DO NOT HAVE PNG FOLDER
	if [ ! -d png ]; then
		mkdir png
	fi

	##EVERY .JPG
	for img in *.jpg; do
		## REMOVE .jpg from name | split . gets first part
		local img_file_name=$(ls $img | awk -F. '{ print $1 }')
		echo converting $img_file_name
		convert $img_file_name.jpg png/$img_file_name.png
	done
	echo the end
}

convert_all_imgs 2>errors.txt
if [ $? -eq 0 ]
then
	echo "Success! :D"
else
	echo "Fail D:"
fi
