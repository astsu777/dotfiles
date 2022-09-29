# My XFCE4 Configuration
![](https://i.postimg.cc/L4xKCzZk/screenshot-20210324-014.png)

This repository hosts the configuration files for [XFCE4](https://www.xfce.org/). The configuration of XFCE is very basic and minimalist and mostly rocks default settings:

* Only a single top panel configured (the default dock has been removed)
* Supports auto-starting applications via xinit or xprofile
* 9 workspaces by default
* Dark theme configured and custom colorscheme for XFCE Terminal
* Default keybindings

# Dependencies
The following packages are necessary in order to run this build of XFCE properly:

* xfce4
* ttf-jetbrains-mono
* gvfs (to manage mass storage devices with Thunar)

# Installation
XFCE4 is availalbe in most Linux distribution repositories. It can be installed with the following command depending on your distro:

### Arch Linux
```
pacman -S xfce4 gvfs
```
### Debian/Ubuntu
```
apt install xfce4 gvfs
```
### Fedora/CentOS (EPEL required for CentOS)
```
dnf install xfce4 gvfs
```

Then, you also need the files in this repository to actually configure XFCE4 and have the theme showcased in the above screenshot.

# Running XFCE4
If you don't use a login manager, you can start the graphical environment with the *startx* command (package "*xorg-xinit*" required) and a properly configured *.xinitrc* file. If you want some inspiration for your *.xinitrc*, you can check out [mine](https://github.com/astsu777/dotfiles/blob/master/config/X11/xinitrc).

If you use a login manager (such as *lightdm*), the XFCE4 package installation should have already created a *.desktop* file necessary for the login manager. Otherwise, make sure to create a *xfce.desktop* file in */usr/share/xsessions/*. The file should contain the following:

```
[Desktop Entry]
Encoding=UTF-8
Name=Xfce4
Comment=Use this session to run Xfce4 as your desktop environment
TryExec=/usr/bin/startxfce4
Exec=/usr/bin/startxfce4
Icon=/usr/local/share/pixmaps/xfce4_xicon1.png
Type=Application
```

# Wallpapers
A default wallpaper (file: *background.png*) is supplied with this configuration of XFCE4 in addition to the default XFCE4 ones. If you want a set of nice wallpapers, I have some stored in this [repository](https://github.com/astsu777/wallpapers).

# Contact
You can always reach out to me:

* [Twitter](https://twitter.com/astsu777)
* [Email](mailto:gaetan@ictpourtous.com)
