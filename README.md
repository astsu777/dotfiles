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
git clone --depth 1 https://github.com/astsu777/dotfiles.git "$HOME"/.dotfiles
```

It is necessary to modify either the *.bashrc* or the *.zshrc* file and change the following variables according to your needs:
* **DOTFILES**: defines the default location of the dotfiles ($HOME/.dotfiles).
* **SCRIPTS**: defines the default location of the custom scripts ($HOME/.local/bin)
* **SOURCES**: defines the default location of source files ($HOME/.sources)
* **REPOS**: defines the default location of git repositories ($HOME/.sources/repos)

The installation can be automated when using my [bootstrap script](https://github.com/astsu777/bootstrap.git). This script is modular so it is possible to only deploy the dotfiles and nothing else.
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
The folder *shellconfig* contains all the config files used to customize my shell and my command prompt. It is modular: this means that both *BASH* and *ZSH* configurations are split between different files so it is common in both shells. I use *ZSH* on my workstations and *BASH* on all my servers and sometimes workstations: both are using the same dotfiles.

The logic of every file is the following:

* *bashrc*/*zshrc*: the configuration file of both *BASH* and *ZSH* respectively
* *inputrc*: customization for *BASH*
* *zshenv*: file necessary to load my *.zshrc* because it is not located in my *$HOME* folder
* *common*: settings that are common to both shells (environment variables, some settings, etc...)
* *functions*: all functions are defined here. I wanted them to be separated from aliases
* *apps_aliases*: contains all aliases for external applications (not built-in to the shell AND not drop-in replacements for important commands such as *ls* for example)
* *basecmds_aliases*: contains aliases that replace certain basic commands such as *cat* replaced by *highlight* for example
* *enhancements_aliases*: alias basic commands such as *ls* and automatically add some parameters such as auto-color
* *files_aliases*: if *FZF* is not installed on the system, it makes aliases for most configuration files to quickly edit them

<u>**Note**</u>: all the files contain a lot of checks/tests to not deploy useless aliases/functions that won't work on the system. For example, if an application is not installed and some aliases are defined for it, these aliases will not be set at all.

### Quick Discharge
Sometimes, it can be useful to drop all the customization and have a plain vanilla *BASH*/*ZSH* environment. In order to do this, it is pretty simple:

* *BASH*: type *bbash* and a new shell will be opened without any configuration whatsoever
* *ZSH*: type *zzsh* and a new shell will be opened without any configuration whatsoever

The same is available for other applications. For example, *VIM*/*Neovim* can be launched with the alias *vvim* and no configuration will be loaded.

## VIM/Neovim
![](https://i.postimg.cc/bvK0ZNTJ/screenshot-20210718-029.png)

In this repository, the *vim* folder contains all the necessary configuration files for *VIM*. However, I use *Neovim* as my text editor (mostly for new window stuff) but don't have a specific config file for it: the *~/.config/nvim/init.vim"* is actually a symlink to the *.vimrc*. When deploying my dotfiles, simply symlink the *vim* folder to *~/.config/nvim* and it will work.

Because the *VIM* configuration is quite light, it is fully compatible with *Neovim*. There is no *Neovim* specific setting present. The colorscheme used by default is called *[kuroi](https://github.com/aonemd/kuroi.vim)* and is made by *Aonemd*. I simply disabled the background to use the one set by the terminal emulator (usually a little bit transparent and dark). Other color schemes are installed and custom keybindings can be used to toggle between them.

A folder called *ftplugin* contain specific configuration for various file types.

The following keybindings are configured:

* **LEADER** has been configured to be **,** (=comma)

| Key Binding | Mode | Action |
| :--- | :--- | :--- |
| `LEADER + r` | NORMAL | reload VIM/Neovim configuration |
| `LEADER + +` | NORMAL | increase size of split |
| `LEADER + -` | NORMAL | decrease size of split |
| `LEADER + -` | NORMAL | reset size of split |
| `CTRL + h` | NORMAL | navigate to the window on the left |
| `CTRL + j` | NORMAL | navigate to the window on the bottom |
| `CTRL + k` | NORMAL | navigate to the window on the top |
| `CTRL + l` | NORMAL | navigate to the window on the right |
| `LEADER + y` | NORMAL | copy to the system clipboard |
| `LEADER + p` | NORMAL | paste from the system clipboard |
| `K` | NORMAL | navigate down 10 lines |
| `L` | NORMAL | navigate up 10 lines |
| `LEADER + o` | NORMAL | toggle spell check in English (US) |
| `LEADER + o + f` | NORMAL | toggle spell check in French (FR) |
| `LEADER + h` | NORMAL | type command to open a horizontal split |
| `LEADER + v` | NORMAL | type command to open a vertical split |
| `LEADER + F1` | NORMAL | toggle through the color schemes (all plugins except the custom default one) |
| `LEADER + F2` | NORMAL | toggle syntax highlighting (enabled by default) |
| `LEADER + n` | NORMAL | toggle Nerd Tree (plugin: nerdtree) |
| `LEADER + s` | NORMAL | check the file with Shellcheck |
| `LEADER + f` | NORMAL | enable Goyo (distraction-free typing) |
| `LEADER + f + f` | NORMAL | disable Goyo (distraction-free typing) |
| `LEADER + t + c` | NORMAL | toggle color code highlighting |
| `LEADER + SHIFT + f` | NORMAL | search files (plugin: fzf) |
| `LEADER + SHIFT + r` | NORMAL | search files' content (plugin: fzf) |
| `LEADER + SHIFT + o` | NORMAL | search available buffers (plugin: fzf) |
| `w + ! + !` | COMMAND | write the file using sudo |
| `LEADER + h` | NORMAL | toggle the status bar |
| `LEADER + SHIFT + c` | NORMAL | enable auto-commenting on new lines |
| `LEADER + SHIFT + c + d` | NORMAL | disable auto-commenting on new lines |
| `LEADER + Space` | NORMAL | jump to <++> marker and enter insert mode |
| `LEADER + Space` | VISUAL | jump to <++> marker and enter insert mode |
| `LEADER + LEADER + Space` | INSERT | jump to the next <++> marker |
| `; + l + o` | INSERT | insert *Lorem ipsum* paragraph |
| `; + b + l` | INSERT | insert comment block (may vary depending on file type) |
| `; + h + h` | INSERT | insert custom header (may vary depending on file type) |
| `LEADER + c` | NORMAL | process current file with a script called *compiler* (mainly for LaTeX) |
| `LEADER + SHIFT + p` | NORMAL | open preview of the compiled version of the current file |
| `g + c + <MOTION>` | VISUAL | (un)comment some text using a motion such as *gcap* to comment a whole paragraph (plugin: vim-commentary) |
| `c + s + <CURR_SURROUND> + <NEW_SURROUND>` | NORMAL | modify the surrounding quotes/parenthesies/etc... (plugin: vim-surround) |
| `d + s + <CURR_SURROUND>` | NORMAL | delete the surrounding quotes/parenthesies/etc... (plugin: vim-surround) |
| `y + s + <MOTION> + <NEW_SURROUND>` | NORMAL | surround text with quotes/parenthesies/etc... Use *yss* for the whole line, *ysiw* for a word, etc... (plugin: vim-surround) |
| `S + <NEW_SURROUNDINGS>` | VISUAL | surround paragraph with specified surroundings above and below the selected text (plugin: vim-surround) |
| `LEADER + r + r` | NORMAL | bulk rename files in the current directory (plugin: vim-renamer) |
| `LEADER + q` | NORMAL | toggle the quickfix window |

Additional keybindings are configured per filetype. All of them are described in the *ftplugin* folder. Most keybindings are for code snippets though and/or shortcuts while writing certain file types.

Finally, some keybindings are also provided by the installed plugins. All the useful ones are described in the above table.

# Documentation - Local Folder
## Music On Console (MOC)
*Music On Console* is a lightweight music player running in the terminal. This repository hosts its configuration file and a theme file for the the colorscheme.

## Resources
The folder *local/share* contains resources that can be useful for either other programs or for the user.

### Scripts
Custom scripts are present in the folder *local/bin* for various things. This folder is present in the *$PATH* and all scripts can be called at any time. Some are meant to be called by other programs instead. For example, the folder *cron* contains scripts that can be used as cron jobs.

The following table provides a description of all the scripts:

| Script | Description |
| :--- | :--- |
| `android-webcam` | use an Android smartphone connected via USB as a webcam |
| `block-hosts` | implement various block-lists to the hosts file |
| `check-rep` | check a FQDN/IP/CVE/Hash against several search engines |
| `clear-dns-cache` | clear the local DNS cache if any is detected |
| `compiler` | compile a document to another format (mainly used for LaTeX) |
| `crontoggle` | enable/disable the cron jobs |
| `devour` | launch a new program and hide the current window (useful to hide terminal emulator) |
| `dhcp-server` | launch a local DHCP server |
| `displayselect` | quickly configure screen layout, mirroring, etc... |
| `dmenu-bookmarks` | display Web bookmarks in DMenu/FZF and open one in the default Web browser |
| `dmenu-mount` | mount connected USB devices using DMenu |
| `dmenu-nordvpn` | manage NordVPN using DMenu |
| `dmenu-pass` | use the *pass* password manager via DMenu |
| `dmenu-radio` | listen to Web radios via DMenu/FZF |
| `dmenu-record` | record the current screen, audio and/or the webcam via DMenu |
| `dmenu-run` | run prompt using DMenu with caching (remembers if TUI/GUI programs) |
| `dmenu-screenshot` | take a screenshot via DMenu |
| `dmenu-shutdown` | logout/suspend/hibernate/shutdown the computer via DMenu |
| `dmenu-stream` | check online streams and watch one via DMenu/FZF |
| `dmenu-system` | general menu with various options to manage the system via DMenu |
| `dmenu-theme` | change the overall WM/terminal emulator/VIM theme via DMenu |
| `dmenu-umount` | unmount connected USB devices using DMenu |
| `dmenu-unicode` | display all unicode and free font-awesome characters via DMenu and insert ehem anywhere |
| `dmenu-urimount` | mount a network share via DMenu |
| `dmenu-video` | watch/listen/download a local/online video via DMenu/FZF |
| `dmenu-websearch` | search online using various search engines via DMenu/FZF |
| `dmenu-wm` | list all opened windows and focus on one (like ALT-Tab on Windows) via DMenu |
| `docker-lab` | quickly spawn one or multiple CentOS/Debian containers for test purposes |
| `git_all_pull` | find all GIT repositories recursively and pull from them |
| `handler` | general file/URL mapper |
| `kbdbacklight` | adjust the keyboard backlight easily |
| `lsw` | list opened windows |
| `notification-log` | log all desktop notifications to console or to a file |
| `notifytoggle` | enable/disable a do-not-disturb mode (notifications are hidden) |
| `opout` | open a preview of certain file (most useful when called from Neovim/VIM) |
| `ssh-multi` | connect to one or multiple SSH servers in a *TMUX* window and sync input on all panes |
| `sxiview` | when opening a single image with *SXIV*, automatically expand to all other images in the same folder |
| `texclear` | clean all the build files generated by LaTeX |
| `tftp-server` | launch a local TFTP server |
| `tspool` | interact with task-spooler using either the *ts* or *tsp* command (or none if *task-spooler* is not installed) |
| `tui` | open a terminal emulator and execute a specific command (Ex.: 'tui htop' from DMenu) |
| `upcloud-manager` | easily interact with *Upcloud* API |
| `url_handler.sh` | file handler by file extensions of MIME types |
| `vttoggle` | toggle the ability to switch to other Virtual Terminals using CTRL-ALT-Fx |
| `websites-monitor` | quickly test many websites and test for error codes |
| `yt-archive` | easily download YouTube channels/playlists/videos with caching (backend: yt-dlp) |

<u>**Note**</u>: a symlink called *url_handler.sh* is referencing *handler* because this name is hardcoded in the program *Urlview*.

# Documentation - Config Folder
## Default Applications (xdg-open)
All default applications for the main things I use have been defined in the file *config/mimeapps.list*. To be properly installed, this file should be present in both *$XDG_CONFIG_HOME* and *$HOME/.local/share/applications*. This file is used when a file is trying to be opened with *xdg-open*. Although it is present in this repository, it can easily be overwritten by any default application manager.

Basically, it defines *Firefox* as the default Web browser, *feh* as the default image viewer, *vim* as the default text editor, *zathura* as the default PDF/Dejavu/eBook reader, *mpv* as the default video/audio player, *pcmanfm* as the default file explorer. There is also a few file associations for some other applications.

## Amfora - Gemini Client
![](https://i.postimg.cc/fTZK7yhS/screenshot-20210718-031.png)

The *Gemini* project is an alternative protocol to *HTTP* and can be used to serve text-only Websites over the Internet. It looks a lot like the *Gopher* protocol but is much newer and has some advantages. *Amfora* is a TUI client for *Gemini* capsules and its config file is located in the *config/amfora/config.toml* folder. The customization is mainly about the rendering, the keybindings and the colors used inside the application.

## Clight
*Clight* is an application used to interact with the automatic light sensor/webcam to automatically adjust screen backlight of any laptop. The configuration file is *config/clight/clight.conf*

## Dunst
*Dunst* is a notification system for Linux. It can display desktop notifications and its entire configuration/customization is in the file *config/dunst/dunstrc*. The notification style differs depending on its urgency:

![](https://i.postimg.cc/bY1g2b4j/screenshot-20210718-032.png)

## EasyEffects
*EasyEffects* is an application used to add post-processing effect to audio when using *Pipewire* (input & output). The files in the *config/easyeffects* folders/sub-folders contain presets to adjust audio.

If you use a hardware audio processing unit, it is not advised to also use software to do this.

**Note**: the settings are not automatically loaded. This needs to be configured in the application itself.

## HTOP
![](https://i.postimg.cc/jdtxmyf9/screenshot-20210925-050.jpg)

*Htop* is a TUI application to monitor the system in real-time. It can easily be customized through the *config/htop/htoprc* file. Most of the customization performed has everything to do with the layout:

* A customized two columns layout at the top
* Additional information such as system details (kernel,hostname,uptime), *systemd*/*SELinux* status, CPU temperatures and frequency, etc...
* All processes are sorted in a tree view, but it is collapsed by default (toggle with the asterisk and dash keys)
* Kernel and userland process threads are hidden
* The *basename* of a program is highlighted in bold in the process list
* New and old processes are highlighted for 5 seconds

Since macOS v12 released, *htop* columns slightly changed and customization now requires separare configuration files.

## Terminal Emulators
Configuration files for three terminal emulators are available: *Alacritty*, *Kitty*, and *xTerm*. I don't use the three of them obviously, my daily driver being *Alacritty* as it is fast, minimalist and is GPU-accelerated (like *Kitty*). *ST* and *xTerm* are not GPU-accelerated unlike *Alacritty* and *Kitty*, so they can give less performance sometimes when rendering a lot of text/colors. GPU-accelerated terminal emulators are based on *OpenGL*: this means that they cannot be used when *OpenGL* libraries are updated and/or if they are missing/buggy. If the GPU is really poor, it can also be worst than anything else. In such a case, I usually use *ST* even though it has no config file in this repository. Finally, *xTerm* is the last resort terminal emulators if all else is not working. *xTerm* is also the default terminal emulator in the failsafe GUI environment (see chapter about *JWM*).

A few comments about each terminal emulators:

* *Alacritty* is rendering fonts differently depending on the screen resolution and the configuration files differ slightly between macOS/Linux and also depending on the monitor. Therefore, one config file per machine may be created
* *Kitty* works like *Alacritty* but does a much better job at rendering unicode characters: this is the main reason I keep it around. It has much more features that I don't use. It has almost the same configuration as *Alacritty*, no extra plugins/*kittens*. Depending on the machine, it can also give more performance than *Alacritty* and renders ligatures and unicode characters better. Also, I prefer the way fonts are rendered in *Kitty*
* *Simple Terminal (ST)* works well enough and is my default if the GPU-accelerated terminal does not perform well enough
* *xTerm* is never used, but I have it installed on all my workstations for a failsafe environment. If my WM/DE fails, I can work inside a failsafe GUI and *xTerm* is the default terminal emulator there

I have *ST* installed automatically when deploying my GUI (WM or DE). Useful for VMs mainly and machines where I don't deploy my applications and dotfiles. My built of *ST* can be found [here](https://github.com/astsu777/st.git).

<u>**Note**</u>: every terminal emulator has its own set of keybindings. None of them are described here as I do not use them very often. Classic shortcuts such as CTRL+SHIFT+c (copy) and CTRL+SHIFT+v (paste) work as intended.

## MSMTP
I use this application to send emails from my workstations if necessary. This can be useful for certain cron jobs and/or certain scripts. The config file *config/msmtp/config* defines the mail relay to be used and the credentials for the default account to use as sender. The configuration file is written so the credentials are meant to be decrypted using GPG.

## Newsboat
![](https://i.postimg.cc/qqH9xrkB/screenshot-20210718-038.png)

It is much more efficient to extract useful information from a lot of Websites using the RSS feeds rather than visiting the Website. It is also better for online privacy. My preferred RSS reader is *Newsboat*. Two files are used to configure this application:
* *config/newsboat/config*: this is the configuration file of the application itself. It is used for the customization, keybindings and also how to open certain links in the feeds
* *config/newsboat/urls*: this is the list of all the followed RSS feeds

Custom keybindings are defined on the *config* file. Here is the list:

* **MACRO** has been defined as ',' (=comma)

| Key Binding | Action |
| :--- | :--- |
| `j/k` | go down/up |
| `J/K` | go to previous/next feed |
| `g/G` | go to the top/bottom |
| `l` | open a feed/article |
| `h` | quit a feed/article |
| `a` | mark article as read |
| `e` | enqueue podcast for download |
| `n/N` | next/previous unread article |
| `U` | show URLs in an article |
| `MACRO + ,` OR `o` | open article in the default Web browser |
| `MACRO + t` | open article in the TUI Web browser |
| `MACRO + m` | download video from the article |
| `MACRO + v` | watch video from the article using *MPV* |

*Newsboat* comes with another program called *Podboat*. This is a companion application to download and listen to podcasts. When some podcasts are enqueued for download, *Podboat* can be used to download and listen to the podcasts. The keybindings for *Podboat* are all described in the program's status bar.

## PCManFM
![](https://i.postimg.cc/j5MNbWyk/screenshot-20210914-046.jpg)

This application is a minimalist graphical file manager. I mostly use it to manage MTP devices and network drives. The entire configuration of the application is in the file *config/pcmanfm/default/pcmanfm.conf* and *config/libfm/libfm.conf*. The theme for the application is done via GTK. The configuration is quite standard, it only defines the layout that I prefer for browsing the files.

## Picom
A compositor is not a necessary program, but recommended to help with tearing on the screen. It also can provide nice graphic effects such as fading, transparency to windows, shadows, etc... There are many available, but the recommended one is the standard version of *Picom*. A custom configuration file (*config/picom/picom.conf*) contains custom settings for the compositor.

In this repository, the configuration file disables shadows, fading animations and blur. It also disables all sorts of transparency for all window types. I only like my terminal emulators to be somewhat transparent, but I am managing this via the terminal emulator's settings.

However, the configuration file contains all the necessary settings to easily enable any kind of graphic effects. For example, an opacity rule exists for *XTerm* so this particular program is somewhat transparent (disabled by default), although *XTerm* does not support transparency by itself.

## Qutebrowser
![](https://i.postimg.cc/DwpPKc41/screenshot-20210718-034.png)

*Qutebrowser* is a very minimalist Web browser made mainly for *VIM* users. The entire Web browsing experience can be performed via keybindings. The configuration file *config/qutebrowser/config.py* can be fully customized within the Web browser itself. The theme, the keybindings, the Web engine, etc... are defined in this file.

The configuration file contains adblock lists and also custom keybindings to execute external programs (Ex.: watch a video in MPV, toggle dark mode, etc...).

| Key Binding | Action |
| :--- | :--- |
| `h/j/k/l` | navigate left/up/down/right on the page |
| `H/L` | go to previous/next page |
| `r/R/F5` | reload the page |
| `/` | search text on the page |
| `x + v` | hint links and queue to *MPV* for playing |
| `x + SHIFT + v` | hint links and queue to *MPV* for listening |
| `x + d` | hint links and queue to download |
| `x + SHIFT + d` | hint links and queue to download audio only |
| `x + j` | toggle javascript and reload the page |
| `x + i` | toggle images and reload the page |
| `x + c` | toggle content blocking (adblock) and reload the page |
| `x + SHIFT + c` | toggle dark mode using custom CSS |
| `x + g` | edit current URL |
| `x + SHIFT + g` | edit current URL to open in a new tab |
| `w + SHIFT + o` | edit current URL to open in a new window |
| `x + b` | toggle the status bar |
| `x + SHIFT + b` | toggle the tabs bar |
| `x + y` | hint links and copy it to clipboard |

## Redshift
This application is used to adjust the color temperature of the screen according to the sun position. The file *config/redshift/redshift.conf* is adjusting the color temperature as I like it.

## Rofi
![](https://i.postimg.cc/650hMK9j/screenshot-20210718-035.png)

While *DMenu* is a very good application that can be used as a basic launcher menu, I prefer *Rofi* as it provides more option and can also be used as a drop-in replacement of *DMenu*. The file *config/rofi/config.rasi* contains the configuration of *Rofi*. It defines how the content presented by the application is sorted, the fuzzy search and also the theme used by the application. The other files are just themes called by the configuration file.

## Starship Prompt
The *[Starship](https://starship.rs/)* prompt is a cross-shell prompt compatible with *BASH*, *ZSH*, *FISH* and is written in *Rust*. I use this prompt on all my workstations so I can enjoy the same experience everywhere with some nice customization. When the *Starship* prompt is not installed, a more standard but yet customized prompt is also configured for *BASH* and *ZSH*. The following screenshot illustrates the *Starship* prompt vs. my customized *BASH* prompt:

![](https://i.postimg.cc/GmmxNftc/screenshot-20210718-036.png)

As shown by the screenshot, *Starship* shows some nice information about *Git* repositories and certain program versions when a folder contains certain file types. The customization of the prompt is handled by the *config/starship/starship.toml* file.

## Surfraw
I almost never use this application as I have my own script to perform Web search using various search engines. However, *surfraw* can still be useful and was an inspiration to create my own script. The file *config/surfraw/conf* only customizes what Web browser will be used when calling the program.

## Simple X Hotkey Daemon (SXHKD)
I use this application to globally define my keybindings to do... everything. A lot of environment variables are defined in this file as I don't like to hard-code applications, paths, etc... All of these environment variables are configured in the file *shellconfig/common*.

Doing this allows modularity: for example, a shortcut opens the Web browser defined by the *$BROWSER* variable. This variable sets *Brave* as the primary browser, but then several fallbacks such as *Brave*, *Google Chrome*, etc... A default fallback option is also hard-coded in case the variable does not exit.

Two configuration files are present in this repository: one called *sxhkdrc* which contains all the keybindings. The second one is called *sxhkdrc_bspwm* and is solely called when running *BSPWM*.

The following table provides all the configured keybindings **except** for the *BSPWM* one (see chapter about *BSPWM* for more details):

* Keybindings containing a combinationand a *&* character means a key chord.

| Key Binding | Action |
| :--- | :--- |
| `Volume Down (media key)` | decrease the volume level by 2% |
| `Volume Up (media key)` | increase the volume level by 2% |
| `Volume Mute (media key)` | mute the audio |
| `Play (media key)` | play the audio (using *playerctl*) |
| `Stop (media key)` | stop the audio (using *playerctl*) |
| `Previous (media key)` | play the previous audio (using *playerctl*) |
| `Next (media key)` | play the next audio (using *playerctl*) |
| `Calculator (media key)` | launch the calculator (variable: $CALCULATOR) |
| `ALT + Tab` | list opened windows in DMenu and focus the selected one (script: dmenu-wm) |
| `SUPER + Return` | launch a terminal emulator (variable: $TERMINAL) |
| `SUPER + Mute (media key)` | kill all multimedia player |
| `SUPER + F1` | display a system documentation with all the keybindings |
| `SUPER + F11` | launch a general system menu with various choices (script: dmenu-system) |
| `SUPER + Insert` | toggle the Xorg compositor (*picom*) |
| `SUPER + SHIFT + Escape` | open a menu to logout/suspend/hibernate/shutdown the computer (script: dmenu-shutdown) |
| `SUPER + SHIFT + Return` | open a run launcher (variable: $LMENU) |
| `SUPER + ALT + 5` | take a screenshot of a region (variable: $SCROTBIN) |
| `SUPER + ALT + b` | copy selected bookmark to the clipboard (script: dmenu-bookmarks) |
| `SUPER + ALT + SHIFT + b` | open selected bookmark in the default Web browser (script: dmenu-bookmarks) |
| `SUPER + ALT + c` | show the clipboard manager using *clipmenu* |
| `SUPER + ALT + e` | open the default TUI text editor (variable: $EDITOR) |
| `SUPER + ALT + f` | open the default TUI file manager (variable: $FILEMANAGER) |
| `SUPER + ALT + SHIFT + f` | open the default GUI file manager (variable: $GUIFILEMANAGER). If not set, then open poor file manager using DMenu |
| `SUPER + ALT + h` | launch a TUI system monitor (variable: $SYSMONITOR) |
| `SUPER + ALT + i` | launch an IRC client (variable: $IRCCLIENT) |
| `SUPER + ALT + k` | launch and enable *screenkey* to display key strokes |
| `SUPER + ALT + SHIFT + k` | kill *screenkey* |
| `SUPER + ALT + l` | lock the computer using *slock* |
| `SUPER + ALT + m` | launch the mail client (variable: $MAILER) |
| `SUPER + ALT + SHIFT + m` | launch the music player (variable: $MUSICPLAYER) |
| `SUPER + ALT + n` | launch the TUI RSS reader (variable: $RSSREADER) |
| `SUPER + ALT + p` | launch the password manager (variable: $PASSWORDMGR) |
| `SUPER + ALT + SHIFT + p` | launch *pass* to quickly copy passwords (script: dmenu-pass) |
| `SUPER + ALT + r` | show a menu to listen to Web radios (script: dmenu-radio) |
| `SUPER + ALT + SHIFT + r` | launch the TUI Reddit client (variable: $REDDITCLI) |
| `SUPER + ALT + s` | open a menu to search online (script: dmenu-websearch) |
| `SUPER + ALT + t` | launch a SMS application (variable: $SMSMGR) |
| `SUPER + ALT + SHIFT + t` | launch a direct messaging application (variable: $CHATTER) |
| `SUPER + ALT + u` | open a menu with all emojis and insert them anywhere (script: dmenu-unicode) |
| `SUPER + ALT + SHIFT + u` | open a menu with all emojis and it to the clipboard (script: dmenu-unicode) |
| `SUPER + ALT + v` | open a menu to watch/listen/download a video (script: dmenu-video) |
| `SUPER + ALT + SHIFT + v` | check online streams and open a menu to watch/listen/download them (script: dmenu-stream) |
| `SUPER + ALT + w` | launch the Web browser (variable: $BROWSER) |
| `SUPER + ALT + SHIFT + w` | launch the TUI Web browser (variable: $BROWSERCLI) |
| `SUPER + ALT + y` | launch *YTFZF* and display all subscriptions |
| `SUPER + ALT + SHIFT + y` | launch *YTFZF* and prompt to search YouTube |
| `SUPER + r & d` | open a menu to mount USB devices (script: dmenu-mount) |
| `SUPER + r & SHIFT + d` | open a menu to unmount USB devices (script: dmenu-umount) |
| `SUPER + r & m` | launch the audio mixer (variable: $AUDIOMIXER) |
| `SUPER + r & s` | kill all multimedia player (useful if no media keys) |
| `SUPER + r & w` | set a random wallpaper from *"$HOME"/.local/share/wallpapers* using *feh* |
| `SUPER + r & SHIFT + w` | open a grid view of all the wallpapers stored in *"$HOME"/.local/share/wallpapers* using *sxiv* |
| `SUPER + r & r & s` | refresh the *SXHKD* configuration |

## TMUX
*TMUX* configuration has changed over the years and multiple config files are available. A single one is present for my workstations and two are aimed for remote SSH connections. The file called *tmux24-server.conf* is meant to be used on servers with *TMUX* v2.9 or higher (earlier versions should use the file called *tmuxpre29-server.conf* for compatibility purposes).

My dotfiles will open *TMUX* automatically unless the window manager is *DWM*, *BSPWM* or *i3*: I tend to open multiple terminal emulators when using a tiling window manager. This is configured in the file called *shellconfig/common*. On a remote server, *TMUX* is also automatically loaded upon login.
The look & feel differs between the workstation and the server configuration. The prefix keybinding too differs: CTRL+A for the workstation, CTRL+B for the server. Several themes are available as well.

<u>**Note**</u>: even though I also use a tiling window manager in macOS (called *Amethyst*), I still use *TMUX* automatically on my Mac as it is more convenient.

### Screen
A *screenrc* file is present in this repository in case I would not be able to use *TMUX*. It is very simple:

* Add keybinding to kill window with CTRL+k
* Set new windows as logged in automatically (avoid having to login manually)
* Enable SHIFT+PgUP/SHIFT+PgDOWN
* True colors and bold colors are enabled

## SXIV
It is a very simple image viewer, and quite minimalist. However, a custom script (=*.config/sxiv/exec/key-handler*) can be used to implement custom functions and call external programs. Therefore, several keybindings are defined to perform various actions:

* For any of the keybinding to work, the prefix **CTRL+x** must be pressed first!

| Key Binding | Action |
| :--- | :--- |
| `PREFIX & y` | copy the current image to the clipboard |
| `PREFIX & d` | delete the current image |
| `PREFIX & SHIFT + d` | delete the current image without prompt |
| `PREFIX & i` | display current image media information |
| `PREFIX & r` | rotate the current image 90 degrees permanently |
| `PREFIX & SHIFT + r` | rotate the current image -90 degrees permanently |
| `PREFIX & m` | mirror the current image permanently |
| `PREFIX & e` | open the current image in *GIMP* |
| `PREFIX & w` | set the current image as the wallpaper |
| `PREFIX & SHIFT + w` | copy the current image to the wallpapers collection |

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

The scripts download and deployment of the frameworks is never automated, not even by my [bootstrap script](https://github.com/astsu777/bootstrap.git) The reason for this is simply security.

## X11
The configuration files stored in *config/X11* are meant to be used for graphical environments. Here is the purpose of each file in this folder:

* *xinitrc*: this file is supposed to be located in *$HOME/.xinitrc* and is loaded by *xorg-xinit* when logging in without any display manager. The very first line defines which GUI needs to be loaded and the rest is executing commands automatically to setup the screen layout, keyboard, programs required to start automatically, etc...
* *xprofile*: this file is the equivalent of *xinitrc* but is used by display managers at logon
* *x11dwm*, *x11...*: these files are sourced in the *xinitrc* and *xprofile* files and there is one per supported GUI. The reason for this is to provide modularity and avoid repetitiveness in both *xinitrc* and *xprofile*
* *lightdm*: these are configuration files for *LightDM* display manager when using the Slick greeter
* *Xresources*: this file is used to configure the theme of *Xterm* and of *SXIV*

The deployment of the supported GUIs can be automated with my [bootstrap script](https://github.com/astsu777/bootstrap.git) and the relevant x-file will also be automatically installed and configured.

### Theming
In the *config* folder, there are configuration files for GTK v2/v3 to setup a dark theme. I use *Adwaita-dark* and the mouse cursor is using *Breeze light*. The mouse cursor is defined in the *icons* folder. QT applications can also be dark, but this is not defined in my dotfiles.

#### BSPWM
The folder *config/bspwm* contains the entire configuration for the *BSPWM* window manager. For more details, see the dedicated [README.md](https://github.com/astsu777/dotfiles/tree/master/config/bspwm#readme).

#### i3
The folder *config/i3* contains the entire configuration for the *i3-gaps* window manager. For more details, see the dedicated [README.md](https://github.com/astsu777/dotfiles/tree/master/config/i3#readme).

#### Openbox
The folder *config/openbox* contains the entire configuration for the *Openbox* window manager. For more details, see the dedicated [README.md](https://github.com/astsu777/dotfiles/tree/master/config/openbox#readme). In addition to this, there are folders for *Tint2* panel and *volumeicon* which themes the volume icon in the systray.

#### SpectrWM
The folder *config/spectrwm* contains the entire configuration for the *SpectrWM* window manager. For more details, see the dedicated [README.md](https://github.com/astsu777/dotfiles/tree/master/config/spectrwm#readme).

## Zathura
This program is used to display PDFs, eBooks, etc... It is very minimalist and can be customized via a configuration file (=*.config/zathura/zathurarc*). The configuration file sets the following:

* Get rid of any GUI distractions such as bars, etc...
* Remove any horizontal/vertical padding
* All selected text will be copied to the system clipboard
* Monitor opened file and refresh it automatically

In addition to the above, some custom keybindings are defined:

| Key Binding | Action |
| :--- | :--- |
| `u/d` | scroll half a page up/down |
| `D` | toggle page mode (dual/single) |
| `s` | fit zoom to window width |
| `a` | fit zoom to 100% |
| `F` | hint links |
| `/` | search for text (VIM like) |
| `r` | reload the document |
| `R` | rotate the document 90 degrees (only in preview) |
| `K/J` | zoom in/out |
| `i` | invert the color (dark mode) |
| `b` | toggle the status bar |
| `F5` | switch to presentation mode (toggle) |
| `F11` | switch to fullscreen mode (toggle) |

Most VIM keybindings can be used within *Zathura* too: navigation with h/j/k/l, marks (=m), etc...

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/astsu777)
* [Email](mailto:gaetan@ictpourtous.com)
