# git

*   List existing remotes:\`git remote -v\`

*   Show remote url: `git remote show <remote_name>`

*   Change remote url: `git remote set-url <remote_name> <url>`

*   Delete local branch: `git branch -d <branch_name`

*   Delete remote branch: `git push <remote> -d <branch_name>`

*   Check file log: `git log -p <filename>`

*   Revert changes to file: `git reset <commit hash> <filename>`

*   Get logs since: `git log --since="2017-02-12T16:36:00-07:00"`

*   Get oldest commits: `git log --reverse`

*   git blame: `git blame -L 1,5 README.md`

*   remove file from repository `git rm --cached <file_name>`

*   ammend last commit message:
    `git commit --amend -m"<new commit message>"`
