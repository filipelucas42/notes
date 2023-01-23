# git

* List existing remotes: `git remote -v`
* Show remote url: `git remote show <remote_name>`
* Change remote url: `git remote set-url <remote_name> <url>`
* Delete local branch: `git branch -d <branch_name`
* Delete remote branch: `git push <remote> -d <branch_name>`
* Check file log: `git log -p <filename>`
* Revert changes to file: `git reset <commit hash> <filename>`
* Get logs since: `git log --since="2017-02-12T16:36:00-07:00"`
* Get oldest commits: `git log --reverse`
* git blame: `git blame -L 1,5 README.md`
* remove file from repository `git rm --cached <file_name>`
* search commits by author `git log --author=<author>`
* rebase `git rebase -i <hash>` or `git reset <hash> && git add . && git commit -m "message"`
* push automatically to remote: ` git config --global --add --bool push.autoSetupRemote true`
* remove file: `git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch <file-to-remove>'`

* ammend last commit message:
    `git commit --amend -m"<new commit message>"`

* check git submodules status: `git submodule status --recursive`
* delete remote branch: `git push <remote_name> --delete <remote_branch>`

## Tags
* create tag: `git tag <tag_name>`
* push tags: `git push --tags`
* git fetch all tags: `git fetch --all --tags`

## config
* setup email identity: `git config --global user.email "email@domain.com"` (remove `--global` to set the identity only in this repository)
* create remote branch with the same name by default: `git config --global push.default current`
