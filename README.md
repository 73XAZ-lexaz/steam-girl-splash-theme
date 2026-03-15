
## All Rights to the image, video and audio in this project belong to *Valve Corporation*

#### Please do not sell or distribute for legal resons

<div>&nbsp;</div>

## All the code in the project is free for people to fork and do as they will with.

<div>&nbsp;</div>

<div>&nbsp;</div>

## WIP Features

Adding a way to **interupt** the Splash Screen if the desktop is loaded and if theres a **user input**<br>
<BR>Adding a **easier way to adjust the music volume** of the splash screen using a **command** (**Also works to mute it for people that don't like it**)

<div>&nbsp;</div>

## IMPORTANT

I couldn't figure out how to add a delay to the Splash Screen code to prevent the Desktop from loading instantly but I did figure out how to force delay the plasma 5 desktop using a startup command.

<div>&nbsp;</div>

### Discovered a BUG with the SPLASH-DELAY SCRIPT SPAMMING SYSLOG LOGS

> 3/14/26 9:49pm Should be resovled if Issue persist Please Vist Issues for updates and patch fixes on the problem

<div>&nbsp;</div>

## Install to settings

To install the Splash screen you can use:
```sh
mv ~/"PATH_TO_THE_SPLASH_SCREEN_LOCATION"/ ~/.local/share/plasma/look-and-feel/
```
<div>&nbsp;</div>

## To setup the Desktop delay so that the whole thing plays without instantly loading the desktop

1. If you don't have a ~/.config/systemd/user/ use this command to make one

```sh
mkdir -p ~/.config/systemd/user/
```
 
2. type in terminal

```sh
nano ~/.config/systemd/user/splash-delay.service
```

3.Add To Nano Config

```sh
[Unit]
Description=Wait for Splash Animation
Before=plasma-plasmashell.service plasma-ksmserver.service
StartLimitIntervalSec=0
#If it restarts more than 5 times in 10 seconds, STOP it.
StartLimitBurst=5
StartLimitIntervalSec=10

[Service]
Type=oneshot
ExecStart=/usr/bin/sleep 10
RemainAfterExit=yes


# redirect any output from the sleep command to null
StandardOutput=null
StandardError=null

LogLevelMax=3

[Install]
WantedBy=plasma-workspace.target
```

#### 3. save the nano config (DON'T RENAME IT otherwise the command on the next step won't work.)

<div>&nbsp;</div>

4.Enable the nano config
```sh
systemctl --user enable splash-delay.service
```
<div>&nbsp;</div>

5.Restart Your PC

<div>&nbsp;</div>

#### Note

To disable the nano config type

```sh
systemctl --user disable splash-delay.service
```

## Preveiw

<img src="preview.png" width="500">

<img src="contents/splash/images/steamgirl.gif" width="500">

https://github.com/user-attachments/assets/b78af2e6-8ebf-44e6-b227-ab5f8db7cd4f

## Uninstall

#### This disables the delay and uninstalls all the file related to <ins>steam-girl-splash-theme</ins>

```sh
systemctl --user disable splash-delay.service

rm -r -f ~/.local/share/plasma/look-and-feel/steam-girl-splash-theme/ ~/.config/systemd/user/plasma-workspace.target.wants/splash-delay.service/ ~/.config/systemd/user/splash-delay.service
```
