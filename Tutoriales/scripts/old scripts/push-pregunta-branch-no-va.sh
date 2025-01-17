#!/bin/bash

git add .

echo 'Enter the commit message:'
read commitMessage

git commit -m "$commitMessage"

echo 'Enter the name of the branch:'
read branch

git push origin $branch

read 


# how to automate the "commit-and-push" process? (git) - Stack Overflow
# https://stackoverflow.com/questions/16709404/how-to-automate-the-commit-and-push-process-git
# https://stackoverflow.com/a/16709405/10648253
# 
# the script in a moment will ask what is the name of your branch, 
# if you don't know it put in the terminal:
#
# git branch --show-current 
# How do I get the current branch name in Git? - Stack Overflow
# https://stackoverflow.com/questions/6245570/how-do-i-get-the-current-branch-name-in-git
# https://stackoverflow.com/a/6245587/10648253
