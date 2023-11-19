# DJ's [Neovim](https://neovim.io)

## Dependencies

- Plugins: `:checkhealth`
- [Nerd font](https://www.nerdfonts.com/font-downloads) like [JetBrainsMono](https://www.programmingfonts.org/#jetbrainsmono) for proper icon integration
- True color support in terminal
- macOS shell command to enable repeating vim motions in default terminal: `defaults write com.apple.Terminal ApplePressAndHoldEnabled -bool false`. Replace `com.apple.Terminal` with `-g` for global use.

## Plugins

- Plugin manager: [Lazy](https://github.com/folke/lazy.nvim)
- [comment](https://github.com/numToStr/Comment.nvim)
- [conform](https://github.com/stevearc/conform.nvim/)
- [copilot](https://github.com/github/copilot.vim)
- [github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [trouble](https://github.com/folke/trouble.nvim)

## Install

```bash
git clone https://github.com/itzDJ/djs-neovim ~/.config/nvim && nvim
```

## Uninstall

```bash
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

## TODO

- Per language settings:
  - Indents (controlled by LSP and formatter)
  - LSPs (get as close to native nvim-lspconfig as possible)
  - Formatting (ideally controlled by LSP allowing the removal of conform)
  - CMP (possibly limit to 5 values in the CMP)
  - Snippets (like java main method, java system.out.println, html5 expansion template)
- Add method to search TODOs (note: jdtls already highlights todos, so maybe treesitter/lsp highlighting todos + search is enough)
- Customize lualine (probably keep theme on auto).
- Add alpha-nvim and have it somewhat mirror VSCodium
- Consider using surround.vim instead of the two lua based plugins
