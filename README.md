# Dotfiles
![](https://i.postimg.cc/VvwjFG2P/screenshot-20210718-028.png)

This repository hosts all my public configuration files. These dotfiles offer the following features:

* Modular configuration of *$SHELL* (*BASH* & *ZSH*): the *shellconfig* folder contains multiple files that can easily be customized
* Dynamic dotfiles: checks for applications are performed before setting up any aliases/functions
* Automated prompt customization: two custom prompts are possible (with or without *Starship* prompt). If using *TMUX*, all plugins are automatically installed. *VIM/Neovim* plugins are also automatically installed
* Remote session detection: certain things will not be enabled when a SSH session is detected (for servers). Also, the dotfiles will not be loaded at all when a non-interactive session is opened (ex.: SFTP connection)
* Non bloated shell config: not a single alias/function/variable will be set if it is useless on the system (ex.: alias to an application that is not installed)
* Quick discharge: an alias called either *bbash* or *zzsh* (depending on your $SHELL) is present to quickly open a session without any of the dotfiles loaded. This is useful for testing/troubleshooting using a vanilla shell environment. The same thing can be applied for some applications (ex.: *vvim* to load *VIM/Neovim* without any configuration)
* Easy to deploy as only generic paths/names are configured with the exception of certain variables explained below

<u>**Note**</u>: these dotfiles work on both macOS and Linux. There is a somewhat compatibility with WSL2 but don't expect for everything to work out of the box.

In its current state, my *$SHELL* loads quite quickly with the following statistics:

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
The location of the dotfiles is as illustrated in this repository. The repository represents the root of the home folder. The folders *config*, *local*, *vim*, etc... are hidden folders in the root. The folder *shellconfig* is a bit different as only some files are meant to be installed as dotfiles.

# Documentation - Root Folder
## DOSBox
There is a sample *DOSBox* configuration (*dosbox* folder) that I keep around and modify if needed. This template works well for me and I usually only modify the [*autoexec*] commands at the end of the file. I use this program for playing old games only and this configuration gives me good performances/stability.

## Git
The file *gitconfig* contains the global *Git* configuration and several aliases to make life easier when using *Git* client.

## Failsafe GUI (JWM)
![](https://i.postimg.cc/Kj5tp7yk/screenshot-20210718-030.png)

I mainly use *DWM* as my window manager, but all my workstations have *JWM* installed as well. The configuration file for *JWM* (*jwmrc*) is very minimalist: a dark theme and a simple menu to launch a terminal emulator, a Web browser and *DMenu*. This environment can be used as a failsafe GUI when the others are not working well enough (or for a very old machine where system resources are too limited).

## Links
*Links* is a text Web browser to run inside a terminal emulator. It can be very useful to read certain Web pages by only getting the text and not all the JavaScript, CSS, etc... It is very useful to be combined with a RSS reader such as *newsboat* for example. The custom config files stored in *links/* contains some customization but it stays very close to the defaults of the program.

## Shell/Prompt
The folder *shellconfig* contains all the config files used to customize my shell and my command prompt. It is modular: this means that both *Bash* and *ZSH* configurations are split between different files so it is common in both shells. I use *ZSH* on my workstations and *Bash* on all my servers and sometimes workstations: both are using the same dotfiles.

The logic of every file is the following:

* *bashrc*/*zshrc*: the configuration file of both *Bash* and *ZSH* respectively
* *zshenv*: file necessary to load my *.zshrc* because it is not located in my *$HOME* folder
* *common*: settings that are common to both shells (environment variables, some settings, etc...)
* *functions*: all functions are defined here. I wanted them to be separated from aliases
* *apps_aliases*: contains all aliases for external applications (not built-in to the shell AND not drop-in replacements for important commands such as *ls* for example)
* *basecmds_aliases*: contains aliases that replace certain basic commands such as *cat* replaced by *highlight* for example
* *enhancements_aliases*: alias basic commands such as *ls* and automatically add some parameters such as auto-color
* *files_aliases*: if *FZF* is not installed on the system, it makes aliases for most configuration files to quickly edit them

<u>**Note**</u>: all the files contain a lot of checks/tests to not deploy useless aliases/functions that won't work on the system. For example, if an application is not installed and some aliases are defined for it, these aliases will not be set at all.

### Quick Discharge
Sometimes, it can be useful to drop all the customization and have a plain vanilla *Bash*/*ZSH* environment. In order to do this, it is pretty simple:

* *Bash*: type *bbash* and a new shell will be opened without any configuration whatsoever
* *ZSH*: type *zzsh* and a new shell will be opened without any configuration whatsoever

The same is available for other applications. For example, *VIM*/*Neovim* can be launched with the alias *vvim* and no configuration will be loaded.

## VIM/Neovim
![](https://i.postimg.cc/bvK0ZNTJ/screenshot-20210718-029.png)

In this repository, the *vim* folder contains all the necessary configuration files for *VIM*. However, I use *Neovim* as my text editor (mostly for new window stuff) but don't have a specific config file for it: the *~/.config/nvim/init.vim"* is actually a symlink to the *.vimrc*. When deploying my dotfiles, simply symlink the *vim* folder to *~/.config/nvim* and it will work.

Because the *VIM* configuration is quite light, it is fully compatible with *Neovim*. There is no *Neovim* specific setting present. The colorscheme used is called *[kuroi](https://github.com/aonemd/kuroi.vim)* ans is made by *Aonemd*. I simply disabled the background to use the one set by the terminal emulator (usually a little bit transparent and dark).

# Documentation - Local Folder
## Resources
The folder *local/share* contains resources that can be useful for either other programs or for the user.

### Scripts
Custom scripts are present in the folder *local/bin* for various things. This folder is present in the *$PATH* and all scripts can be called at any time. Some are meant to be called by other programs instead. For example, the folder *cron* contains scripts that can be used as cron jobs.

# Documentation - Config Folder
## Default Applications (xdg-open)
All default applications for the main things I use have been defined in the file *config/mimeapps.list*. To be properly installed, this file should be present in both *$XDG_CONFIG_HOME* and *$HOME/.local/share/applications*. This file is used when a file is trying to be opened with *xdg-open*. Although it is present in this repository, it can easily be overwritten by any default application manager.

Basically, it defines *Firefox* as the default Web browser, *feh* as the default image viewer, *vim* as the default text editor, *zathura* as the default PDF/Dejavu/eBook reader, *mpv* as the default video/audio player, *pcmanfm* as the default file explorer. There is also a few file associations for some other applications.

## Amfora - Gemini Client
![](https://i.postimg.cc/fTZK7yhS/screenshot-20210718-031.png)

The *Gemini* project is an alternative protocol to *HTTP* and can be used to serve text-only Websites over the Internet. It looks a lot like the *Gopher* protocol but is much newer and has some advantages. *Amfora* is a TUI client for *Gemini* capsules and its config file is located in the *config/amfora/config.toml* folder. The customization is mainly about the rendering, the keybindings and the colors used inside the application.

## Dunst
*Dunst* is a notification system for Linux. It can display desktop notifications and its entire configuration/customization is in the file *config/dunst/dunstrc*. The notification style differs depending on its urgency:

![](https://i.postimg.cc/bY1g2b4j/screenshot-20210718-032.png)

## Terminal Emulators
Configuration files for three terminal emulators are available: *Alacritty*, *Kitty*, and *xTerm*. I don't use the three of them obviously, my daily driver being *ST* as it is fast and minimalist. However, it is not GPU-accelerated unlike *Alacritty* and *Kitty*, so it can give less performance sometimes when rendering a lot of text/colors. GPU-accelerated terminal emulators are based on *OpenGL*: this means that they cannot be used when *OpenGL* libraries are updated and/or if they are missing/buggy. If the GPU is really poor, it can also be worst than anything else. Therefore, I usually use *ST* even though it has no config file in this repository. Finally, *xTerm* is the last resort terminal emulators if all else is not working. *xTerm* is also the default terminal emulator in the failsafe GUI environment (see chapter about *JWM*).

A few comments about each terminal emulators:

* *Alacritty* is rendering fonts differently depending on the screen resolution and the configuration files differ slightly between macOS/Linux. Therefore, multiple *Alacritty* config files are available for my different computers
* *Kitty* works like *Alacritty* but does a much better job at rendering unicode characters: this is the main reason I keep it around. It has much more features that I don't use. It has almost the same configuration as *Alacritty*, no extra plugins/*kittens*. Depending on the machine, it can also give more performance than *Alacritty* and renders ligatures and unicode characters better. Also, I prefer the way fonts are rendered in *Kitty*
* *Simple Terminal (ST)* works well enough and is my default
* *xTerm* is never used, but I have it installed on all my workstations for a failsafe environment. If my WM/DE fails, I can work inside a failsafe GUI and *xTerm* is the default terminal emulator there

I have *ST* installed automatically when deploying my GUI (WM or DE). Useful for VMs mainly and machines where I don't deploy my applications and dotfiles. My built of *ST* can be found [here](https://github.com/GSquad934/st.git).

## Music On Console (MOC)
![](https://i.postimg.cc/KYKrcgtw/screenshot-20210718-033.png)

*Music On Console* is a very simple TUI based music player. I do not use this application that much because most of my music is played bu other devices rather than my computer, but a minimalist music player is still necessary. Its configuration is stored in the *config/moc* folder which contains a *config* file and a custom theme.

## MSMTP
I use this application to send emails from my workstations if necessary. This can be useful for certain cron jobs and/or certain scripts. The config file *config/msmtp/config* defines the mail relay to be used and the credentials for the default account to use as sender. The configuration file is written so the credentials are meant to be decrypted using GPG.

## Newsboat
![](https://i.postimg.cc/qqH9xrkB/screenshot-20210718-038.png)

It is much more efficient to extract useful information from a lot of Websites using the RSS feeds rather than visiting the Website. It is also better for online privacy. My preferred RSS reader is *Newsboat*. Two files are used to configure this application:
* *config/newsboat/config*: this is the configuration file of the application itself. It is used for the customization, keybindings and also how to open certain links in the feeds
* *config/newsboat/urls*: this is the list of all the followed RSS feeds

## PCManFM
This application is a minimalist graphical file manager. I mostly use it to manage MTP devices and network drives. The entire configuration of the application is in the file *config/pcmanfm/default/pcmanfm.conf* and *config/libfm/libfm.conf*. The theme for the application is done via GTK. The configuration is quite standard, it only defines the layout that I prefer for browsing the files.

## Qutebrowser
![](https://i.postimg.cc/DwpPKc41/screenshot-20210718-034.png)

*Qutebrowser* is a very minimalist Web browser made mainly for *VIM* users. The entire Web browsing experience can be performed via keybindings. The configuration file *config/qutebrowser/config.py* cam be fully customized within the Web browser itself. The theme, the keybindings, the Web engine, etc... are defined in this file.

## Redshift
This application is used to adjust the color temperature of the screen according to the sun position. The file *config/redshift/redshift.conf* is adjusting the color temperature as I like it.

## Rofi
![](https://i.postimg.cc/650hMK9j/screenshot-20210718-035.png)

While *DMenu* is a very good application that can be used as a basic launcher menu, I prefer *Rofi* as it provides more option and can also be used as a drop-in replacement of *DMenu*. The file *config/rofi/config.rasi* contains the configuration of *Rofi*. It defines how the content presented by the application is sorted, the fuzzy search and also the theme used by the application.

## Starship Prompt
The *[Starship](https://starship.rs/)* prompt is a cross-shell prompt compatible with *BASH*, *ZSH*, *FISH* and is written in *Rust*. I use this prompt on all my workstations so I can enjoy the same experience everywhere with some nice customization. When the *Starship* prompt is not installed, a more standard but yet customized prompt is also configured for *BASH* and *ZSH*. The following screenshot illustrates the *Starship* prompt vs. my customized *BASH* prompt:

![](https://i.postimg.cc/GmmxNftc/screenshot-20210718-036.png)

As shown by the screenshot, *Starship* shows some nice information about *Git* repositories and certain program versions when a folder contains certain file types. The customization of the prompt is handled by the *config/starship/starship.toml* file.

## Surfraw
I almost never use this application as I have my own script to perform Web search using various search engines. However, *surfraw* can still be useful and was an inspiration to create my own script. The file *config/surfraw/conf* only customizes what Web browser will be used when calling the program.

## Simple X Hotkey Daemon (SXHKD)
I use this application to globally define my keybindings to do... everything. A lot of environment variables are defined in this file as I don't like to hard-code applications, paths, etc... All of these environment variables are configured in the file *shellconfig/common*.

Doing this allows modularity: for example, Mod4+ALT+w opens the Web browser defined by the *$BROWSER* variable. This variable sets *Firefox* as the primary browser, but then several fallbacks such as *Qutebrowser*, *Chromium*, etc...

Two configuration files are present in this repository: one called *sxhkdrc* which contains all the keybindings. The second one is called *sxhkdrc_bspwm* and is solely called when running *BSPWM*.

## TMUX
*TMUX* configuration has changed over the years and multiple config files are available. A single one is present for my workstations and two are aimed for remote SSH connections. The file called *tmux24-server.conf* is meant to be used on servers with *TMUX* v2.9 or higher (earlier versions should use the file called *tmuxpre29-server.conf* for compatibility purposes).

My dotfiles will open *TMUX* automatically unless the window manager is *DWM* or *BSPWM*: I tend to open multiple terminal emulators when using a tiling window manager. This is configured in the file called *shellconfig/common*. On a remote server, *TMUX* is also automatically loaded upon login.

<u>**Note**</u>: even though I also use a tiling window manager in macOS (called *Amethyst*), I still use *TMUX* automatically on my Mac as it is more convenient.

### Screen
A *screenrc* file is present in this repository in case I would not be able to use *TMUX*. It is very simple:

* Add keybinding to kill window with CTRL+k
* Set new windows as logged in automatically (avoid having to login manually)
* Enable SHIFT+PgUP/SHIFT+PgDOWN
* True colors and bold colors are enabled

## Weechat
![](https://i.postimg.cc/9MZdZ58B/screenshot-20210718-037.png)

*Weechat* has a lot of tweaks in its configuration provided in these dotfiles. Some plugins (called scripts) are also deployed but they also lead to potentially two issues:

* Plugins are mainly developed in *Perl*, *Ruby* and *Python*. An error message will appear of one these three dependencies is missing
* It is possible that plugins are outdated on first load: they need to be updated with the following commands:

```
/set script.scripts.download_enabled on
/script update
/script upgrade
```

The scripts download and deployment of the frameworks is never automated, not even by my [bootstrap script](https://github.com/GSquad934/bootstrap.git) The reason for this is simply security.

## X11
The configuration files stored in *config/X11* are meant to be used for graphical environments. Here is the purpose of each file in this folder:

* *xinitrc*: this file is supposed to be located in *$HOME/.xinitrc* and is loaded by *xorg-xinit* when logging in without any display manager. The very first line defines which GUI needs to be loaded and the rest is executing commands automatically to setup the screen layout, keyboard, programs required to start automatically, etc...
* *xprofile*: this file is the equivalent of *xinitrc* but is used by display managers at logon
* *x11dwm*, *x11...*: these files are sourced in the *xinitrc* and *xprofile* files and there is one per supported GUI. The reason for this is to provide modularity and avoid repetitiveness in both *xinitrc* and *xprofile*
* *lightdm*: these are configuration files for *LightDM* display manager when using the GTK greeter. The customization is very light as I do not use any display managers at all (but I offer the option)
* *Xresources*: this file is used to configure the theme of *Xterm* and of *SXIV*

The deployment of the supported GUIs can be automated with my [bootstrap script](https://github.com/GSquad934/bootstrap.git) and the relevant x-file will also be automatically installed and configured.

### Theming
In the *config* folder, there are configuration files for GTK v2/v3 to setup a dark theme. I use *Adwaita-dark* and the mouse cursor is using *Breeze light*. The mouse cursor is defined in the *icons* folder. QT applications can also be dark, but this is not defined in my dotfiles.

#### BSPWM
The folder *config/bspwm* contains the entire configuration for the *BSPWM* window manager. For more details, see the dedicated [README.md](https://github.com/GSquad934/dotfiles/tree/master/config/bspwm#readme).

#### Openbox
The folder *config/openbox* contains the entire configuration for the *Openbox* window manager. For more details, see the dedicated [README.md](https://github.com/GSquad934/dotfiles/tree/master/config/openbox#readme). In addition to this, there are folders for *Tint2* panel and *volumeicon* which themes the volume icon in the systray.

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/gaetanict)
* [Email](mailto:gaetan@ictpourtous.com)
