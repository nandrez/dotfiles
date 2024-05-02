if status is-interactive
    
    # basic configuration
    set -U fish_greeting # disable
    set -U fish_key_bindings fish_vi_key_bindings
    set -Ux EDITOR nvim

    # HOMEBREW
    eval "$(/opt/homebrew/bin/brew shellenv)"
    fish_add_path ~/.config/bin

    starship init fish | source
    zoxide init fish | source
end
