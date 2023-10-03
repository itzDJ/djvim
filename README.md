# DJ's [Neovim](https://neovim.io)
## Nerd Fonts
Install a [nerd font](https://www.nerdfonts.com/font-downloads) (ex: [JetBrainsMono Nerd Font Regular](https://www.programmingfonts.org/#jetbrainsmono)) for proper icon integration.

## Plugin manager
[Lazy](https://github.com/folke/lazy.nvim)

## Plugins
- [comment](https://github.com/numToStr/Comment.nvim)
- [copilot](https://github.com/github/copilot.vim)
- [github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)

## Dependencies
- True color support in terminal (optional)
- Node
- Git
- Curl
- Ripgrep

## Install
```bash
git clone https://github.com/itzDJ/djs-neovim ~/.config/nvim && nvim
```

## Uninstall
```bash
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

## TODO
### Text editing
- Have background non-transparent by default with a command to toggle transparency
- View and change tab value (2 or 4 spaces or tab)
- Add spell check
### Code editing
- Setup LSP for Java
- Setup for frontend dev (React/React Native)
    - autotags
- Check for way to run code (java, react native, python, etc.) without exiting vim
- Check if LSP zero still has an option to download LSP for current file
