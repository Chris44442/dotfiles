pacman -S --noconfirm git python3

echo "########################"
echo "###  INSTALL NEOVIM  ###"
echo "########################"
wget -P ~/.local https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
cd ~/.local/
tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
cd
export PATH="/home/chris/.local/nvim-linux64/bin:${PATH}"
echo "export PATH=\"/home/chris/.local/nvim-linux64/bin:\${PATH}\"" >> /home/chris/.bashrc

cd ./local

