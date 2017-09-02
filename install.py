#!/usr/bin/env python3

from os import system as sys
from apt import Cache as Cache

#
# VI Improved
#
# Depends on:
#   vim-tiny
#   
#   vim-common
#   
#
#

vim_dependencies = ['vim-tiny','vim-common','vim-gnome',
                    'vim-gui-common','vim-runtime','vim-scripts']

cache = Cache()

for vim_dep in vim_dependencies:
    if cache[vim_dep].is_installed:
        print('Vim dependency ', vim_dep, ' not found. Installing...')
        # TODO : Its possible to use apt module to install packages ?
        install_the_package = 'sudo apt-get install --yes ' + vim_dep
        print('--> ', install_the_package)
        sys(install_the_package)



