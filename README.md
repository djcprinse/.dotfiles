# .dotfiles

This repository contains basic configuration for your shell (zsh), ssh, git and terminal (iTerm2).

## Installation

You can install and start using this `.dotfiles` configuration by cloning this repository to your `$HOME` directory.

```
git clone git@github.com:djcprinse/.dotfiles.git $HOME/.dotfiles/
```

After cloning, `cd` into the `.dotfiles/installation` directory and run the `.installation.sh` script using the
following command.

```
cd $HOME/.dotfiles/installation/ && install.sh
```

The installation script will set up the shell, ssh and git configuration, install xcode-select and (home)brew and some
handy development tools and applications.

## shell

The shell being used in this repository is `zsh`. Some handy aliases and settings have been added, as well as the
complete configuration of the theme.

`zsh` has been extended with the awesome [`Oh My Zsh framework`](https://github.com/ohmyzsh/ohmyzsh/) alongside with the
great [`power10k`](https://github.com/romkatv/powerlevel10k) shell theme and a basic list of handy plugins.

### Custom dotfiles

Beside the regular `.dotfiles` configuration, there is also support build in for custom `.dotfiles` configuration.

For example: you can have a `.dotfiles-personal` directory containing your personal configuration files, for example for
your personal ssh and git configuration and some additional shell configuration. The ssh configuration can contain your
personal settings for ssh keys, hosts, identity files etc.

Next to your `.dotfiles-personal`, you can have a `.dotfiles-work` with configuration specifically made for your work
environment. You might have custom ssh keys for connecting to development or production systems. Or you might have some
specific tools you need to use to be able to do your work. You would be able to add this configuration and installation
files to a separate git repository.

Feel free to name the additional `.dotfiles-custom` directories to your wishes. Inside the `$HOME/.dotfiles/zsh/.zshrc`
configuration, directories starting with `.dotfiles-` are being scanned to source shell configuration, aliases and
exports from.

## ssh

To make sure all separate ssh configuration files will be included, an `Include` option has been added to
`$HOME/.zsh/config`. This `Include` option loads configuration files that are symlinked to the `$HOME/.ssh/config.d/`
directory. This directory is being created by the ssh installation script.

## git

TODO: Make sure git configuration is loaded from the custom `.dotfiles` directories.

## Questions

Feel free to create an issue on this repository if you have any questions about it.
