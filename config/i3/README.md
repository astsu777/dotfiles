# My i3 Configuration
![](https://i.postimg.cc/jdgGK62W/screenshot-20210819-040.png)

This repository hosts the configuration files for [i3](https://i3wm.org/). However, it is truly using *i3-gaps* as I like gaps between windows. The entire configuration can be made in a single configuration file called *config*. This configuration does not use the *i3bar* but instead is using *Polybar* for the top panel. The reason for this is the ease of configuration and the scripts used by the bar are custom-made. This window manager and configuration features:

* 9 workspaces
* Inner and outer gaps between windows
* Manual tiling and full control with keybindings
* Status bar with custom scripts to display various information

All start-up applications are included in the *xinitrc*/*xprofile* file. This i3 configuration is only starting the status bar and nothing else.

# Dependencies
The following packages are necessary in order to run i3 properly:

* i3-gaps

The following software are not mandatory but recommended:
* feh (hard-coded to set a wallpaper)
* dmenu (hard-coded run launcher)
* st (hard-coded terminal emulator)
* polybar (if you want a status bar)

*feh*, *st* and *dmenu* are very recommended because those programs are in my i3 configuration.

If you want a nice DMenu to be integrated, you can install [my custom build](https://github.com/GSquad934/dmenu). You can check out [my build of ST](https://github.com/GSquad934/st) for a nice terminal emulator.

It is possible to use i3 without any status bar. However, *Polybar* has been configured as illustrated by the above screenshot and can be installed to have a nice status bar.

# Installation
i3 is available in most Linux distribution repositories. It can be installed with the following command depending on your distro:

### Arch Linux
```
pacman -S i3-gaps
```
### Debian/Ubuntu
```
apt install i3-gaps
```
### Fedora
```
dnf install i3-gaps
```

Then, you also need the files in this repository to actually configure i3 and have the theme showcased in the above screenshot.

<u>**Note**</u>: this i3 installation can be fully automated by using my [bootstrap script](https://github.com/GSquad934/bootstrap).

# Running i3
If you don't use a login manager, you can start the graphical environment with the *startx* command (package "*xorg-xinit*" required) and a properly configured *.xinitrc* file. If you want some inspiration for your *.xinitrc*, you can check out [mine](https://github.com/GSquad934/dotfiles/blob/master/config/X11/xinitrc).

If you use a login manager (such as *lightdm*), the i3 package installation should have already created a *.desktop* file necessary for the login manager. Otherwise, make sure to create a *i3.desktop* file in */usr/share/xsessions/*. The file should contain the following:

```
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=i3
TryExec=i3
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
Keywords=tiling;wm;windowmanager;window;manager;
```

# Key Bindings
I configured the key bindings that I like. They are all configured in the *config* file. Here is the full list and what they actually do:

* **MODKEY** has been configured to be the Super key (=Windows key)

| Key binding | Action |
| :--- | :--- |
| `Super + RETURN` | Open terminal (st is the hard-coded one but it can be modified) |
| `Super + SHIFT + RETURN` | Open run launcher (dmenu is the run launcher but it can be modified) |
| `Super + SHIFT + c` | Kill window with focus |
| `Super + SHIFT + q` | Quit i3 |
| `Super + SHIFT + r` | Reload i3's configuration file |
| `Super + SHIFT + ALT + r` | Restart i3 |
| `Super + 1-9` | Switch focus to workspace (1 to 9) |
| `Super + SHIFT + 1-9` | Move focused window to workspace (1 to 9) |
| `Super + SHIFT + Space` | Toggle focused window between floating/tiling mode |
| `Super + SHIFT + f` | Focused window set to fullscreen state |
| `Super + h-j-k-l` | Give focus to window in either the west-south-north-east direction |
| `Super + SHIFT + h-j-k-l` | Move the focused window to the west-south-north-east |
| `Super + ALT + h-j-k-l` | Choose if the next window will open to the west-south-north-east (manual tiling) |
| `Super + F10` | Choose the stacking layout |
| `Super + F11` | Choose the tabbed layout |
| `Super + F12` | Toggle the split layout |
| `ALT + r` | Switch to 'resize' mode |

While in resize mode, the following keybindings are available:

| Key binding | Action |
| :--- | :--- |
| `h` | Shrink the width of focused window |
| `j` | Shrink the height of focused window |
| `k` | Expand the height of focused window |
| `l` | Expand the width of focused window |
| `Escape` | Return to 'default' mode |

# Status Bar
i3 ships with a status bar called *i3bar*, but I don't use it. *Polybar* has been configured to show the following:

![](https://i.postimg.cc/bvrT4sTz/screenshot-20210704-027.png)

* The workspaces and focused window name on the far left
* 📦 1 : indicates how many updates are available (script: *updates.sh*)
* 📰 0 : indicates the number of unread news if newsboat is installed (script: *news.sh*)
* 🖥️  3% : indicates the CPU usag
* 🧠 23% : indicates the percentage or used RAM
* ⬇  1.4KB ⬆  0B : indicates the download/upload network traffic usage. It will automatically change B/KB/MB depending on the usage (script: *network.sh*)
* 💾 14G/20G : indicates the disk space usage where "/" is mounted. Other disks can be added by modifying the script (script: *disk.sh*)
* 🌡️  57.5°C: indicates the CPU temperature when sensors can be read (script: *temp.sh*)
* 🔋 99% : indicates the battery level when a battery is detected (script: *battery.sh*)
* 🔊 60% : indicates the volume level. The icon will change depending on the volume level (script: *vol.sh*)
* 🕒 Sun July 04 21:49 : indicates the current day, date and time in 24H format
* A system tray on the far right

# Wallpapers
*Feh* is used to setup the wallpaper. A default wallpaper (file: *background.jpg*) is supplied with this configuration of i3. *Feh* is executed by the *xinitrc*/*xprofile* file to set the default wallpaper. In order to setup a custom wallpaper, it is possible to either replace the *background.jpg* file or to modify the execution of *feh* with something like the following:

```
feh --bg-fill --no-fehbg --randomize "$HOME"/.local/share/wallpapers*
```

This command would look for wallpapers in the defined folder and randomly assign one as the wallpaper. If you want a set of nice wallpapers, I have some stored in this [repository](https://github.com/GSquad934/wallpapers).

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/gaetanict)
* [Email](mailto:gaetan@ictpourtous.com)
