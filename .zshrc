# ---------------------------
# 1. Powerlevel10k Instant Prompt (must be FIRST)
# ---------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------
# 2. Environment variables
# ---------------------------
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"

# ---------------------------
# 3. Oh-My-Zsh and theme
# ---------------------------
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ---------------------------
# 4. Powerlevel10k main config
# ---------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---------------------------
# 5. Your custom code (aliases, exports, etc.)
# ---------------------------
# Add custom stuff here later if needed
export TERM=xterm-256color

# ---------------------------
# 6. Auto-start tmux (AFTER prompt is fully initialized)
# ---------------------------
# This MUST NOT run before P10K loads or instant prompt breaks.
# Moving this here fixes the warning.
if [[ -z "$TMUX" ]]; then
  (tmux attach -t default || tmux new-session -s default) >/dev/null 2>&1
fi
