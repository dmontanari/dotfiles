#!/usr/bin/env python3

import os
from apt import Cache as Cache

vim_dependencies = ['vim-tiny','vim-common','vim-gnome',
                    'vim-gui-common','vim-runtime','vim-scripts', 
                    'git', 'powerline', 'cmake', 'python3-jedi']

cache = Cache()

for vim_dep in vim_dependencies:
    if not cache[vim_dep].is_installed:
        print('Vim dependency ', vim_dep, ' not found. Installing...')
        # TODO : Its possible to use apt module to install packages ?
        install_the_package = 'sudo apt-get install --yes ' + vim_dep
        print('--> ', install_the_package)
        os.system(install_the_package)

# Check for vim directory
vim_dir = os.environ['HOME']
vim_dir += "/.vim/bundle/"

if not os.path.isdir(vim_dir):
    os.makedirs(vim_dir)
else:
    print("Directory ", vim_dir, " exist...")

# Clone vundle repository
print("Clonnign vundle repository...")
clone_vundle  = "git clone https://github.com/VundleVim/Vundle.vim.git "
clone_vundle += "~/.vim/bundle/Vundle.vim"
os.system(clone_vundle)

print("Copying vimrc to .vimrf")
os.system("cp vimrc ~/.vimrc")

print("---------------------------------------")
print("Installing vim plugins...")
print("Ignore the error about gruvbox color scheme, it will be fixed automatically")
vim_install_plugins = "vim +PluginInstall +qall"

os.system(vim_install_plugins)

print("Done. To enable YouCompleteMe its necessary to enter in the directory")
print("~/.vim/bundle/YouCompleteMe/ and execute the install.py script there.")
print("To see the options of YCM install, use install.py --help")


