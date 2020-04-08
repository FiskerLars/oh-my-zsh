################################################################################
# Author: Pete Clark
# Email: pete[dot]clark[at]gmail[dot]com
# Version: 0.1 (05/24/2011)
# License: WTFPL<http://sam.zoy.org/wtfpl/>
#
# This oh-my-zsh plugin adds smart tab completion for
# TaskWarrior<http://taskwarrior.org/>. It uses the zsh tab completion
# script (_task) distributed with TaskWarrior for the completion definitions.
#
# Typing task [tabtab] will give you a list of current tasks, task 66[tabtab]
# gives a list of available modifications for that task, etc.
################################################################################

zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'

zstyle ':completion:*:*:task:*' group-name ''

# alias t=task

alias task.today="task 'due:today'"
alias task.todo="task 'due.before:today and (status:pending  or status:active)' ; task 'due:today and (status:pending or status:active)'"
alias task.doing="task status:active"
alias task.week="task 'due.before:eow and (status:pending or status:active)'"
alias task.month="task 'due.before:eom and (status:pending or status:active)'"

alias task.addtimed="task add rc.dateformat:Y-M-DTH:N:S"
function task.addstart() {
## Add and directly start a task
    taskid=`task add $* | sed 's/^.* \([1234567890]*\)\..*$/\1/' `
    task $taskid start
}

alias task.pdf="task list | a2pdf --noline-numbers --title "Open Tasks" --line-spacing 14"

compdef _task t=task
