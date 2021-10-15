## How to use an USB stick as remote repository

Plug the USB drive into Desktop, and assuming it's showing up as <code>J:</code>

Initialise a bare repo that will act as the remote:

    git init --bare J:\repo_name
    
cd to the local repo and:

>    git remote add usb J:\repo_name
    git checkout master
    git push usb master
    
---

## How to set the master branch as automatic push/pull source
Maybe replace <code>origin</code> with <code>usb</code> etc.
    
    git branch --set-upstream-to=origin/master

        