source /usr/share/cachyos-fish-config/cachyos-config.fish

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='opencode'
alias cd='zd'
alias decompress='tar -xzf'
alias eff='$EDITOR "$(ff)"'
alias ff='fzf --preview '\''bat --style=numbers --color=always {}'\'''
alias g='git'
alias gcad='git commit -a --amend'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias ic='tdl c'
alias icx='tdl c cx'
alias ix='tdl cx'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias r='rails'
alias t='tmux attach || tmux new -s Work'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if test -z "$WAYLAND_DISPLAY"; and test (tty) = "/dev/tty1"
    exec start-hyprland
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/justin/miniconda3/bin/conda
    eval /home/justin/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/justin/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/justin/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/justin/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

