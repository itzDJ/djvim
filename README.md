# DJ's [Neovim](https://neovim.io)

## Dependencies

- Plugins: `:checkhealth`
- [Nerd font](https://www.nerdfonts.com/font-downloads) like [JetBrainsMono](https://www.programmingfonts.org/#jetbrainsmono) for proper icon integration
- True color support in terminal
- macOS shell command to enable repeating vim motions in default terminal: `defaults write com.apple.Terminal ApplePressAndHoldEnabled -bool false`. Replace `com.apple.Terminal` with `-g` for global use.

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
  - LSPs (get as close to native nvim-lspconfig as possible)
  - Indents (controlled by LSP and formatter)
  - Formatting (ideally controlled by LSP allowing the removal of conform)
  - CMP (possibly limit to 5 values in the CMP)
