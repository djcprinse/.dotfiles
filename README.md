# .dotfiles

This repository contains basic configuration for your shell (zsh), ssh, git and terminal (iTerm2).

## Installation

You can install and start using this `.dotfiles` configuration by cloning this repository to your `$HOME` directory.

```shell
git clone git@github.com:djcprinse/.dotfiles.git $HOME/.dotfiles/
```

After cloning, `cd` into the `.dotfiles/installation` directory and run the `.installation.sh` script using the
following command.

```shell
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

For example: you can have a `.dotfiles-personal` repository containing your personal configuration files, for example
for your personal ssh and git configuration and some additional shell configuration. The ssh configuration can contain
your personal settings for ssh keys, hosts, identity files etc.

Next to your `.dotfiles-personal`, you can have a `.dotfiles-work` with configuration specifically made for your work
environment. You might have custom ssh keys for connecting to development or production systems. Or you might have some
specific tools you need to use to be able to do your work. You would be able to add this configuration and installation
files to a separate git repository.

Feel free to name the additional `.dotfiles-custom` repository to your wishes. Inside the `$HOME/.dotfiles/zsh/.zshrc`
configuration, directories starting with `.dotfiles-` are being scanned to source shell configuration, aliases and
exports from.

## ssh

To make sure all separate ssh configuration files will be included, an `Include` option has been added to
`$HOME/.zsh/config`. This `Include` option loads configuration files that are symlinked to the `$HOME/.ssh/config.d/`
directory. This directory is being created by the ssh installation script.

## git

To make sure all separate git configuration files will be included, a `.gitignore` will be created on setup which
includes `~/.dotfiles/git/.gitignore_global`. In your `.dotfiles-custom` directory, you can add a custom `.gitconfig`
and write this to the global `.gitconfig` using the snippet below.

```shell
echo '[include]' >> $HOME/.gitconfig
echo 'path = ~/.dotfiles-custom/git/.gitconfig' >> $HOME/.gitconfig
echo >> $HOME/.gitconfig
```

This will append the `include` option to the `.gitconfig` which makes sure that the correct git configuration will be
used for a repository.

### .dotfiles git configuration

You have to add a custom `includeIf` to your personal `.dotfiles-personal` for example to make git correctly work in
your `.dotfiles` repositories. Most likely these will be out of scope of your regular development directory, so git
needs to know what configuration to use. The block below shows an example of how I set up my git configuration from
within the `.gitconfig` in my custom `.dotfiles-personal` repository.

```
[includeIf "gitdir:~/.dotfiles/"]
    path = .gitconfig_github

[includeIf "gitdir:~/.dotfiles-personal/"]
    path = .gitconfig_github

[includeIf "gitdir:~/Development/github-projects/"]
    path = .gitconfig_github

[includeIf "gitdir:~/Development/gitlab-projects/"]
    path = .gitconfig_gitlab
```

The global `.gitconfig` contains the following entries to load the various `.gitconfig` files from withing my
`.dotfiles-personal` repository.

```
[include]
path = ~/.dotfiles/git/.gitconfig

[include]
path = ~/.dotfiles-personal/git/.gitconfig

...
```

Another approach you can take is setting the git user and email, which are required for commits, directly in the
`.dotfiles` repository by executing the commands below.

```shell
git config user.name "[YOUR NAME GOES HERE]"
git config user.email "[YOUR EMAIL GOES HERE]"
```

The first approach is my personal preference. By setting the configuration this way, I am sure that my git configuration
is equal in all places.

For example: if my email changes or if I want to add a GPG key to sign my commits on GitHub, all I have to do is
adjusting my `.gitconfig_github` with my updated email or newly created GPG key and signing settings to make it work for
all of my GitHub projects.

## Questions

Feel free to create an issue on this repository if you have any questions about it.
