# --- 1. Environment & Path Setup ---
typeset -U path cdpath fpath manpath
# Standard Arch/CachyOS paths for completions
fpath=(/usr/share/zsh/site-functions /usr/share/zsh/functions $fpath)
# Help directory for standard ZSH install
HELPDIR="/usr/share/zsh/help"
# --- 2. History Configuration ---
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS 
setopt HIST_IGNORE_SPACE 
setopt SHARE_HISTORY
setopt GLOB_STAR_SHORT
unsetopt APPEND_HISTORY 
unsetopt EXTENDED_HISTORY 
unsetopt HIST_EXPIRE_DUPS_FIRST 
unsetopt HIST_FIND_NO_DUPS
unsetopt HIST_IGNORE_ALL_DUPS 
unsetopt HIST_SAVE_NO_DUPS
# --- 3. Completions & Styling ---
autoload -U compinit && compinit
# Completion Styling (TokyoNight/Standard Fix)
zstyle ':completion:*' menu no
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}" 'ma=48;5;4;fg=15'
zstyle ':completion:*:descriptions' format '[%d]'
# fzf-tab styling
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'
# --- 4. Kitty Integration ---
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="no-rc"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi
# --- 5. Plugins (Arch Linux Paths) ---
# fzf-tab (must be after compinit, before syntax highlighting)
source ~/.config/fzf-tab/fzf-tab.plugin.zsh
# Syntax Highlighting (Must be near the end)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# --- 6. Aliases ---
alias l='eza -lh --icons=auto'
alias ld='eza -lhD --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ls='eza -1 --icons=auto'
alias lt='eza --icons=auto --tree'
# --- 7. Tool Integrations (Order matters) ---
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
# z + tab triggers zoxide fzf picker, everything else uses default completion
_z_tab() {
    if [[ "$BUFFER" == "z" ]] || [[ "$BUFFER" == z\ * ]]; then
        local query="${BUFFER#z }"
        BUFFER=""
        CURSOR=0
        zle -R
        zi --query "$query"
        zle reset-prompt
        return
    fi
    zle fzf-tab-complete
}
zle -N _z_tab
bindkey '\t' _z_tab
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
# bun completions
[ -s "/home/adam/.bun/_bun" ] && source "/home/adam/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "$HOME/.local/bin/env"

