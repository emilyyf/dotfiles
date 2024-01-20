zsh:
	stow --restow --verbose --target=$$HOME zsh
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o $$HOME/.zsh/plugins/git-prompt.sh

emacs:
	git clone --depth 1 https://github.com/doomemacs/doomemacs $$HOME/.config/emacs
	$$HOME/.config/emacs/bin/doom install --force
	rm $$HOME/.config/doom/config.el $$HOME/.config/doom/init.el
	stow --restow --verbose --target=$$HOME emacs
	$$HOME/.config/emacs/bin/doom sync

nvim:
	stow --restow --verbose --target=$$HOME nvim

tmux:
	stow --restow --verbose --target=$$HOME tmux

yabai:
	stow --restow --verbose --target=$$HOME yabai

skhd:
	stow --restow --verbose --target=$$HOME skhd

sketchybar:
	stow --restow --verbose --target=$$HOME SketchyBar
