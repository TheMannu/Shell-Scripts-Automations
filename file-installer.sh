#!/bin/bash

echo "Welcome To File_Installer"

sleep 1

echo "Please Enter Your File Name "

sleep 2

read filetname

mkdir $filename #root folder
echo "Root folder created..."
cp index.html $filename/index.html
cp main.css $filename/main.css
echo "File has been Copied...."

cd $filename

mkdir file1

mkdir file2

mkdir file3
