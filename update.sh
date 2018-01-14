#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

rm -rf docs/
# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`
# Push Hugo content 
git add .
git commit -m "$new blog"
git push git@github.com:DrifterFun/DrifterFun.git master
