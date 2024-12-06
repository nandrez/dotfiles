if status is-interactive
    
    # basic configuration
    set -U fish_greeting # disable
    set -U fish_key_bindings fish_vi_key_bindings
    set -Ux EDITOR nvim

    # HOMEBREW
    eval "$(/opt/homebrew/bin/brew shellenv)"
    fish_add_path ~/.config/bin
	alias brew=/Users/Shared/brew.sh

	# shell prompt (https://starship.rs/)
    starship init fish | source

	# improved 'cd' (https://github.com/ajeetdsouza/zoxide)
    zoxide init fish | source

	# Zellij (https://zellij.dev/)
	abbr -a zj zellij
end
