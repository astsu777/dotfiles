# Dotfiles

![](https://hostr.co/file/VvyK1CyZGELf/dotfiles-showcase.png)

This repository hosts all my public configuration files. They offer the following features:

* Modular configuration of $SHELL (BASH & ZSH): the *shellconfig* folders contain multiple files that can easily be customized
* Dynamic dotfiles: checks for applications are performed before setting up any aliases/functions
* Automated prompt customization: two custom prompts are possible (with or without *Starship* prompt). If using TMUX, all plugins are automatically installed. VIM/Neovim plugins are also automatically installed
* Remote session detection: certain things will not be enabled when a SSH session is detected (for servers). Also, the dotfiles will not be loaded at all when a non-interactive session is opened (ex.: SFTP connection)
* Non bloated shell config: although the files are quite big, not a single alias/function/variable will be set if it is useless on the system (ex.: alias to an application that is not installed)
* Quick discharge: an alias called either *bbash* or *zzsh* (depending on your $SHELL) is present to quickly open a session without any of the dotfiles loaded. This is useful for testing/troubleshooting using a vanilla shell environment. The same thing can be applied for some applications (ex.: *vvim* to load VIM/Neovim without any configuration)
* Easy to deploy as only generic paths/names are configured with the exception of certain variables explained below

<u>**Note**</u>: these dotfiles work on both macOS and Linux. There is a somewhat compatibility with WSL2 but don't expect for everything to work out of the box.

In its current state, my $SHELL loads quite quickly with the following statistics:

```
BASH:
# time bash -i -c "echo -n"
bash -i -c "echo -n"  0.02s user 0.01s system 103% cpu 0.031 total
bash -i -c "echo -n"  0.03s user 0.01s system 102% cpu 0.038 total
bash -i -c "echo -n"  0.04s user 0.01s system 103% cpu 0.049 total
bash -i -c "echo -n"  0.03s user 0.01s system 103% cpu 0.037 total

ZSH:
# time zsh -i -c "print -n"
zsh -i -c "print -n"  0.33s user 0.10s system 103% cpu 0.416 total
zsh -i -c "print -n"  0.17s user 0.04s system 106% cpu 0.194 total
zsh -i -c "print -n"  0.17s user 0.05s system 106% cpu 0.201 total
zsh -i -c "print -n"  0.15s user 0.07s system 106% cpu 0.207 total
```

# Installation
It is possible to simply clone this repository and use the dotfiles (symlinks or copy the files):

```
git clone --depth 1 https://github.com/GSquad934/dotfiles.git "$HOME"/.dotfiles
```

It is necessary to modify either the *.bashrc* or the *.zshrc* file and change the following variables according to your needs:
* **DOTFILES**: defines the default location of the dotfiles ($HOME/.dotfiles).
* **SCRIPTS**: defines the default location of the custom scripts ($HOME/.local/bin)
* **SOURCES**: defines the default location of source files ($HOME/.sources)
* **REPOS**: defines the default location of git repositories ($HOME/.sources/repos)

The installation can be automated when using my [bootstrap script](https://github.com/GSquad934/bootstrap.git). This script is modular so it is possible to only deploy the dotfiles and nothing else.

# Miscellaneous

## Scripts
Custom scripts are present in the folder *local/bin* for various things. This folder is present in the *$PATH* and all scripts can be called at any time. Some are meant to be called by other programs instead. For example, the *statusbar* folder contains scripts configuring my status bar in *DWM*. The folder *cron* contains scripts that can be used as cron jobs.

## Resources
The folder *local/share* contains resources that can be useful for either other programs or for the user

## X11
The configuration files stored in *config/X11* are meant to be used for graphical environments. Here is the purpose of each file in this folder:

* *xinitrc*: this file is supposed to be located in *$HOME/.xinitrc* and is loaded by *xorg-xinit* when logging in without any display manager. The very first line defines which GUI needs to be loaded and the rest is executing commands automatically to setup the screen layout, keyboard, programs required to start automatically, etc...
* *xprofile*: this file is the equivalent of *xinitrc* but is supposed by display managers at logon. The only display manager I ever used is *LightDM*, I cannot guarantee compatibility with other ones for the moment
* *x11dwm*, *x11leftwm*, *x11...*: these files are sourced in the *xinitrc* and *xprofile* files and there is one per GUI I support. The reason for this is to provide modularity and avoid repeatetiveness in both *xinitrc* and *xprofile*
* *lightdm*: these are configuration files for *LightDM* display manager when using the GTK greeter. The customization is very light as I do not use any display managers at all (but I offer the option)

The deployment of the supported GUIs can be automated with my [bootstrap script](https://github.com/GSquad934/bootstrap.git) and the relevant x-file will also be automatically installed and configured.

### Theming
In the *config* folder, there are configuration files for GTK v2/v3 to setup a dark theming all around. I use *Adwaita-dark* and the mouse cursor is using *Breeze light*. The mouse cursor is defined in the *icons* folder. QT applications can also be dark, but this is not defined in my dotfiles.

### Default Applications (xdg-open)
All default applications for the main things I use have been defined in the file *config/mimeapps.list*. To be properly installed, this file should be present in both *$XDG_CONFIG_HOME* and *$HOME/.local/share/applications*. This file is used when a file is trying to be opened with *xdg-open*. Although it is present in this repository, it can easily be overwritten by any default application manager.

Basically, it defines *Firefox* as the default Web browser, *feh* as the default image viewer, *vim* as the default text editor, *zathura* as the default PDF/Dejavu/eBook reader, *mpv* as the default video/audio player, *pcmanfm* as the default file explorer. There is also a few file associations for some other applications.

## Terminal Emulators
Configuration files for three terminal emulators are available: *Alacritty*, *Kitty*, and *xTerm*. I don't use the four of them obviously, my daily driver being *Alacritty* as it is fast and minimalist. However, it is also GPU-accelerated and based on *OpenGL*, same as *Kitty*. This means that both of them cannot be used when *OpenGL* libraries are updated and/or if they are missing/buggy. In that case, I usually use *ST* even though it has no config file. Finally, *xTerm* is the last resort terminal emulators if all else is not working. *xTerm* is also the default terminal emulator in the failsafe GUI environment (see chapter about JWM).

A few comments about each terminal emulators:

* *Alacritty* is rendering fonts differently depending on the screen resolution and the configuration files differ slightly between macOS/Linux. Therefore, multiple *Alacritty* config files are available for my different computers.
* *Kitty* works like *Alacritty* but does a much better job at rendering unicode characters (useful sometimes): this is the main reason I keep it around. It has much more features (that I don't use). It has almost the same configuration as *Alacritty*, no extra plugins/*kittens*. Depending on the machine, it can also be more performant than *Alacritty*
* *Simple Terminal (ST)* works well enough. It is the fallback terminal emulator when *OpenGL* has been updated and I don't want to reboot immediately afterwards
* *xTerm* is never used, but I have it installed on all my workstations for a failsafe environment. If my WM/DE fails, I can work inside a failsafe GUI and *xTerm* is the default terminal emulator there

I have *ST* installed automatically when deploying my GUI (WM or DE). Useful for VMs mainly and machines where I don't deploy my applications and dotfiles. My built of *ST* can be found [here](https://github.com/GSquad934/st.git).

## Shell/Prompt
The folder *shellconfig* contains all the config files used to customize my shell and my command prompt. It is modular: this means that the *Bash* and *ZSH* configuration are split between different files so it is common in both shells. I use *ZSH* on my workstations and *Bash* on all my servers: both are using the same dotfiles.

The logic of every file is the following:

* *bashrc*/*zshrc*: the configuration file of both *Bash* and *ZSH* respectively
* *zshenv*: file necessary to load my *.zshrc* because it is not located in my *$HOME* folder
* *common*: settings that are common to both shells (environment variables, some settings, etc...)
* *functions*: all functions are defined here. I wanted them to be separated from aliases
* *apps_aliases*: contains all aliases for external applications (not built-in to the shell AND not drop-in replacements for important commands such as *ls* for example)
* *basecmds_aliases*: contains aliases that replace certain basic commands such as *cat* replaced by *ccat* for example
* *enhancements_aliases*: alias basic commands such as *ls* and automatically add some parameters such as auto-colour
* *files_aliases*: if *FZF* is not installed on the system, it makes aliases for most configuration files to quickly edit them

<u>**Note**</u>: all the files contain a lot of checks/tests to not deploy useless aliases/functions that won't work on the system. For example, if an application is not installed and some aliases are defined for it, these aliases will not be set at all.

### Quick Discharge
Sometimes, it can be useful to drop all the customization and have a plain vanilla *Bash*/*ZSH* environment. In order to do this, it is pretty simple:

* *Bash*: type *bbash* and a new shell will be opened without any configuration whatsoever
* *ZSH*: type *zzsh* and a new shell will be opened without any configuration whatsoever

The same is available for other applications. For example, *VIM*/*Neovim* can be launched with the alias *vvim* and no configuration will be loaded.

## DOSBox
There is a sample *DOSBox* configuration that I keep around and modify if needed. This template works well for me and I usually only modify the [*autoexec*] commands at the end of the file. I use this program for playing old games only and this configuration gives me good performances/stability.

## TMUX
*TMUX* configuration has changed over the years and multiple *TMUX* config files are available. A single one is present for my workstations and two are aimed for remote SSH connections. The file called *tmux24-server.conf* is meant to be used on servers with *TMUX* v2.9 or higher (earlier versions should use the file called *tmuxpre29-server.conf* for compatibility purposes).

My dotfiles will open *TMUX* automatically unless the window manager is *DWM* or *LeftWM*: I tend to open multiple terminal emulators when using a tiling window manager. This is configured in the file called *shellconfig/common*. On a remote server, *TMUX* is also automatically loaded upon login.

<u>**Note**</u>: even though I also use a tiling window manager in macOS (called *Amethyst*), I still use *TMUX* automatically on my Mac as it is more convenient.

### Screen
A *screenrc* file is present in this repository in case I would not be able to use *TMUX*. It is very simple:

* Add keybinding to kill window with CTRL+k
* Set new windows as logged in automatically (avoid having to login manually)
* Enables SHIFT+PgUP/SHIFT+PgDOWN
* True colors and bold colors are enabled

## Simple X Hotkey Daemon (SXHKD)
I use this application to globally define my keybindings to do... well everything. A lot of environment variables are defined in this file as I don't like to hard-code applications, paths, etc... All of these environment variables are configured in the file *shellconfig/common*.

Doing this allows modularity: for example, Mod4+ALT+w opens the Web browser defined by the *$BROWSER* variable. This variable sets *Firefox* as the primary browser, but then several fallbacks such as *Qutebrowser*, *Brave*, etc...

## VIM/Neovim
In this repository, the *vim* folder contains all the necessary configuration files for *VIM*. However, I use *Neovim* as my text editor (mostly for new window stuff) but don't have a specific config file for it: the *~/.config/nvim/init.vim"* is actually a symlink to the *.vimrc*. When deploying my dotfiles, simply simlink the *vim* folder to *~/.config/nvim* and it will work.

Because the *VIM* configuration is quite light, it is fully compatible with *Neovim*. There is no *Neovim* specific setting present.

## Weechat
*Weechat* has a lot of tweaks in its configuration provided in these dotfiles. Some plugins (called scripts) are also deployed but they also lead to potentially two issues:

* Plugins are mainly developed in *Perl*, *Ruby* and *Python*. An error message will appear of one these three dependencies is missing
* It is possible that plugins are outdated on first load: they need to be updated with the following commands:

```
/set script.scripts.download_enabled on
/script update
/script upgrade
```

The scripts download and deployment of the frameworks is never automated, not even by my [bootstrap script](https://github.com/GSquad934/bootstrap.git) The reason for this is simply security.

# Failsafe GUI (JWM)
I mainly use *DWM* as my window manager, but all my workstations have *JWM* installed as well. The configuration file for *JWM* is very minimalist: a dark theme and a simple menu to launch a terminal emulator, a Web browser and *DMenu*. This environment can be used as a failsafe GUI when the others are not working well enough (or for a very old machine where system resources are too limited).

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/gaetanict)
* [Email](mailto:gaetan@ictpourtous.com)
