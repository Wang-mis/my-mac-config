# Source after Oh My Zsh (or compinit) has initialized completion.
# Requires the zellij executable in PATH.

function za() {
  if [[ -n "${ZELLIJ:-}" ]]; then
    print -u2 "Already inside a Zellij session."
    return 1
  fi

  if (( $# > 1 )); then
    print -u2 "Usage: za [session-name]"
    return 2
  fi

  local session="${1:-${PWD:t}}"
  zellij attach --create "$session"
}

_za() {
  (( CURRENT == 2 )) || return 1
  local -a sessions
  sessions=("${(@f)$(zellij list-sessions --short --no-formatting 2>/dev/null)}")
  [[ -n "${sessions[1]}" ]] || return 1
  compadd -- "${sessions[@]}"
}
compdef _za za

alias zl="zellij list-sessions"
