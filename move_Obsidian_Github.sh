#!/bin/bash

echo "Deleting Folders in 'GitHub/obsidian/' Directory"

rm -rf ~/GitHub/obsidian/S.Sunhaloo
rm -rf ~/GitHub/obsidian/Question\ -\ Problems\ -\ Solutions/

echo "Moving Folder 'S.Sunhaloo' and 'Question - Problems - Solutions' ---> '~/GitHub/obsidian/'"

cp -r ~/Obsidian/S.Sunhaloo ~/GitHub/obsidian/
cp -r ~/Obsidian/Question\ -\ Problems\ -\ Solutions/ ~/GitHub/obsidian/

echo "Done"
