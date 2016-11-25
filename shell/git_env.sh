#!/bin/bash
set -eu

#git-related command export

alias git_init_repo="git init"

alias git_clone="git clone"

alias git_status="git status"
alias git_status_overview="git status -s"

# 将文件添加到缓存区中
alias git_add_to_stage="git add"

# 将文件提交到版本控制系统中
alias git_commit_to_repo="git commit "

# 使用已缓存的内容来替换当前工作空间中的文件内容, 该操作会擦抹掉工作区的所有修改内容
alias git_unstage="git checkout -- "

# 还原到文件之前缓存的内容
alias git_reset_stage="git reset HEAD "

# 查看当前工作目录中的文件的修改
alias git_diff_workspace="git diff"

# 查看缓冲区中的文件修改
alias git_diff_staged="git diff --cached"

# 查看工作去和缓冲区中的文件修改
alias git_diff_workspace_staged="git diff HEAD"

# 查看所有文件修改的一个概况
alias git_diff_overview="git diff --stat"

# 删除缓存区中的内容
alias git_rm="git rm"

#  首先从缓存区中删除文件缓存， 对文件进行重命名，然后重命名后的文件加入缓冲区
alias git_mv="git mv"

alias git_log="git log"

alias git_log_oneline="git log --oneline"
