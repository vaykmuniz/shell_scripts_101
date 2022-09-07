#!/bin/bash

convert_img() {
    local img_path=$1
    local img_file_name=$(ls $img_path | awk -F. '{ print $1}')
    convert $img_file_name.jpg $img_file_name.png
}

check_every_dic_n_file_to_convert() {
    cd $1
    for file in *
    do
        local file_path=$(find ~/Documents/MyStuff/learning/shell_script/books_img -name $file)
        if [ -d "$file_path"  ]
        then
            check_every_dic_n_file_to_convert $file_path
        else
            convert_img $file_path
        fi
    done
}

check_every_dic_n_file_to_convert ~/Documents/MyStuff/learning/shell_script/books_img
if [ $? -eq 0 ]
then
	echo "Success! :D"
else
	echo "Fail D:"
fi