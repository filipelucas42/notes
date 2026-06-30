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

* ammend last commit message: `git commit --amend -m"<new commit message>"`
* change last commit author: `git commit --amend --author="Author Name <email@address.com>" --no-edit`

* check git submodules status: `git submodule status --recursive`
* delete remote branch: `git push <remote_name> --delete <remote_branch>`
* use different ssh key: `GIT_SSH_COMMAND="ssh -i ~/.ssh/private_key" git <command>`
* creat patch file: `git diff master..HEAD > code.patch`

## Worktrees
* add worktree on existing branch: `git worktree add <path> <branch>`
* add worktree with new branch: `git worktree add -b <new-branch> <path>`
* add worktree from remote branch: `git worktree add <path> origin/<branch>`
* list all worktrees: `git worktree list`
* remove worktree: `git worktree remove <path>`
* move worktree: `git worktree move <path> <new-path>`
* prune stale worktree metadata: `git worktree prune`
* lock worktree (prevent accidental removal): `git worktree lock <path>`
* unlock worktree: `git worktree unlock <path>`

## Tags
* create tag: `git tag <tag_name>`
* push tags: `git push --tags`
* git fetch all tags: `git fetch --all --tags`

## config
* setup email identity: `git config --global user.email "email@domain.com"` (remove `--global` to set the identity only in this repository)
* setup name identity: `git config --global user.name "user name"` (remove `--global` to set the identity only in this repository)
* create remote branch with the same name by default: `git config --global push.default current`
* check config value: `git config --get <config_name>`
  * example: `git config --get user.email`

## Diffing branches & worktrees with Meld

Meld is a visual diff/merge tool, not a git client. You wire it in as git's
*difftool* and drive it with normal git ref syntax. Because all worktrees share
one object database, every branch is visible from any worktree - you pick the
branch, not the directory.

> Meld needs a graphical display. Works on the desktop/laptop; won't launch on a
> headless server or bare Termux.

### One-time setup

```bash
# install
sudo apt install meld          # Debian/Ubuntu
brew install --cask meld       # macOS

# register Meld as the difftool, stop the per-file prompt
git config --global diff.tool meld
git config --global difftool.prompt false

# alias: dir-diff mode = open the whole changeset in one window
git config --global alias.bdiff 'difftool -d'
```

### Daily use

```bash
# merge-base diff - only what the branch ADDED (usual choice for review)
git bdiff master...NX-159-buyer-personas

# full delta between the two branch tips
git bdiff master NX-159-buyer-personas
```

`git bdiff` = `git difftool -d`. The `-d` (dir-diff) flag opens **all** changed
files in a single Meld window with a file list down the side - click through
them, no prompts, no close-and-reopen loop.

#### Two-dot vs three-dot

| Syntax              | Shows                                                |
|---------------------|------------------------------------------------------|
| `master...branch`   | Merge-base diff - only what `branch` introduced      |
| `master branch`     | Full delta between the two tips (includes later master work, inverted) |

Same meaning as plain `git diff` - difftool just wraps it.

### Comparing two worktrees on disk (uncommitted state)

Point Meld straight at two worktree directories to compare *live working trees*,
including uncommitted changes:

```bash
meld ../efficio-main ../efficio-NX-159-buyer-personas
```

Caveat: this ignores `.gitignore`, so you'll see `.venv`, `__pycache__`, build
artifacts, etc. unless you add version-control filters in Meld's preferences.
For clean ref-based review, prefer `git bdiff`.

### Gotchas

- **Plain `git difftool` opens one file at a time** and prompts per file. Always
  use `-d` (i.e. `git bdiff`) for branch-level review.
- **Dir-diff is read-only review.** Meld shows a temp snapshot git built, not the
  live worktree - edits in the pane don't reliably write back. For resolving
  conflicts use `git mergetool` instead.
- **gitk's `...` is different.** In gitk / `git log`, `master...branch` filters
  *which commits appear in the graph*; it does not produce a combined diff. The
  three-dot merge-base-patch meaning only applies to `git diff` / `git difftool`.

### Quick reference

```bash
git bdiff master...<branch>     # what the branch added (most common)
git bdiff master <branch>       # full tip-to-tip delta
git difftool -d master...<branch>   # same as bdiff, explicit
meld ../wt-a ../wt-b            # two worktrees, live on-disk state
```

## zsh shortcuts
| Alias                  | Command                                                                                                                         |
| :--------------------- | :------------------------------------------------------------------------------------------------------------------------------ |
| `grt`                  | `cd "$(git rev-parse --show-toplevel \|\| echo .)"`                                                                             |
| `ggpnp`                | `ggl && ggp`                                                                                                                    |
| `ggpur`                | `ggu`                                                                                                                           |
| `g`                    | `git`                                                                                                                           |
| `ga`                   | `git add`                                                                                                                       |
| `gaa`                  | `git add --all`                                                                                                                 |
| `gapa`                 | `git add --patch`                                                                                                               |
| `gau`                  | `git add --update`                                                                                                              |
| `gav`                  | `git add --verbose`                                                                                                             |
| `gwip`                 | `git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"` |
| `gam`                  | `git am`                                                                                                                        |
| `gama`                 | `git am --abort`                                                                                                                |
| `gamc`                 | `git am --continue`                                                                                                             |
| `gamscp`               | `git am --show-current-patch`                                                                                                   |
| `gams`                 | `git am --skip`                                                                                                                 |
| `gap`                  | `git apply`                                                                                                                     |
| `gapt`                 | `git apply --3way`                                                                                                              |
| `gbs`                  | `git bisect`                                                                                                                    |
| `gbsb`                 | `git bisect bad`                                                                                                                |
| `gbsg`                 | `git bisect good`                                                                                                               |
| `gbsn`                 | `git bisect new`                                                                                                                |
| `gbso`                 | `git bisect old`                                                                                                                |
| `gbsr`                 | `git bisect reset`                                                                                                              |
| `gbss`                 | `git bisect start`                                                                                                              |
| `gbl`                  | `git blame -w`                                                                                                                  |
| `gb`                   | `git branch`                                                                                                                    |
| `gba`                  | `git branch --all`                                                                                                              |
| `gbd`                  | `git branch --delete`                                                                                                           |
| `gbD`                  | `git branch --delete --force`                                                                                                   |
| `gbgd`                 | `LANG=C git branch --no-color -vv \| grep ": gone\]" \| cut -c 3- \| awk '"'"'{print $1}'"'"' \| xargs git branch -d`           |
| `gbgD`                 | `LANG=C git branch --no-color -vv \| grep ": gone\]" \| cut -c 3- \| awk '"'"'{print $1}'"'"' \| xargs git branch -D`           |
| `gbm`                  | `git branch --move`                                                                                                             |
| `gbnm`                 | `git branch --no-merged`                                                                                                        |
| `gbr`                  | `git branch --remote`                                                                                                           |
| `ggsup`                | `git branch --set-upstream-to=origin/$(git_current_branch)`                                                                     |
| `gbg`                  | `LANG=C git branch -vv \| grep ": gone\]"`                                                                                      |
| `gco`                  | `git checkout`                                                                                                                  |
| `gcor`                 | `git checkout --recurse-submodules`                                                                                             |
| `gcb`                  | `git checkout -b`                                                                                                               |
| `gcB`                  | `git checkout -B`                                                                                                               |
| `gcd`                  | `git checkout $(git_develop_branch)`                                                                                            |
| `gcm`                  | `git checkout $(git_main_branch)`                                                                                               |
| `gcp`                  | `git cherry-pick`                                                                                                               |
| `gcpa`                 | `git cherry-pick --abort`                                                                                                       |
| `gcpc`                 | `git cherry-pick --continue`                                                                                                    |
| `gclean`               | `git clean --interactive -d`                                                                                                    |
| `gcl`                  | `git clone --recurse-submodules`                                                                                                |
| `gccd`                 | `git clone --recurse-submodules "$@" && cd "$(basename $\_ .git)"`                                                              |
| `gcam`                 | `git commit --all --message`                                                                                                    |
| `gcas`                 | `git commit --all --signoff`                                                                                                    |
| `gcasm`                | `git commit --all --signoff --message`                                                                                          |
| `gcmsg`                | `git commit --message`                                                                                                          |
| `gcsm`                 | `git commit --signoff --message`                                                                                                |
| `gc`                   | `git commit --verbose`                                                                                                          |
| `gca`                  | `git commit --verbose --all`                                                                                                    |
| `gca!`                 | `git commit --verbose --all --amend`                                                                                            |
| `gcan!`                | `git commit --verbose --all --no-edit --amend`                                                                                  |
| `gcans!`               | `git commit --verbose --all --signoff --no-edit --amend`                                                                        |
| `gcann!`               | `git commit --verbose --all --date=now --no-edit --amend`                                                                       |
| `gc!`                  | `git commit --verbose --amend`                                                                                                  |
| `gcn!`                 | `git commit --verbose --no-edit --amend`                                                                                        |
| `gcs`                  | `git commit -S`                                                                                                                 |
| `gcss`                 | `git commit -S -s`                                                                                                              |
| `gcssm`                | `git commit -S -s -m`                                                                                                           |
| `gcf`                  | `git config --list`                                                                                                             |
| `gdct`                 | `git describe --tags $(git rev-list --tags --max-count=1)`                                                                      |
| `gd`                   | `git diff`                                                                                                                      |
| `gdca`                 | `git diff --cached`                                                                                                             |
| `gdcw`                 | `git diff --cached --word-diff`                                                                                                 |
| `gds`                  | `git diff --staged`                                                                                                             |
| `gdw`                  | `git diff --word-diff`                                                                                                          |
| `gdv`                  | `git diff -w "$@" \| view -`                                                                                                    |
| `gdup`                 | `git diff @{upstream}`                                                                                                          |
| `gdnolock`             | `git diff $@ ":(exclude)package-lock.json" ":(exclude)\*.lock"`                                                                 |
| `gdt`                  | `git diff-tree --no-commit-id --name-only -r`                                                                                   |
| `gf`                   | `git fetch`                                                                                                                     |
| `gfa`                  | `git fetch --all --prune`                                                                                                       |
| `gfo`                  | `git fetch origin`                                                                                                              |
| `gg`                   | `git gui citool`                                                                                                                |
| `gga`                  | `git gui citool --amend`                                                                                                        |
| `ghh`                  | `git help`                                                                                                                      |
| `glgg`                 | `git log --graph`                                                                                                               |
| `glgga`                | `git log --graph --decorate --all`                                                                                              |
| `glgm`                 | `git log --graph --max-count=10`                                                                                                |
| `glod`                 | `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'`                        |
| `glods`                | `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short`           |
| `glol`                 | `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'`                        |
| `glola`                | `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all`                  |
| `glols`                | `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat`                 |
| `glo`                  | `git log --oneline --decorate`                                                                                                  |
| `glog`                 | `git log --oneline --decorate --graph`                                                                                          |
| `gloga`                | `git log --oneline --decorate --graph --all`                                                                                    |
| `glp`                  | `git log --pretty=<format>`                                                                                                     |
| `glg`                  | `git log --stat`                                                                                                                |
| `glgp`                 | `git log --stat --patch`                                                                                                        |
| `gignored`             | `git ls-files -v \| grep "^[[:lower:]]"`                                                                                        |
| `gfg`                  | `git ls-files \| grep`                                                                                                          |
| `gm`                   | `git merge`                                                                                                                     |
| `gma`                  | `git merge --abort`                                                                                                             |
| `gmc`                  | `git merge --continue`                                                                                                             |
| `gms`                  | `git merge --squash`                                                                                                            |
| `gmom`                 | `git merge origin/$(git_main_branch)`                                                                                           |
| `gmum`                 | `git merge upstream/$(git_main_branch)`                                                                                         |
| `gmtl`                 | `git mergetool --no-prompt`                                                                                                     |
| `gmtlvim`              | `git mergetool --no-prompt --tool=vimdiff`                                                                                      |
| `gl`                   | `git pull`                                                                                                                      |
| `gpr`                  | `git pull --rebase`                                                                                                             |
| `gprv`                 | `git pull --rebase -v`                                                                                                          |
| `gpra`                 | `git pull --rebase --autostash`                                                                                                 |
| `gprav`                | `git pull --rebase --autostash -v`                                                                                              |
| `gprom`                | `git pull --rebase origin $(git_main_branch)`                                                                                   |
| `gpromi`               | `git pull --rebase=interactive origin $(git_main_branch)`                                                                       |
| `ggpull`               | `git pull origin "$(git_current_branch)"`                                                                                       |
| `ggl`                  | `git pull origin $(current_branch)`                                                                                             |
| `gluc`                 | `git pull upstream $(git_current_branch)`                                                                                       |
| `glum`                 | `git pull upstream $(git_main_branch)`                                                                                          |
| `gp`                   | `git push`                                                                                                                      |
| `gpd`                  | `git push --dry-run`                                                                                                            |
| `gpf!`                 | `git push --force`                                                                                                              |
| `ggf`                  | `git push --force origin $(current_branch)`                                                                                     |
| `gpf`                  | On Git >= 2.30: `git push --force-with-lease --force-if-includes`                                                               |
| `gpf`                  | On Git < 2.30: `git push --force-with-lease`                                                                                    |
| `ggfl`                 | `git push --force-with-lease origin $(current_branch)`                                                                          |
| `gpsup`                | `git push --set-upstream origin $(git_current_branch)`                                                                          |
| `gpsupf`               | On Git >= 2.30: `git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes`                   |
| `gpsupf`               | On Git < 2.30: `git push --set-upstream origin $(git_current_branch) --force-with-lease`                                        |
| `gpv`                  | `git push --verbose`                                                                                                            |
| `gpoat`                | `git push origin --all && git push origin --tags`                                                                               |
| `gpod`                 | `git push origin --delete`                                                                                                      |
| `ggpush`               | `git push origin "$(git_current_branch)"`                                                                                       |
| `ggp`                  | `git push origin $(current_branch)`                                                                                             |
| `gpu`                  | `git push upstream`                                                                                                             |
| `grb`                  | `git rebase`                                                                                                                    |
| `grba`                 | `git rebase --abort`                                                                                                            |
| `grbc`                 | `git rebase --continue`                                                                                                         |
| `grbi`                 | `git rebase --interactive`                                                                                                      |
| `grbo`                 | `git rebase --onto`                                                                                                             |
| `grbs`                 | `git rebase --skip`                                                                                                             |
| `grbd`                 | `git rebase $(git_develop_branch)`                                                                                              |
| `grbm`                 | `git rebase $(git_main_branch)`                                                                                                 |
| `grbom`                | `git rebase origin/$(git_main_branch)`                                                                                          |
| `grf`                  | `git reflog`                                                                                                                    |
| `gr`                   | `git remote`                                                                                                                    |
| `grv`                  | `git remote --verbose`                                                                                                          |
| `gra`                  | `git remote add`                                                                                                                |
| `grrm`                 | `git remote remove`                                                                                                             |
| `grmv`                 | `git remote rename`                                                                                                             |
| `grset`                | `git remote set-url`                                                                                                            |
| `grup`                 | `git remote update`                                                                                                             |
| `grh`                  | `git reset`                                                                                                                     |
| `gru`                  | `git reset --`                                                                                                                  |
| `grhh`                 | `git reset --hard`                                                                                                              |
| `grhk`                 | `git reset --keep`                                                                                                              |
| `grhs`                 | `git reset --soft`                                                                                                              |
| `gpristine`            | `git reset --hard && git clean --force -dfx`                                                                                    |
| `gwipe`                | `git reset --hard && git clean --force -df`                                                                                     |
| `groh`                 | `git reset origin/$(git_current_branch) --hard`                                                                                 |
| `grs`                  | `git restore`                                                                                                                   |
| `grss`                 | `git restore --source`                                                                                                          |
| `grst`                 | `git restore --staged`                                                                                                          |
| `gunwip`               | `git rev-list --max-count=1 --format="%s" HEAD \| grep -q "--wip--" && git reset HEAD~1`                                        |
| `grev`                 | `git revert`                                                                                                                    |
| `grm`                  | `git rm`                                                                                                                        |
| `grmc`                 | `git rm --cached`                                                                                                               |
| `gcount`               | `git shortlog --summary -n`                                                                                                     |
| `gsh`                  | `git show`                                                                                                                      |
| `gsps`                 | `git show --pretty=short --show-signature`                                                                                      |
| `gstall`               | `git stash --all`                                                                                                               |
| `gstu`                 | `git stash --include-untracked`                                                                                                 |
| `gstaa`                | `git stash apply`                                                                                                               |
| `gstc`                 | `git stash clear`                                                                                                               |
| `gstd`                 | `git stash drop`                                                                                                                |
| `gstl`                 | `git stash list`                                                                                                                |
| `gstp`                 | `git stash pop`                                                                                                                 |
| `gsta`                 | On Git >= 2.13: `git stash push`                                                                                                |
| `gsta`                 | On Git < 2.13: `git stash save`                                                                                                 |
| `gsts`                 | `git stash show --patch`                                                                                                        |
| `gst`                  | `git status`                                                                                                                    |
| `gss`                  | `git status --short`                                                                                                            |
| `gsb`                  | `git status --short -b`                                                                                                         |
| `gsi`                  | `git submodule init`                                                                                                            |
| `gsu`                  | `git submodule update`                                                                                                          |
| `gsd`                  | `git svn dcommit`                                                                                                               |
| `git-svn-dcommit-push` | `git svn dcommit && git push github $(git_main_branch):svntrunk`                                                                |
| `gsr`                  | `git svn rebase`                                                                                                                |
| `gsw`                  | `git switch`                                                                                                                    |
| `gswc`                 | `git switch -c`                                                                                                                 |
| `gswd`                 | `git switch $(git_develop_branch)`                                                                                              |
| `gswm`                 | `git switch $(git_main_branch)`                                                                                                 |
| `gta`                  | `git tag --annotate`                                                                                                            |
| `gts`                  | `git tag -s`                                                                                                                    |
| `gtv`                  | `git tag \| sort -V`                                                                                                            |
| `gignore`              | `git update-index --assume-unchanged`                                                                                           |
| `gunignore`            | `git update-index --no-assume-unchanged`                                                                                        |
| `gwch`                 | `git whatchanged -p --abbrev-commit --pretty=medium`                                                                            |
| `gwt`                  | `git worktree`                                                                                                                  |
| `gwtls`                | `git worktree list`                                                                                                             |
| `gwtmv`                | `git worktree move`                                                                                                             |
| `gwtrm`                | `git worktree remove`                                                                                                           |
| `gk`                   | `gitk --all --branches &!`                                                                                                      |
| `gke`                  | `gitk --all $(git log --walk-reflogs --pretty=%h) &!`                                                                           |
| `gtl`                  | `gtl(){ git tag --sort=-v:refname -n --list ${1}\* }; noglob gtl`                                                               |
