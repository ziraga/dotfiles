Install
-------

1. First, you need a local copy of this project.

   If you're lucky and have `git` already installed on your machine, do:

        $ cd ~
        $ git clone --https://github.com/ziraga/dotfiles.git

   If you don't have `git` yet, fetch an archive of the repository:

        $ mkdir ~/dotfiles
        $ cd ~/dotfiles
        $ curl -fsSL https://github.com/ziraga/dotfiles/tarball/master | tar --strip-components 1 -xvzf -

2. Now you can install the dotfiles on your system:

        $ cd ~/dotfiles
        $ ./install.sh 2>&1 | tee ./install.log


Upgrade
-------

I'm trying to make the install procedure indempotent so you'll just have to
call the script again to upgrade your system:

    $ ./install.sh 2>&1 | tee ./install.log


Restore
-------

A backup of the original dotfiles is made when `install.sh` is first called.

To restore the originals, run:

    $ ./install.sh restore

Note that if there was not an original version, the installed links will not be
removed.

Sources
-------

This repository contain configuration I accumulated over years of daily usage,
but also draws from others:

  * http://kevin.deldycke.com/2006/12/all-my-command-lines/
  * https://github.com/joedicastro/dotfiles/tree/master/vim
  * https://github.com/mathiasbynens/dotfiles
  * https://github.com/sontek/dotfiles
  * https://github.com/reinout/tools
  * https://github.com/18F/laptop
  * https://github.com/kdeldycke/dotfiles

Third party assets:

    Source Code Pro 1.017
    Copyright (c) 2012 Adobe Systems
    Distributed under a SIL Open Font License version 1.1
    Source: https://github.com/adobe-fonts/source-code-pro/releases/latest

    Solarized - OS X 10.7+ Terminal.App color theme
    Copyright (c) 2013 Tomislav Filipčić
    Distributed under an unknown open-source license
    Source: https://github.com/tomislav/osx-terminal.app-colors-solarized

    Solarized Xresources Color Scheme
    Copyright (c) 2011 Ethan Schoonover
    Distributed under an open-source license
    Source: https://github.com/solarized/xresources

    Solarized Color Theme for GNU ls
    Copyright (c) 2013 Sebastian Tramp
    Distributed under a Do What The Fuck You Want To Public License (WTFPL)
    Source: https://github.com/seebi/dircolors-solarized/blob/master/dircolors.256dark