#Cookie-Prompt
cookie_path="/path/to/cookie-prompt"
psvar=()
cookie_line_cnt=0
function _update_psvar() {
  cookie_line_cnt=`expr $cookie_line_cnt \% 402 + 1`
  psvar[1]=`sed -n ${cookie_line_cnt}p ${cookie_path}/lines.txt`
  #printf "%s/voices/%04d\n" $cookie_path $cookie_line_cnt  | xargs ${cookie_path}/play.sh
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_psvar
PROMPT="%1v%# "