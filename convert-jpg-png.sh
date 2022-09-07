#!/bin/bash

cd ~/Documents/MyStuff/learning/shell_script/books_img

for img in *.jpg
do 
	img_file_name=$(ls $img | awk -F. '{ print $1 }')
	echo converting $img_file_name
	convert $img_file_name.jpg $img_file_name.png
done

echo the end
