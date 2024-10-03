#!/bin/bash

echo "Deleting Folders in 'Obsidian' Directory"

rm -rf ~/Obsidian/S.Sunhaloo
rm -rf ~/Obsidian/Question\ -\ Problems\ -\ Solutions/

echo "Moving Folder 'S.Sunhaloo' and 'Question - Problems - Solutions' ---> '~/Obsidian/'"

cp -r ~/GitHub/obsidian/S.Sunhaloo ~/Obsidian/
cp -r ~/GitHub/obsidian/Question\ -\ Problems\ -\ Solutions/ ~/Obsidian/

echo "Done"
