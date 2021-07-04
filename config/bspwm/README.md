# My BSPWM Configuration
![](https://i.postimg.cc/QtKf92Lc/screenshot-20210704-026.png)

This repository hosts the configuration files for [BSPWM](https://github.com/baskerville/bspwm). A single file is necessary to the configuration: *bspwmrc*. However, this window manager does not hadle keybindings by itself as windows are managed by a program called *bspc*. Its author created a tool called *SXHKD* that can be used to manage keybindings. This repository of dotfiles includes a configuration of *SXHKD* using */config/sxhkd/sxhkdrc* as a configuration file. These two programs combined provide the following features:

* Script to autostart all the necessary programs such as the composer, etc... via the *bspwmrc* file
* 9 workspaces (requires configuration)
* Automatic tiling and full control with keybindings
* A single file to manage all keybindings to manage windows, launch applications, etc... via the *sxhkdrc* file
* Status bar with custom scripts to display various information

# Dependencies
The following packages are necessary in order to run BSPWM properly:

* bspwm
* sxhkd

The following software are not mandatory but recommended:
* feh (hard-coded in *bspwmrc* to set a wallpaper)
* dmenu (hard-coded run launcher in *sxhkdrc*)
* st (the hard-coded terminal emulator in *sxhkdrc*)
* polybar (if you want a status bar)

*feh*, *st* and *dmenu* are very recommended because those programs are in my BSPWM configuration. This can be customized by modifying the *sxhkdrc* file.

If you want a nice DMenu to be integrated, you can install [my custom build](https://github.com/GSquad934/dmenu). You can check out [my build of ST](https://github.com/GSquad934/st) for a nice terminal emulator.

It is possible to use BSPWM without any status bar as it does not come with one. However, *Polybar* has been configured as illustrated by the above screenshot and can be installed to have a nice status bar.

# Installation
BSPWM is available in most Linux distribution repositories. It can be installed with the following command depending on your distro:

### Arch Linux
```
pacman -S bspwm
```
### Debian/Ubuntu
```
apt install bspwm
```
### Fedora
```
dnf install bspwm
```

Then, you also need the files in this repository to actually configure BSPWM and have the theme showcased in the above screenshot.

<u>**Note**</u>: this BSPWM installation can be fully automated by using my [bootstrap script](https://github.com/GSquad934/bootstrap). The script also automates multi-monitor configuration.

# Running BSPWM
If you don't use a login manager, you can start the graphical environment with the *startx* command (package "*xorg-xinit*" required) and a properly configured *.xinitrc* file. If you want some inspiration for your *.xinitrc*, you can check out [mine](https://github.com/GSquad934/dotfiles/blob/master/config/X11/xinitrc).

If you use a login manager (such as *lightdm*), the BSPWM package installation should have already created a *.desktop* file necessary for the login manager. Otherwise, make sure to create a *bspwm.desktop* file in */usr/share/xsessions/*. The file should contain the following:

```
[Desktop Entry]
Name=bspwm
Comment=Binary space partitioning window manager
Exec=bspwm
Type=Application
```

## Multi-monitor Setup
BSPWM treats workspaces on a per-monitor basis. This means that a workspace can only exist on a single monitor. By default, the *bspwmrc* is configured to setup 9 workspaces on a single monitor with the following line:

```
bspc monitor -d 1 2 3 4 5 6 7 8 9
```

In order to quickly detect connected monitors, the following command can be used:

```
xrandr -q | grep '\sconnected' | awk '{print $1}'
OR
bspc query -M --names
```

The command will return values such as *eDP1*, *HDMI*, etc... For example, if two monitors are connected with DisplayPorts, the output of the above command would be *eDP1* and *eDP2*. Then, an example configuration would be:

```
bspc monitor eDP1 -d 1 2 3 4 5
bspc monitor eDP2 -d 6 7 8 9 0
```

Workspaces 1 to 5 would be on the first monitor and 6 to 10 on the second monitor.

### Workspace setup per machine
It is possible to setup a custom configuration based on a machine's hostname in *bspwmrc* like the following:

```
 if [[ $(hostname) == 'MYPC1' ]]; then
     bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9
 elif [[ $(hostname) == 'MYPC2' ]]; then
     bspc monitor VGA-0 -d 1 2 3 4 5
     bspc monitor VGA-1 -d 6 7 8 9 10
 elif [[ $(hostname) == 'MYPC3' ]]; then
     bspc monitor DVI-I-3 -d 6 7 8 9 10
     bspc monitor DVI-I-2 -d 1 2 3 4 5
 fi
```

# Key Bindings
I configured the key bindings that I like. They are all configured in the *sxhkdrc* file. Here is the full list and what they actually do:

| Key binding | Action |
| :--- | :--- |
| `Super + RETURN` | Open terminal (st is the hard-coded one but it can be modified) |
| `Super + SHIFT + RETURN` | Open run launcher (dmenu is the run launcher but it can be modified) |
| `Super + SHIFT + c` | Kill window with focus |
| `Super + SHIFT + q` | Quit BSPWM |
| `Super + SHIFT + r` | Reload BSPWM |
| `Super + 1-9` | Switch focus to workspace (1 to 9) |
| `Super + SHIFT + 1-9` | Move focused window to workspace (1 to 9) |
| `Super + Space` | Switch between monocle and tiled layout |
| `Super + SHIFT + Space` | Focused window becomes sticky |
| `Super + t` | Focused window set to tiled state |
| `Super + SHIFT + t` | Focused window set to pseudo tiled state |
| `Super + f` | Focused window set to floating state |
| `Super + SHIFT + f` | Focused window set to fullscreen state |
| `Super + h-j-k-l` | Give focus to window in either the west-south-north-east direction |
| `Super + SHIFT + h-j-k-l` | Move the focused window to the west-south-north-east |
| `Super + [` | Move to the previous workspace on the current monitor |
| `Super + ]` | Move to the next workspace on the current monitor |
| `Super + Grave` | Move to the last focused window |
| `Super + Tab` | Move to the last focused workspace |
| `Super + o` | Focus to the older opened window regardless of its workspace |
| `Super + i` | Focus to the newer opened window regardless of its workspace |
| `Super + left-down-up-right arrow` | Expand current window to the given direction |
| `Super + Alt + left-down-up-right arrow` | Reduce current window to the given direction |
| `Super + SHIFT + left-down-up-right arrow` | Move current floating window to the given direction |

# Status Bar
BSPWM does not ship with a status bar. *Polybar* has been configure to show the following:

![](https://i.postimg.cc/bvrT4sTz/screenshot-20210704-027.png)

* 📦 1 : indicates how many updates are available (script: *updates.sh*)
* 📰 0 : indicates the number of unread news if newsboat is installed (script: *news.sh*)
* 🖥️ 3% : indicates the CPU usag
* 🧠 23% : indicates the percentage or used RAM
* ⬇  1.4KB ⬆  0B : indicates the download/upload network traffic usage. It will automatically change B/KB/MB depending on the usage (script: *network.sh*)
* 💾 14G/20G : indicates the disk space usage where "/" is mounted. Other disks can be added by modifying the script (script: *disk.sh*)
* 🌡️ 57.5°C: indicates the CPU temperature when sensors can be read (script: *temp.sh*)
* 🔋 99% : indicates the battery level when a battery is detected (script: *battery.sh*)
* 🔊 60% : indicates the volume level. The icon will change depending on the volume level (script: *vol.sh*)
* 🕒 Sun July 04 21:49 : indicates the current day, date and time in 24H format
* A system tray on the far right

# Wallpapers
*Feh* is used to setup the wallpaper. A default wallpaper (file: *background.jpg*) is supplied with this configuration of BSPWM. *Feh* is executed by the *bspwmrc* file to set the default wallpaper. In order to setup a custom wallpaper, it is possible to either replace the *background.jpg* file or to modify the execution of *feh* in the *bspwmrc* file with something like the following:

```
feh --bg-fill --no-fehbg --randomize "$HOME"/.local/share/wallpapers*
```

This command would look for wallpapers in the defined folder and randomly assign one as the wallpaper. If you want a set of nice wallpapers, I have some stored in this [repository](https://github.com/GSquad934/wallpapers).

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/gaetanict)
* [Email](mailto:gaetan@ictpourtous.com)
