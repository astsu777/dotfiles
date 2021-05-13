# Information
All cron jobs do not run in the personal userspace. Therefore, information about the DISPLAY, the D-BUS session, the $PATH, etc... is not provided at all in cron jobs.
For example, some cron jobs here use the *notify-send* command to display notifications: this requires information about the current display and user's session.

Therefore, all commands in cron jobs should be preceded by something like the following:

```
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $USER)/bus; export DISPLAY=:0; <COMMAND>
```

If a custom PATH must be imported or if you wish to source a particular file such as *bashrc*, *zshrc*, *profile*, etc... The cron jobs' commands can be preceded by this (in addition to the above):

```
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $USER)/bus; export DISPLAY=:0; . $HOME/.zprofile;  then_command_goes_here
```

These ensure that notifications will be displayed correctly, *xdotool* commands will function and environmental variables will work as well.
