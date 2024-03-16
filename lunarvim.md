# Install LunarVim

```bash
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

You might need to remove exec -a lvim (exec -a "$NVIM_APPNAME" in newer versions) from ~/.local/bin/lvim and then run lvim?

## Install Lazygit

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## Configuration Directories

```bash
~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/styles.lua
~/.config/lvim/config.lua
~/.config/lvim/luasnippets/
```

## VHDL Language Server

- Download `vhdl_ls-x86_64-unknown-linux-gnu.zip` from [github](https://github.com/VHDL-LS/rust_hdl/releases).
- Place the `vhdl_ls` binary into `~/.local/bin/`. It must be on PATH, you can try it by running it in the terminal.
- Place the `.vhdl_ls.toml` file to the home dir `~`. Place `vhdl_ls.toml` (without the dot) in the work directory.
- With the config.lua setting the language server should now start upon opening .vhd files and be connected to the lsp client.

## Clangd

include path of c header files:
export CPATH="your/include:more/include:/usr/include"

## Rust Analyzer

bare metal (no_std, no main), add to Cargo.toml:

```toml
[[bin]]
name = "app"
test = false
bench = false
```

replace app with the name of your rust program, which is stated in the same file

