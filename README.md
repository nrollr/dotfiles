# dotfiles


## Instructions
### Generate a new SSH keys
* for documentation, see [GitHub docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* add the public key `~/.ssh/id_ed25519.pub` to your [GitHub profile](https://github.com/settings/keys)

<br>

### Install Homebrew and clone this directory
This requires you to execute (manually) the contents of [setup.sh](https://github.com/nrollr/dotfiles/blob/main/setup.sh) using Terminal: `sh setup.sh`.
* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* `mkdir $HOME/.dotfiles && cd $HOME/.dotfiles && git clone git@github.com:nrollr/dotfiles.git .`


<br>

### Deploy and configure
Once the `.dotfiles` directory is available on your device, complete the rest of the installation, using the command:
 `cd ~/.dotfiles && sh deploy.sh`. This installs and configures the following:

* install brew packages as listed in the [brewfile](https://github.com/nrollr/dotfiles/blob/main/homebrew/brewfile)
* clone GitHub repositories to `~/Downloads/Github`
* install
*
