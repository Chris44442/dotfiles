# LunarVim

```bash
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

What if you remove exec -a lvim (exec -a "$NVIM_APPNAME" in newer versions) from ~/.local/bin/lvim and then run lvim?

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## Config

```lua
~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/styles.lua
~/.config/lvim/config.lua
```

K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.

## VHDL language server

Download `vhdl_ls-x86_64-unknown-linux-gnu.zip` from [github](https://github.com/VHDL-LS/rust_hdl/releases).

Place the `vhdl_ls` binary into `~/.local/bin/`. It must be on PATH, you can try it by running it in the terminal.

Type this into the `config.lua`:

```lua
function startvhdlls()
  vim.lsp.start({
    name = 'vhdl_ls',
    cmd = {'vhdl_ls'},
  })
end
vim.api.nvim_set_keymap('n', '<F5>', ':lua startvhdlls()<CR>', { noremap = true, silent = true })
```

This will start the LS by hitting the F5 key.

Place the `.vhdl_ls.toml` file to the home dir `~`. It should look something like this:

```toml
[libraries]
lib1.files = [
  '/home/chris/repo/x_rust_start_delete_me/stuff.vhd',
]
```

## Nvim Tree

Press a, r, d for new, rename, delete file.

