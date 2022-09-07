#!/bin/bash

IMG_PATH=~/Documents/MyStuff/learning/shell_script/books_img

for img in $@
do 
	convert $IMG_PATH/$img.jpg $IMG_PATH/$img.png
done


echo the end
