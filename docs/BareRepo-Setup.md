><u>This file is a placeholder. Information copied from [[spongeyperson/arch-dotfiles/README.md]](https://github.com/spongeyperson/arch-dotfiles/blob/main/README.md)

## Cloning this Repo:
> Please note, this information was taken from the following source and changed to fit the content of this repo.
> https://www.atlassian.com/git/tutorials/dotfiles


### From Scratch:

  1) <b>Initialize the Repo:</b>
      ```bash
      git init --bare $HOME/.dotfiles
      ```
  2) <b>Set an Alias in your Shell's Config:</b>
      > Fish Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.config/fish/config.fish
      ```
      > Bash Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.bashrc
      ```
  3) <b>Globally Untrack Files that aren't part of the Dotfiles</b>
      ```bash
      dotfiles config --local status.showUntrackedFiles no
      ```

### Migrate / Merge into System:

  1) <b>Set an Alias in your Shell's Config:</b>
      > Fish Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.config/fish/config.fish
      ```
      > Bash Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.bashrc
      ```
  2) <b>Globally Untrack Files that aren't part of the Dotfiles</b>
      ```bash
      dotfiles config --local status.showUntrackedFiles no
      ```
  3) <b>Set Dotfiles Repo Source as ignored:</b>
      ```bash
      echo ".dotfiles" >> .gitignore
      ```
  4) <b>Clone Bare Repo:</b>
      ```bash
      git clone --bare https://github.com/spongeyperson/arch-dotfiles.git $HOME/.dotfiles/
      ```
  5) <b>Checkout Content from Remote Repo:</b>
      ```bash
      dotfiles checkout
      ```