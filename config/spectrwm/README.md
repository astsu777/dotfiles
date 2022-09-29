# My SpectrWM Configuration
![](https://i.postimg.cc/CMD0Kpbc/screenshot-20211019-051.jpg)

This repository hosts the configuration files for [SpectrWM](https://github.com/conformal/spectrwm). A single file is necessary to the configuration: *spectrwm.conf*. Two additional files are also present: *autostart.sh* define all the software to start when opening the session; *baraction.sh* provides system information in the status bar. This configuration provides the following features:

* 9 workspaces
* Dynamic tiling and full control with keybindings
* Status bar with custom scripts to display various information
* Very light system resources usage
* Easy configuration to understand
* Script to autostart all the necessary programs such as the composer, etc... via the *baraction.sh* file

# Dependencies
The following packages are necessary in order to run SpectrWM properly:

* spectrwm

The following software are not mandatory but recommended:
* feh (hard-coded in *autostart.sh* to set a wallpaper)
* dmenu (hard-coded run launcher in *spectrwm.conf*)
* st (the hard-coded terminal emulator in *spectrwm.conf*)
* Font Awesome (for icons in the status bar)

*feh*, *st* and *dmenu* are very recommended because those programs are in my SpectrWM configuration. These can be customized by modifying the configuration files.

If you want a nice DMenu to be integrated, you can install [my custom build](https://github.com/astsu777/dmenu). You can check out [my build of ST](https://github.com/astsu777/st) for a nice terminal emulator.

It is possible to use SpectrWM without any status bar as it can easily be disabled.

# Installation
SpectrWM is available in most Linux distribution repositories. It can be installed with the following command depending on your distro:

### Arch Linux
```
pacman -S spectrwm
```
### Debian/Ubuntu
```
apt install spectrwm
```
### Fedora
```
dnf install spectrwm
```

Then, you also need the files in this repository to actually configure SpectrWM and have the theme showcased in the above screenshot.

<u>**Note**</u>: this SpectrWM installation can be fully automated by using my [bootstrap script](https://github.com/astsu777/bootstrap).

# Running SpectrWM
If you don't use a login manager, you can start the graphical environment with the *startx* command (package "*xorg-xinit*" required) and a properly configured *.xinitrc* file. If you want some inspiration for your *.xinitrc*, you can check out [mine](https://github.com/astsu777/dotfiles/blob/master/config/X11/xinitrc).

If you use a login manager (such as *lightdm*), the SpectrWM package installation should have already created a *.desktop* file necessary for the login manager. Otherwise, make sure to create a *spectrwm.desktop* file in */usr/share/xsessions/*. The file should contain the following:

```
[Desktop Entry]
Name=spectrwm
Comment=The spectrwm window manager
Type=Application
Exec=spectrwm
TryExec=spectrwm
Keywords=tiling;window;manager;wm;
```

## Multi-monitor Setup
SpectrWM has the notion of regions that can be used to configure multiple monitors. This can manually be configured in the *spectrwm.conf* file where an example is provided.

# Key Bindings
I configured the key bindings that I like. They are all configured in the *spectrwm.conf* file. Here is the full list and what they actually do:

| Key binding | Action |
| :--- | :--- |
| `MODKEY + RETURN` | opens terminal (st is the hard-coded one but it can be modified) |
| `MODKEY + SHIFT + RETURN` | opens run launcher (dmenu is the run launcher but it can be modified) |
| `MODKEY + SHIFT + c` | closes window with focus |
| `MODKEY + SHIFT + r` | reloads spectrwm |
| `MODKEY + SHIFT + q` | quits spectrwm |
| `MODKEY + 1-9` | switch focus to workspace (1 to 9) |
| `MODKEY + SHIFT + 1-9` | send focused window to workspace (1 to 9) |
| `MODKEY + j` | focus next window in layout |
| `MODKEY + k` | focus previous window in layout |
| `MODKEY + SHIFT + j` | rotate forward window in layout |
| `MODKEY + SHIFT + k` | rotate backward window in layout |
| `MODKEY + h` | expand size of master window |
| `MODKEY + l` | shrink size of master window |
| `MODKEY + i` | increase the number of master windows |
| `MODKEY + d` | decrease the number of master windows |
| `MODKEY + .` | switch focus next region |
| `MODKEY + ,` | switch focus to previous region |
| `MODKEY + b` | toggle the status bar |
| `MODKEY + Tab` | cycle to the next layout |
| `MODKEY + SHIFT + Space` | toggles floating mode for focused window |
| `MODKEY + CTRL + h` | move floating window to the left |
| `MODKEY + CTRL + j` | move floating window down |
| `MODKEY + CTRL + k` | move floating window up |
| `MODKEY + CTRL + l` | move floating window to the right |
| `MODKEY + CTRL + Shift + h` | increase floating widow width |
| `MODKEY + CTRL + Shift + j` | decrease floating widow height |
| `MODKEY + CTRL + Shift + k` | increase floating widow height |
| `MODKEY + CTRL + Shift + l` | decrease floating widow width |
| `MODKEY + Space` | maximize focused window |
| `MODKEY + ALT + l` | lock the screen |

# Wallpapers
*Feh* is used to setup the wallpaper. A default wallpaper (file: *background.jpg*) is supplied with this configuration of SpectrWM. *Feh* is executed by the *autostart.sh* file to set the default wallpaper. In order to setup a custom wallpaper, it is possible to either replace the *background.jpg* file or to modify the execution of *feh* in the *autostart.sh* file with something like the following:

```
feh --bg-scale --no-fehbg --randomize "$HOME"/.local/share/wallpapers*
```

This command would look for wallpapers in the defined folder and randomly assign one as the wallpaper. If you want a set of nice wallpapers, I have some stored in this [repository](https://github.com/astsu777/wallpapers).

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/astsu777)
* [Email](mailto:gaetan@ictpourtous.com)
