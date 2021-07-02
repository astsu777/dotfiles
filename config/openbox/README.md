# My Openbox Configuration
![](https://i.postimg.cc/7L6kqvJY/screenshot-20210702-021.png)

This repository hosts the configuration files for [Openbox](http://openbox.org). Three files are necessary to the configuration: *rc.xml* which is the main Openbox config file, *menu.xml* which is the right-click menu and *autostart* which automatically starts certain programs when logging into Openbox. This custom configuration features:

* Status bar with *Tint2* with a built-in system tray
* Script to autostart all the necessary programs such as the composer, etc...
* 4 workspaces
* Right-click automatically generated at login
* Keybindings to tile windows in certain ways

# Dependencies
The following packages are necessary in order to run this build of LeftWM properly:

* openbox
* ttf-jetbrains-mono
* ttf-joypixels
* tint2

The following software are not mandatory but recommended:
* feh (hard-coded in the theme to set a wallpaper)
* dmenu (hard-coded run launcher)
* st (the hard-coded terminal emulator)
* xterm (optional, but it is the default terminal expected by Openbox in case of issues)

*feh*, *st* and *dmenu* are very recommended because those programs are in my Openbox configuration. This can be customized by modifying either the *autostart* file.

If you want a nice DMenu to be integrated, you can install [my custom build](https://github.com/GSquad934/dmenu). You can check out [my build of ST](https://github.com/GSquad934/st) for a nice terminal emulator.

# Installation
Openbox is available in most Linux distribution repositories. It can be installed with the following command depending on your distro:

### Arch Linux
```
pacman -S openbox
```
### Debian/Ubuntu
```
apt install openbox
```
### Fedora/CentOS (EPEL required for CentOS)
```
dnf install openbox
```

Then, you also need the files in this repository to actually configure Openbox and have the theme showcased in the above screenshot. The *tint2rc* configuration file is available in this repository in the */config/tint2* folder and must be present in *$HOME/.config/tint2/tint2rc*.

<u>**Note**</u>: this Openbox installation can be fully automated by using my [bootstrap script](https://github.com/GSquad934/bootstrap).

# Running Openbox
If you don't use a login manager, you can start the graphical environment with the *startx* command (package "*xorg-xinit*" required) and a properly configured *.xinitrc* file. If you want some inspiration for your *.xinitrc*, you can check out [mine](https://github.com/GSquad934/dotfiles/blob/master/config/X11/xinitrc).

If you use a login manager (such as *lightdm*), the Openbox package installation should have already created a *.desktop* file necessary for the login manager. Otherwise, make sure to create a *leftwm.desktop* file in */usr/share/xsessions/*. The file should contain the following:

```
[Desktop Entry]
Name=Openbox
Comment=Log in using the Openbox window manager
Exec=/usr/bin/openbox-session
TryExec=/usr/bin/openbox-session
Icon=openbox
Type=Application
```

# Customization
Graphical tools are available in order to fully customize Openbox. The following tools have been used for this build:

* [menumaker](http://menumaker.sourceforge.net/): dynamically generates the right-click menu
* lxappearance: configures the GTK theme
* [obconf](http://openbox.org/wiki/ObConf:About): configures any settings related to Openbox
* [obkey](https://github.com/nsf/obkey): configures all keybindings of Openbox (available in the AUR)


These software should be available in most Linux distributions' repositories (except for *obkey*).

# Key Bindings
I configured the key bindings that I like. They are all configured in the *rc.xml* file. Here is the full list and what they actually do:

| Key binding | Action |
| :--- | :--- |
| `Super + RETURN` | Open terminal (st is the hard-coded one but it can be modified) |
| `Super + SHIFT + RETURN` | Open run launcher (dmenu is the run launcher but it can be modified) |
| `Super + SHIFT + c` | Close window with focus |
| `Super + SHIFT + q` | Quit Openbox |
| `Super + 1-4` | Switch focus to workspace (1 to 4) |
| `Super + SHIFT + Left/Right` | Send focused window to previous/next workspace |
| `Shift + CONTROL + Left` | Tile focused window to the left of the screen |
| `Shift + CONTROL + Right` | Tile focused window to the right of the screen |
| `Shift + CONTROL + Up` | Tile focused window to the top of the screen |
| `Shift + CONTROL + Down` | Tile focused window to the bottom of the screen |
| `Super + CONTROL + Up` | Maximize focused window |
| `Super + CONTROL + Down` | Unmaximize focused window |
| `Super + SHIFT + F` | Maximise focused window and remove its decoration |
| `CONTROL + SHIFT + F` | Unmaximize focused window and decore it |
| `ALT + Space` | Open window's contextual menu |
| `ALT + Tab` | Cycle between opened windows |
| `Super + Alt + l` | Lock screen |

<u>**Note**</u>: the key bindings in this configuration are a bit limited because I actually use *SXHKD* to run all my applications. My configuration for *SXHKD* can be found in [my dotfiles](https://github.com/GSquad934/dotfiles/blob/master/config/sxhkd/sxhkdrc). My configuration file for *SXHKD* is totally based on my personal dotfiles, so you will need to modify either the key bindings of LeftWM or have a custom *sxhkdrc* ready.

# Status Bar
In this Openbox configuration, [Tint2](https://gitlab.com/o9000/tint2) has been configured to act as the status bar. It is configured to display:

* Opened windows on the left side
* Battery charge (if applicable)
* Time & date on the right side
* A system tray on the far right

# Wallpapers
*Feh* is used to setup the wallpaper. A default wallpaper (file: *background.jpg*) is supplied with this configuration of Openbox. *Feh* is executed by the *autostart* file to set the default wallpaper. In order to setup a custom wallpaper, it is possible to either replace the *background.jpg* file or to modify the execution of *feh* in the *autostart* file with something like the following:

```
feh --bg-fill --no-fehbg --randomize "$HOME"/.local/share/wallpapers*
```

This command would look for wallpapers in the defined folder and randomly assign one as the wallpaper. If you want a set of nice wallpapers, I have some stored in this [repository](https://github.com/GSquad934/wallpapers).

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/gaetanict)
* [Email](mailto:gaetan@ictpourtous.com)
