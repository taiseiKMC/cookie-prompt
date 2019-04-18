#https://gist.github.com/otiai10/8034038
function branch-status-check {
    local prefix branchname suffix
        # .gitの中だから除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いので除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status {
    local res color
        output=`git status --short 2> /dev/null`
        if [ -z "$output" ]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}

#Cookie-Prompt
cookie_path="/path/to/cookie-prompt"
psvar=()
cookie_line_cnt=0
function _update_psvar() {
  cookie_line_cnt=`expr $cookie_line_cnt \% 402 + 1`
  psvar[1]=`sed -n ${cookie_line_cnt}p ${cookie_path}/lines.txt`
  #printf "%s/voices/%04d\n" $cookie_path $cookie_line_cnt  | xargs ${cookie_path}/play.sh
  psvar[2]=`branch-status-check`
}
autoload -U colors; colors
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_psvar
setopt prompt_subst
#PROMPT="%1v%# "

PROMPT="%{[30;48;5;249m%}%1v%{[0m%}
%# "
RPROMPT=$'%~ `branch-status-check`'

