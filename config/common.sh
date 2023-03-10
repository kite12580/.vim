source ~/.vim/config/z.sh
source ~/.vim/config/colors-icons.sh  # LS_COLORS and LF_ICONS
[ -s "$HOME/.asdf/asdf.sh" ] && ASDF_DIR=$HOME/.asdf source "$HOME/.asdf/asdf.sh"

export PATH="$HOME/.local/bin:$HOME/.local/lib/node-packages/node_modules/.bin:$PATH:$HOME/.vim/bin"
export EDITOR='nvim'
export BAT_PAGER="less -RiM"  # less -RiM: --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT, -XF: exit if one screen, -S: nowrap, +F: tail file
export MANPAGER="sh -c 'col -bx | bat --language=man --plain'"
export MANROFFOPT='-c'
export RIPGREP_CONFIG_PATH="$HOME/.vim/config/.ripgreprc"
export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_OPTS='--layout=reverse --height=40% --bind=change:top --info=inline'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='fd --type=f --strip-cwd-prefix --hidden --exclude=.git --color=always'
export FZF_CTRL_T_OPTS="--ansi --bind='\`:unbind(\`)+reload($FZF_CTRL_T_COMMAND --no-ignore || true)'"
export FZF_ALT_C_COMMAND='command ls -1Ap --color=always 2> /dev/null'
export FZF_ALT_C_OPTS="--ansi --bind='tab:down,btab:up' --bind='\`:unbind(\`)+reload($FZF_CTRL_T_COMMAND || true)'"
export FZF_PREVIEW_COMMAND='bat --color=always --style=numbers --theme=OneHalfDark --line-range :50 {}'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -pv'
alias ll='ls -AlhF --color=auto --group-directories-first'
alias ls='ls -F --color=auto'
alias l='exa -lF --git --color=always --color-scale --icons --header --group-directories-first --time-style=long-iso --all'
alias ls-ports='lsof -iTCP -sTCP:LISTEN -P -n'
alias chmod\?='stat --printf "%a %n \n"'
alias bell='echo -n -e "\a"'
alias escape="sed 's/\\([\"\\]\\)/\\\\\\1/g'"  # escape "\ with backslash
alias dateiso='date -u +"%Y-%m-%dT%H:%M:%SZ"'  # dateiso -d @<epoch-seconds>
alias sudo='sudo '
alias less='less -RiM'
alias v='$EDITOR'
alias vi='command vim'
alias vii='command vim -u ~/.vim/config/mini.vim -i NONE'
alias vim='$EDITOR'
alias venv='[ ! -d venv ] && python3 -m venv venv; source venv/bin/activate'
alias gvenv='[ ! -d "$HOME/.local/lib/venv" ] && python3 -m venv "$HOME/.local/lib/venv"; source "$HOME/.local/lib/venv/bin/activate"'
alias py='env PYTHONSTARTUP=$HOME/.vim/config/pythonrc.py python3'
alias lg='lazygit'
alias lzd='lazydocker'
alias lf='lf -last-dir-path="$HOME/.cache/lf_dir"'
alias ctop='TERM="${TERM/#tmux/screen}" ctop'  # TODO https://github.com/bcicen/ctop/issues/263
alias tmux-save='~/.tmux/plugins/tmux-resurrect/scripts/save.sh'
alias 0='[ -f "$HOME/.cache/lf_dir" ] && cd "$(cat "$HOME/.cache/lf_dir")"'
alias q='q --output-header --pipe-delimited-output --beautify --delimiter=, --skip-header'
alias q-="up -c \"\\\\\$(alias q | sed \"s/[^']*'\\(.*\\)'/\\1/\") 'select * from -'\""
alias rga='rg --text --no-ignore --search-zip --follow'
alias rg!="rg '???'"
alias xcp="rsync -aviHKhSPz --no-owner --no-group --one-file-system --delete --filter=':- .gitignore'"
alias fpp='if [ -t 0 ] && [ $# -eq 0 ] && [[ ! $(fc -ln -1) =~ "\| *fpp$" ]]; then eval "$(fc -ln -1 | sed "s/^rg /rg --vimgrep /")" | command fpp; else command fpp; fi'
alias http.server='filebrowser --database $HOME/.cache/filebrowser.db --disable-exec --noauth --address 0.0.0.0 --port 8000'
alias command-frequency="fc -l 1 | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | column -c3 -s \" \" -t | sort -nr | head -n 30 | nl"
alias command-frequency-with-args="fc -l 1 | awk '{\$1=\"\"; CMD[\$0]++;count++;}END { for (a in CMD)print CMD[a] \"\\t\" CMD[a]/count*100 \"%\\t\" a;}' | sort -nr | head -n 30 | nl | column -c3 -s \$'\\t' -t"

alias ga='git add'
alias gau='git add -u'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -vv --sort=-committerdate -a'
alias gbl='git for-each-ref --sort=-committerdate refs/heads --format="%(HEAD)%(color:yellow)%(refname:short)|%(color:green)%(committerdate:relative)|%(color:red)%(objectname:short)%(color:reset) - %(subject) %(color:bold blue)<%(authorname)>%(color:reset)" --color | column -ts"|"'
alias gc='git commit -m'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcs='git commit --signoff -m'
alias gcs!='git commit --signoff --amend'
alias gcv='git commit -v'
alias gcgpg='export GPG_TTY=$(tty) && git commit --gpg-sign --signoff -m'
alias gcf='git config --list'
alias gcm='git checkout "$(git remote show origin | sed -n "/HEAD branch/s/.*: //p")"'  # checkout default branch in origin
alias gco='git checkout'
alias gcp='git cherry-pick -x'
alias gd='git diff'
alias gds='git diff --stat'
alias gdst='git diff --staged'
alias gdsts='git diff --stat --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdf='GIT_PAGER="diff-so-fancy | \less --tabs=4 -RiMXF" git diff'
alias gdd='GIT_PAGER="delta --line-numbers --navigate --side-by-side" git diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias ggl='git pull origin $(gref)'
alias gpf='git push fork $(gref)'
alias gsup='git remote | fzf --bind="tab:down,btab:up" | xargs -I {} git branch --set-upstream-to={}/$(git symbolic-ref --short HEAD)'
alias gl='git pull'
alias glr='git pull --rebase'
alias glg='git log --stat'
alias glgg='git log --graph --pretty=fuller'
alias glgga='git log --graph --decorate --all --pretty=fuller'
alias glo='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gloo='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --max-count 10'
alias glog='git log --color --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ci)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)" --all'
alias gm='git merge'
alias gma='git merge --abort'
alias gmt='git mergetool --no-prompt'
alias gmerge-preview-log='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit HEAD..'  # commits in target but not in HEAD (will be merged with git merge target)
gmerge-preview-diff() { git diff HEAD..."$@"; }  # diff between target and the common ancestor of HEAD and target
gmissing() { git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --cherry-pick --right-only HEAD..."$@"; }  # commits in target but not in HEAD and not cherry-picked to HEAD
alias gr='git remote'
alias gref='git symbolic-ref --short HEAD'
alias grref='git rev-parse --abbrev-ref --symbolic-full-name @{upstream}'  # remote ref
alias grl='git reflog --color --date=human-local --pretty=format:"%Cred%h%Creset %C(037)%gD:%Creset %gs%Creset%C(auto)%d%Creset"'
alias gra='git remote add'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias greset-to-remote='git stash push --message "greset-to-remote temporary stash"; git reset --hard @{upstream}'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias grv='git remote -v'
alias gs='git status'
alias gsall="find . -type d -name .git -execdir bash -c 'echo -e \"\\033[1;32m\"repo: \"\\033[1;34m\"\$([ \$(pwd) == '\$PWD' ] && echo \$(basename \$PWD) \"\\033[1;30m\"\(current directory\) || realpath --relative-to=\"'\$PWD'\" .) \"\\033[1;30m\"- \"\\033[1;33m\"\$(git symbolic-ref --short HEAD)\"\\033[1;30m\"\$(git log --pretty=format:\" (%cr)\" --max-count 1)\"\\033[0m\"; git status -s' \\;"
alias gss='git status -sb'
alias gst='git stash'
alias gsts='git stash; git stash apply'
alias gshow='git show --patch-with-stat --pretty=fuller'
alias gcount='git shortlog -sn'
alias gtree='git ls-files | tree --fromfile'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gunignore='git update-index --no-assume-unchanged'
alias gexclude='cat >> "$(git rev-parse --show-toplevel)/.git/info/exclude" <<<'
alias gexcluded='grep -v "^# " "$(git rev-parse --show-toplevel)/.git/info/exclude"'
gunexclude() { sed -i "/^${*//\//\\/}\$/d" "$(git rev-parse --show-toplevel)/.git/info/exclude"; local r=$?; gexcluded; return $r; }
alias gpristine='git stash push --include-untracked --message "gpristine temporary stash"; git reset --hard && git clean -fdx'
alias gunshallow='git remote set-branches origin "*" && git fetch -v && echo -e "\nRun \"git fetch --unshallow\" to fetch all history"'
alias gwip='git add -A; git ls-files --deleted -z | xargs -r0 git rm; git commit --signoff --no-verify -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c -- "--wip--" && git reset HEAD~1'
alias gwhatchanged='git log --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --stat $(git rev-parse --abbrev-ref --symbolic-full-name @{upstream})..HEAD  # what will be pushed'
alias gwhatsnew='git log --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --stat ORIG_HEAD...HEAD  # what was pulled'
alias gwhere='echo -e "Previous tag:\n  $(git describe --tags --abbrev=0)\nBranches containing HEAD: $(git branch --color -a --contains HEAD)"'
alias gsize='git rev-list --objects --all | git cat-file --batch-check="%(objecttype) %(objectname) %(objectsize) %(rest)" | sed -n "s/^blob //p" | sort --numeric-sort --key=2 | cut -c 1-12,41- | $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest'  # use "git obliterate <filepath>; git gc --prune=now --aggressive" to remove, or https://rtyley.github.io/bfg-repo-cleaner
alias gforest='git foresta --style=10 | \less -RiMXF'
alias gforesta='git foresta --style=10 --all | \less -RiMXF'
alias gpatch='vi +startinsert patch.diff && git apply patch.diff && rm patch.diff'
alias gls="\\ls -A --group-directories-first -1 | while IFS= read -r line; do git log --color --format=\"\$(\\ls -d -F --color \"\$line\") =} %C(bold black)???%Creset%Cred%h %Cgreen(%cr)%Creset =} %C(bold black)???%Creset%s %C(bold blue)<%an>%Creset\" --abbrev-commit --max-count 1 HEAD -- \"\$line\"; done | awk -F'=}' '{ nf[NR]=NF; for (i = 1; i <= NF; i++) { cell[NR,i] = \$i; gsub(/\\033\\[([[:digit:]]+(;[[:digit:]]+)*)?[mK]/, \"\", \$i); len[NR,i] = l = length(\$i); if (l > max[i]) max[i] = l; } } END { for (row = 1; row <= NR; row++) { for (col = 1; col < nf[row]; col++) printf \"%s%*s%s\", cell[row,col], max[col]-len[row,col], \"\", OFS; print cell[row,nf[row]]; } }'"

d() { [ "$#" -eq 0 ] && dirs -v | head -10 || dirs "$@"; }
tre() { find "${@:-.}" | sort | sed "s;[^-][^\/]*/;   ???;g;s;???\([^ ]\);????????? \1;;s;^ \+;;"; }

gpr() {
  local pr=$1 repo
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    repo=${1%/pull/*} pr=${1##*/}
    git clone "$repo" "${repo##*/}-$pr"
    cd "${repo##*/}-$pr" > /dev/null || return 1
  fi
  git stash push --include-untracked --message 'git PR temporary stash'
  git fetch origin "pull/$pr/head" && { git branch "pr/$pr" 2> /dev/null; git checkout "pr/$pr" && git reset --hard FETCH_HEAD; }
}

gr-toggle-url() {
  local pattern='s,^\(https://\|git@\)\([^:/]\+\)[:/],' remote="${1:-origin}" url="$(git remote get-url "${1:-origin}")"
  grep -q '^https://' <<< "$url" && pattern="${pattern}git@\\2:," || pattern="${pattern}https://\\2/,"
  git remote set-url "$remote" "$(sed "$pattern" <<< "$url")"
  git remote -v
}

grg() {  # search literal string in all commits, replace `log` with `reflog` for local commits, change -S to -G for regex search, add --patch to see all diff together
  git log --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all --regexp-ignore-case -S "$@" | fzf --height=50% --min-height=20 --ansi --preview="grep -o \"[a-f0-9]\\{7,\\}\" <<< {} | xargs git show --patch-with-stat --color | delta --paging=never" --bind=',:preview-down,.:preview-up' --bind='tab:down,btab:up' --bind="enter:execute(grep -o \"[a-f0-9]\\{7,\\}\" <<< {} | xargs -I{} git show --patch-with-stat --color {} | DELTA_PAGER=\"$BAT_PAGER --pattern='$1'\" delta --line-numbers)"
}

gvf() {  # find file in all commits, git log takes glob: gvf '*filename*'
  local filepath=$(git log --pretty=format: --name-only --all "$@" | awk NF | sort -u | fzf --height=50% --min-height=20 --ansi --multi --preview='git log --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all -- {}')
  if [ -n "$filepath" ]; then
    local sha=$(git log --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all -- "$filepath" | fzf --height=50% --min-height=20 --ansi --preview="grep -o \"[a-f0-9]\\{7,\\}\" <<< {} | xargs -I{} git show {} -- $filepath | delta --paging=never" --bind=',:preview-down,.:preview-up' | grep -o "[a-f0-9]\{7,\}")
    if [ -n "$sha" ]; then
      echo -e "\033[0;35mgit show $sha:$filepath\033[0m" >&2
      git show "$sha:$filepath" | $EDITOR - -c "file $sha:$filepath" -c 'filetype detect'
    fi
  fi
}

glof() {
  git log --graph --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit "$@" |
    fzf --height=50% --min-height=20 --ansi --scheme=history --reverse --toggle-sort=\` --multi \
    --header='Press ` to toggle sort, <C-y> to copy commit, <C-p> , . to control preview' \
    --preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --patch-with-stat --color | delta --paging=never' \
    --bind='ctrl-p:toggle-preview,,:preview-down,.:preview-up' \
    --bind='ctrl-y:execute(echo {+} | grep -o "[a-f0-9]\{7,\}" | tac | tr "\n" " " | y)+abort' \
    --bind='enter:execute(grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --patch-with-stat --color | delta --line-numbers --navigate)'
}

grlf() {
  git reflog --color --date=human-local --pretty=format:"%Cred%h%Creset %C(037)%gD:%Creset %gs%Creset%C(auto)%d%Creset" "$@" | awk '!x[$1]++' |
    fzf --height=50% --min-height=20 --ansi --scheme=history --reverse --toggle-sort=\` --multi \
    --header='Press ` to toggle sort, <C-y> to copy commit, <C-p> , . to control preview' \
    --preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --patch-with-stat --color | delta --paging=never' \
    --bind='ctrl-p:toggle-preview,,:preview-down,.:preview-up' \
    --bind='ctrl-y:execute(echo {+} | grep -o "[a-f0-9]\{7,\}" | tac | tr "\n" " " | y)+abort' \
    --bind='enter:execute(grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --patch-with-stat --color | delta --line-numbers --navigate)'
}

gcb() {
  if [ "$#" -gt 0 ]; then
    git checkout -b "$@" || git checkout "$@"
  else
    local fzftemp=$(git branch --color --sort=-committerdate --all |
      awk '/remotes\//{a[++c]=$0;next}1;END{for(i=1;i<=c;++i) print a[i]}' |
      fzf --height=50% --min-height=20 --ansi --scheme=history --reverse --preview-window=60% --toggle-sort=\` \
      --header='Press ` to toggle sort' \
      --preview='git log -n 50 --color --graph --pretty=format:"%Cred%h%Creset - %Cgreen(%cr)%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset" --abbrev-commit $(sed "s/.* //" <<< {})' | sed "s/.* //")
    if [ -n "$fzftemp" ]; then
      git show-ref --verify --quiet "refs/heads/${fzftemp#remotes/[^\/]*/}" && git checkout "${fzftemp#remotes/[^\/]*/}" || git checkout --track "${fzftemp#remotes/}"
    fi
  fi
}

gh-backport() {
  if [ "$#" -ne 1 ]; then echo "Usage: $0 <SHA>" >&2; return 1; fi
  local sha=$1 args=()
  if [ -f ".github/PULL_REQUEST_TEMPLATE.md" ]; then
    args+=(--body-file .github/PULL_REQUEST_TEMPLATE.md)
  fi
  git cherry-pick -f "$sha" && git push fork "$(gref)" -f && gh pr create --title "[$(gref)] $(git log -n 1 --pretty=format:%s "$sha")" --base "$(gref)" "${args[@]}"
}

size() {
  [ "$1" = '--disk-usage' ] && { du -ah --max-depth=1 "${@:2}" | sort -hr; return $?; }
  [ "$1" = '--subdirs' ] && local args=("${@:2}") || local args=(--max-depth=1 "$@")
  du -ab "${args[@]}" | sort -nr | head -n 20 | awk 'function hr(bytes) { hum[1099511627776]="TiB"; hum[1073741824]="GiB"; hum[1048576]="MiB"; hum[1024]="kiB"; for (x = 1099511627776; x >= 1024; x /= 1024) { if (bytes >= x) { return sprintf("%8.3f %s", bytes/x, hum[x]); } } return sprintf("%4d     B", bytes); } { printf hr($1) "\t"; $1=""; print $0; }'
}

pscpu() {
  local ps_out pids pid pstree_flags pstree_out
  if [ "$(uname -s)" = Darwin ]; then
    ps_out=$(ps -rwwAo user,pid,ppid,pcpu,pmem,time,command)
    pstree_flags='-wp'
  else
    ps_out=$(ps auxww --sort=-pcpu)
    pstree_flags='-Glps'
  fi
  { [ "$#" -eq 0 ] && echo "$ps_out" || grep -i "$@" <<<"$ps_out"; } | head -n 11
  if [ ! -x "$(command -v pstree)" ]; then
    echo 'pstree not found (e.g. yum install -y psmisc).'
  else
    if [ "$#" -eq 0 ]; then
      pids=($(sed -n '2,4p' <<< "$ps_out" | awk '{print $2}'))
    else
      pids=($(grep -i "$@" <<< "$ps_out" | awk '{print $2}'))
    fi
    for pid in "${pids[@]}"; do
      pstree_out=$(pstree "$pstree_flags" "$pid")
      [[ $pstree_out =~ $pid ]] && head -n 8 <<< "$pstree_out" | grep --color -E "^|$pid"
    done
  fi
}

psmem() {
  local ps_out
  if [ "$(uname -s)" = Darwin ]; then
    ps_out=$(ps -mwwAo pid,rss,command)
  else
    ps_out=$(ps axwwo pid,rss,args --sort -size)
  fi
  [ "$#" -gt 0 ] && ps_out=$(grep -i "$@" <<< "$ps_out" | head -n 16)
  head -n 16 <<< "$ps_out" | awk '{ hr=$2/1024 ; printf("%7s %9.2f Mb\t",$1,hr) } { for ( x=3 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }'
}

sudorun() {
  if [ "$#" -eq 0 ]; then echo 'Need a command to run.'; return 1; fi
  local cmd=$1
  shift
  if [ ! -x "$(command -v "$cmd")" ] && type "$cmd" | grep -q "$cmd is a \(shell \)\?function"; then
    echo -e "Running as bash function..\n" >&2
    sudo bash -c "$(declare -f "$cmd"); $cmd $*"
    return 0
  fi
  case $cmd in
    v|vi|vim) sudo TERM=xterm-256color "$(/usr/bin/which vim)" -u "$HOME/.vim/config/mini.vim" "$@" ;;
    lf) EDITOR=vim XDG_CONFIG_HOME="$HOME/.config" sudo -E "$(/usr/bin/which lf)" -last-dir-path="$HOME/.cache/lf_dir" -command 'set previewer' -command 'map i $less -RiM "$f"' "$@" ;;
    *) TERM=xterm-256color EDITOR=vim XDG_CONFIG_HOME="$HOME/.config" sudo -E "$(/usr/bin/which "$cmd")" "$@" ;;
  esac
}

print-ascii() {
  echo 'Dec Hex    Dec Hex    Dec Hex    Dec Hex  Dec Hex  Dec Hex   Dec Hex   Dec Hex'
  echo '  0 00 NUL  16 10 DLE  32 20 SPC  48 30 0  64 40 @  80 50 P   96 60 `  112 70 p'
  echo '  1 01 SOH  17 11 DC1  33 21 !    49 31 1  65 41 A  81 51 Q   97 61 a  113 71 q'
  echo '  2 02 STX  18 12 DC2  34 22 "    50 32 2  66 42 B  82 52 R   98 62 b  114 72 r'
  echo '  3 03 ETX  19 13 DC3  35 23 #    51 33 3  67 43 C  83 53 S   99 63 c  115 73 s'
  echo '  4 04 EOT  20 14 DC4  36 24 $    52 34 4  68 44 D  84 54 T  100 64 d  116 74 t'
  echo '  5 05 ENQ  21 15 NAK  37 25 %    53 35 5  69 45 E  85 55 U  101 65 e  117 75 u'
  echo '  6 06 ACK  22 16 SYN  38 26 &    54 36 6  70 46 F  86 56 V  102 66 f  118 76 v'
  echo "  7 07 BEL  23 17 ETB  39 27 '    55 37 7  71 47 G  87 57 W  103 67 g  119 77 w"
  echo '  8 08 BS   24 18 CAN  40 28 (    56 38 8  72 48 H  88 58 X  104 68 h  120 78 x'
  echo '  9 09 TAB  25 19 EM   41 29 )    57 39 9  73 49 I  89 59 Y  105 69 i  121 79 y'
  echo ' 10 0A LF   26 1A SUB  42 2A *    58 3A :  74 4A J  90 5A Z  106 6A j  122 7A z'
  echo ' 11 0B VT   27 1B ESC  43 2B +    59 3B ;  75 4B K  91 5B [  107 6B k  123 7B {'
  echo ' 12 0C FF   28 1C FS   44 2C ,    60 3C <  76 4C L  92 5C \  108 6C l  124 7C |'
  echo ' 13 0D CR   29 1D GS   45 2D -    61 3D =  77 4D M  93 5D ]  109 6D m  125 7D }'
  echo ' 14 0E SO   30 1E RS   46 2E .    62 3E >  78 4E N  94 5E ^  110 6E n  126 7E ~'
  echo ' 15 0F SI   31 1F US   47 2F /    63 3F ?  79 4F O  95 5F _  111 6F o  127 7F DEL'
}

print-colors() {  # https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
  printf 'Foreground 8 colors\n'
  echo "$(tput setaf 0) black $(tput setaf 1) red $(tput setaf 2) green $(tput setaf 3) yellow $(tput setaf 4) blue $(tput setaf 5) magenta $(tput setaf 6) cyan $(tput setaf 7) white $(tput sgr 0)"
  printf '\nBackground 8 colors\n'
  echo "$(tput setab 0) black $(tput setab 1) red $(tput setaf 0)$(tput setab 2) green $(tput setab 3) yellow $(tput setaf 7)$(tput setab 4) blue $(tput setab 5) magenta $(tput setaf 0)$(tput setab 6) cyan $(tput setab 7) white $(tput sgr 0)"
  printf '\nANSI 16 colors\n'
  echo -e ' \e[0;30mblack="\\e[0;30m" \e[0;31mred="\\e[0;31m"     \e[0;32mgreen="\\e[0;32m" \e[0;33myellow="\\e[0;33m"'
  echo -e ' \e[0;34mblue="\\e[0;34m"  \e[0;35mmagenta="\\e[0;35m" \e[0;36mcyan="\\e[0;36m"  \e[0;37mwhite="\\e[0;37m"'
  echo -e ' \e[0mno_color="\\e[0m"       \u2191 original 8 colors      \u2193 lighter 8 colors'
  echo -e ' \e[1;30mblack="\\e[1;30m" \e[1;31mred="\\e[1;31m"     \e[1;32mgreen="\\e[1;32m" \e[1;33myellow="\\e[1;33m"'
  echo -e ' \e[1;34mblue="\\e[1;34m"  \e[1;35mmagenta="\\e[1;35m" \e[1;36mcyan="\\e[1;36m"  \e[1;37mwhite="\\e[1;37m"\e[0m'
  printf '\nForeground 256 colors\n'
  for i in {0..255}; do printf '\e[38;5;%dm%3d ' "$i" "$i"; (((i+3) % 18)) || printf '\e[0m\n'; done
  printf '\n\nBackground 256 colors\n'
  for i in {0..255}; do printf '\e[48;5;%dm%3d ' "$i" "$i"; (((i+3) % 18)) || printf '\e[0m\n'; done
  printf '\e[0m\n\n'
  awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
    s="/\\";
    for (colnum = 0; colnum<term_cols; colnum++) {
      r = 255-(colnum*255/term_cols);
      g = (colnum*510/term_cols);
      b = (colnum*255/term_cols);
      if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum%2+1,1);
    }
    printf "\n";
  }'
}

x() {
  for arg in "$@"; do
    if [ -f "$arg" ]; then
      case $arg in
        *.tar)                       tar xvf "$arg"     ;;
        *.tar.gz | *.tgz)            tar xvzf "$arg"    ;;
        *.tar.xz | *.xz)             tar xvJf "$arg"    ;;
        *.tar.bz2 | *.tbz | *.tbz2)  tar xvjf "$arg"    ;;
        *.bz2)                       bunzip2 "$arg"     ;;
        *.gz)                        gunzip "$arg"      ;;
        *.zip)                       unzip "$arg"       ;;
        *.rar)                       unrar x "$arg"     ;;
        *.Z)                         uncompress "$arg"  ;;
        *.7z)                        7z x "$arg"        ;;
        *)                           echo "Unable to extract '$arg'" ;;
      esac
    else
      tar czvf "$arg.tar.gz" "$arg"
    fi
  done
}

X() {  # extract to a directory / compress without top directory
  for arg in "$@"; do
    if [ -f "$arg" ]; then
      local dir="${arg%.*}"
      local filename="$(tr -cd 'a-f0-9' < /dev/urandom | head -c 8)_$arg"
      command mkdir -pv "$dir"
      command mv -i "$arg" "$dir/$filename"
      (cd "$dir" > /dev/null && x "$filename")
      command mv -n "$dir/$filename" "$arg"
    else
      tar czvf "$arg.tar.gz" -C "$arg" .
    fi
  done
}

path() {
  if [ "$#" -eq 0 ]; then
    echo -e "${PATH//:/\\n}"
  else
    type -a "$@"
    declare -f "$@" || true
  fi
}

vf() {  # find files: vf; open files from pipe: fd | vf
  local IFS=$'\n'
  if [ ! -t 0 ] ; then
    $EDITOR "$@" -- $(cat)
  else
    local fzftemp=($(FZF_DEFAULT_COMMAND="$FZF_CTRL_T_COMMAND $*" FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf --multi))
    [ -n "$fzftemp" ] && $EDITOR -- "${fzftemp[@]}"
  fi
}

cdf() {
  local fzftemp
  fzftemp=$(FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --color=always --hidden --exclude=.git $*" fzf --ansi --bind='tab:down,btab:up' --bind="\`:unbind(\`)+reload(fd --strip-cwd-prefix --color=always --hidden --exclude=.git --no-ignore $* || true)") && {
    [ -d "$fzftemp" ] && cd "$fzftemp" || {
      [ -d "$(dirname "$fzftemp" 2> /dev/null)" ] && cd "$(dirname "$fzftemp")"
    }
  }
}

vrg() {
  if [ "$#" -eq 0 ]; then
    [[ ! $(fc -ln -1) =~ ^rg* ]] && echo 'Need a string to search for.' || eval "v$(fc -ln -1)"
    return 0
  fi
  if [[ \ $*\  = *\ --fixed-strings\ * ]] || [[ \ $*\  = *\ -F\ * ]]; then
    $EDITOR -q <(rg "$@" --vimgrep) -c "/\V$1"  # use \V if rg is called with -F/--fixed-strings to search for string literal
  else
    $EDITOR -q <(rg "$@" --vimgrep) -c "/$1"
  fi
}

# https://github.com/junegunn/fzf/blob/HEAD/ADVANCED.md#ripgrep-integration
fif() {  # find in file
  if [ "$#" -eq 0 ]; then echo 'Need a string to search for.'; return 1; fi
  rg --files-with-matches --no-messages "$@" | fzf --multi --preview-window=up:60% --preview="rg --pretty --context 5 --max-columns 0 -- $(printf "%q " "$@"){+}" --bind="enter:execute($EDITOR -c \"/$1\" -- {+} < /dev/tty)"
}
rf() {  # livegrep: rf [pattern] [flags], pattern must be before flags, <C-s> to switch to fzf filter
  [ "$#" -gt 0 ] && [[ "$1" != -* ]] && local init_query="$1" && shift 1
  local rg_prefix="rg --column --line-number --no-heading --color=always$([ "$#" -gt 0 ] && printf " %q" "$@")"
  FZF_DEFAULT_COMMAND="$rg_prefix $(printf %q "${init_query:-}")" \
  fzf --ansi --layout=default --height=100% --disabled --query="${init_query:-}" \
      --header='??? <C-s> (fzf mode) ??? <C-r> (reset ripgrep) ???' \
      --bind='ctrl-s:unbind(change,ctrl-s)+change-prompt(2. fzf> )+enable-search+clear-query+rebind(ctrl-r)' \
      --bind="ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($rg_prefix {q} || true)+rebind(change,ctrl-s)" \
      --bind="change:reload:sleep 0.2; $rg_prefix -- {q}" \
      --bind="enter:execute($EDITOR -c \"let @/={q}\" -c \"set hlsearch\" +{2} -- {1} < /dev/tty)" \
      --bind='tab:down,btab:up' \
      --prompt='1. ripgrep> ' --delimiter=: \
      --preview='bat --color=always --theme=Dracula --highlight-line {2} -- {1}' \
      --preview-window='up,40%,border-bottom,+{2}+3/3,~3'
}

unalias z 2> /dev/null
z() {
  local fzftemp
  if [ "$#" -eq 0 ]; then
    fzftemp=$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --scheme=history --tac --bind='tab:down,btab:up' --bind="\`:unbind(\`)+reload(sort -n -k 3 -t '|' ~/.z | awk -F '|' -v cwd=\"$PWD\" '\$0~cwd {print \$1}')") && cd "$fzftemp"
  else
    _z 2>&1 "$@"
  fi
}

t() {  # create, restore, or switch tmux session
  local change current fzftemp sessions
  [ -n "$TMUX" ] && change='switch-client' && current=$(tmux display-message -p '#{session_name}') || change='attach-session'
  if [ "$#" -eq 0 ]; then
    fzftemp=$(tmux list-sessions -F '#{session_name}' 2> /dev/null | sed "/^$current$/d" | fzf --prompt='attach> ' --bind='tab:down,btab:up' --select-1 --exit-0) && tmux $change -t "$fzftemp"
    if [ "$?" -ne 0 ]; then
      sessions=$(ls ~/.local/share/tmux/resurrect/tmux_resurrect_*.txt 2> /dev/null)
      [ -n "$sessions" ] && fzftemp=$(echo "$sessions" | fzf --prompt='restore> ' --bind='ctrl-d:execute(mv {} {}.bak)' --bind='tab:down,btab:up' --tac --preview='cat {}') && {
        ln -sf "$fzftemp" ~/.local/share/tmux/resurrect/last
        tmux new-session -d " tmux run-shell $HOME/.tmux/plugins/tmux-resurrect/scripts/restore.sh"
        tmux attach-session
      } || tmux
    fi
  else
    [ "$1" == a ] && tmux attach || tmux $change -t "$1" 2> /dev/null || (tmux new-session -d -s "$@" && tmux $change -t "$1")
  fi
}

manf() {
  if [ "$#" -eq 0 ]; then
    local fzftemp
    fzftemp=$(man -k . 2> /dev/null | awk 'BEGIN {FS=OFS="- "} /\([1|4]\)/ {gsub(/\([0-9]\)/, "", $1); if (!seen[$0]++) { print }}' | fzf --bind='tab:down,btab:up' --prompt='man> ' --preview=$'echo {} | xargs -r man') && nvim +"Man $(echo "$fzftemp" | awk -F' |,' '{print $1}')" +'bdelete #'
  else
    nvim +"Man $*" +'bdelete #'
  fi
}

envf() {
  local fzftemp
  fzftemp=$(printenv | cut -d= -f1 | fzf --bind='tab:down,btab:up' --query="${1:-}" --preview='printenv {}') && echo "$fzftemp=$(printenv "$fzftemp")"
}

jo() {  # basic implementation of https://github.com/jpmens/jo
  local args=()
  for arg in "$@"; do
    args+=(--arg "$(cut -d= -f1 <<< "$arg")" "$(cut -d= -f2- <<< "$arg")")
  done
  jq -n "${args[@]}" '$ARGS.named'
}

react() {
  if [ "$#" -lt 2 ]; then echo "Usage: $0 <dir_to_watch> <command>, use {} as placeholder of modified files." >&2; return 1; fi
  local changed
  echo "Watching \"$1\", passing modified files to \"${*:2}\" command every 2 seconds." >&2
  while true; do
    changed=($(fd --base-directory "$1" --absolute-path --type=f --changed-within 2s))
    if [ ${#changed[@]} -gt 0 ]; then
      local cmd="${@:2}"
      eval "${cmd//\{\}/${changed[@]}}"
    fi
    sleep 2
  done
}

untildone() {
  if [ "$#" -eq 0 ]; then
    echo -e "Usage: $0 <command>\n\t$0 wget -c <url>  # wget until complete\n\t$0 'git pull; sleep 3599; false'  # git pull every hour\n\t$0 '! ps <pid>'; ./run  # run after pid exits" >&2
    return 1
  fi
  local i=1
  while true; do
    echo "Try $i, $(date)." >&2
    eval "$@" && break
    ((i+=1))
    sleep 1
    echo >&2
  done
}

set-env() {
  if [ "$#" -lt 1 ]; then echo "Usage: $0 {java_home|path}" >&2; return 1; fi
  local cmd reply
  while [ $# != 0 ]; do
    case $(tr '[:upper:]' '[:lower:]' <<< "$1") in
      java_home|javahome) cmd="export JAVA_HOME=\"$(asdf where java)\""; shift 1 ;;
      path) cmd="export PATH=\"$PWD:\$PATH\""; shift 1 ;;
      *) echo "Unsupported argument $1, exiting.." >&2; return 1 ;;
    esac
  done
  eval "$cmd"
  printf 'Write to .bashrc and .zshrc (y/N)? '
  read -r reply
  echo "$cmd" | if [[ "$reply" == [Yy] ]]; then tee -a ~/.bashrc ~/.zshrc && echo 'Appended to ~/.bashrc and ~/.zshrc'; else cat; fi
}

tldr() {
  curl "https://cheat.sh/${*// /+}"
}

getip() {
  if [ "$#" -gt 1 ]; then
    echo "Usage: $0 [--private|ip|domain]" >&2
  elif [ "$#" -eq 0 ]; then
    curl -s "https://checkip.amazonaws.com"  # or ifconfig.me
  elif [ "$1" = '--private' ]; then  # en0: wireless, en1: ethernet, en3: thunderbolt to ethernet
    builtin command -v ifconfig > /dev/null 2>&1 && ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' || ipconfig getifaddr en0 2> /dev/null || ipconfig getifaddr en1 2> /dev/null || hostname -I 2> /dev/null || ip route get 1.1.1.1 | awk '{print $7}'
  elif [[ $1 =~ ^[0-9.]+$ ]]; then
    curl -s "http://ip-api.com/line/$1"
  else
    curl -s "https://dns.google.com/resolve?name=$1" | if builtin command -v python > /dev/null 2>&1; then python -m json.tool; else cat; fi
  fi
}

ec2() {
  local instances ids curr_state
  case $1 in
    start) curr_state=stopped ;;
    stop) curr_state=running ;;
    refresh)
      aws ec2 describe-instances --filter 'Name=tag-key,Values=Name' 'Name=tag-value,Values=*' 'Name=instance-state-name,Values=running' --query "Reservations[*].Instances[*][NetworkInterfaces[0].Association.PublicDnsName,Tags[?Key=='Name'].Value[] | [0]]" --output text
      return 0 ;;
    ssh)
      local tag=${2:-$(aws ec2 describe-instances --filter 'Name=tag-key,Values=Name' 'Name=tag-value,Values=*' "Name=instance-state-name,Values=*" --query "Reservations[*].Instances[*][Tags[?Key=='Name'].Value[] | [0],InstanceId]" --output text | fzf | awk '{print $1}')}
      [ -z "$tag" ] && return 1
      local host=$(aws ec2 describe-instances --filter 'Name=tag-key,Values=Name' 'Name=tag-value,Values=*' 'Name=instance-state-name,Values=running' --query "Reservations[*].Instances[*][NetworkInterfaces[0].Association.PublicDnsName,Tags[?Key=='Name'].Value[] | [0]]" --output text | grep "\s$tag$" | awk '{print $1}')
      local config="Host $tag\n  HostName $host\n  User %s\n  IdentityFile ~/.ssh/ec2.pem\n\n"
      if [ -z "$host" ]; then
        ec2 start "$tag" && sleep 15 && ec2 ssh "$tag"
        return $?
      fi
      echo "ssh to ec2: $host" >&2
      shift 2
      sed -i "/Host $tag/,/^\s*\$/{d}" ~/.ssh/ec2hosts 2> /dev/null
      printf "$config" ec2-user >> ~/.ssh/ec2hosts
      ssh -o 'StrictHostKeyChecking no' -i ~/.ssh/ec2.pem "$@" "ec2-user@$host" || {
        sed -i "/Host $tag/,/^\s*\$/{d}" ~/.ssh/ec2hosts 2> /dev/null
        printf "$config" ubuntu >> ~/.ssh/ec2hosts
        ssh -o 'StrictHostKeyChecking no' -i ~/.ssh/ec2.pem "$@" "ubuntu@$host"
      }
      return 0 ;;
    *) echo "Usage: $0 {start|stop|refresh|ssh} [instance-tag] [options]" >&2; return 1 ;;
  esac
  instances=$(aws ec2 describe-instances --filter 'Name=tag-key,Values=Name' 'Name=tag-value,Values=*' "Name=instance-state-name,Values=$curr_state" --query "Reservations[*].Instances[*][Tags[?Key=='Name'].Value[] | [0],InstanceId]" --output text)
  if [ -n "$2" ]; then
    ids=$(echo "$instances" | grep "^$2\s" | awk '{print $2}')
  else
    ids=$(echo "$instances" | fzf --multi | awk '{print $2}')
  fi
  [ -z "$ids" ] && return 1
  if [ "$curr_state" = stopped ]; then
    aws ec2 start-instances --instance-ids $(echo $ids)
  else
    aws ec2 stop-instances --instance-ids $(echo $ids)
  fi
}

# ====================== MacOS ==========================
if [[ $OSTYPE = darwin* ]]; then
  alias idea='open -na "IntelliJ IDEA.app" --args'
  alias ideace='open -na "IntelliJ IDEA CE.app" --args'
  alias clear-icon-cache='rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock'
  alias toggle-dark-theme='automator ~/.vim/config/macToggleDark.wflow'
  browser-history() {
    local cols=$((COLUMNS / 3)) sep='{::}' fzftemp fzfprompt
    if [ -f "$HOME/Library/Application Support/Microsoft Edge/Default/History" ]; then
      fzfprompt='Edge> '
      command cp -f "$HOME/Library/Application Support/Microsoft Edge/Default/History" /tmp/browser-history-fzf-temp
    elif [ -f "$HOME/Library/Application Support/Google/Chrome/Default/History" ]; then
      fzfprompt='Chrome> '
      command cp -f "$HOME/Library/Application Support/Google/Chrome/Default/History" /tmp/browser-history-fzf-temp
    else
      echo "Chrome and Edge histories not found, exiting.."
      return 1
    fi
    fzftemp=$(sqlite3 -separator $sep /tmp/browser-history-fzf-temp "select substr(title, 1, $cols), url from urls order by last_visit_time desc" |
      awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
      fzf --tiebreak=index --toggle-sort=\` --header='Press ` to toggle sort' --prompt="$fzfprompt" --ansi --multi) && \
      echo $fzftemp | sed 's#.*\(https*://\)#\1#' | xargs open
  }
fi
