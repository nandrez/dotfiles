# My dotfiles
This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system

### Homebrew
Visit [brew.sh](https://brew.sh/)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Git
```
brew install git
```

### Stow
```
brew install stow
```

## Installation
Clone the dotfiles repo to your machine, for instance ~/Dev/dotfiles
```
$ git clone git@github.com/nandrez/dotfiles.git
```

then use GNU stow to create symlinks
```
$ stow -t ~ ./dotfiles
```
