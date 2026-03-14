
# All Rights to the image, video and audio in this project belong to Valve Corporation

### Please do not sell or distribute for legal resons

## but all the code in the project is free for people to fork and do as they will with (as it was developed by me)











## IMPORANT
I couldn't figure out how to add a delay to the Splash Screen code to prevent the Desktop from loading instantly but I did figure out how to force delay the plasma 5 desktop using a startup command.




### Install to settings

To install the Splash screen you can use:
```sh
mv ~/"PATH_TO_THE_SPLASH_SCREEN_LOCATION"/ ~/.local/share/plasma/look-and-feel/
```


## To setup the Desktop delay so that the whole thing plays without instantly loading the desktop

1. If you don't have a mkdir -p ~/.config/systemd/user/ use this command to make one:
```sh
mkdir -p ~/.config/systemd/user/
```
 
2. type in termnial:
```sh
nano ~/.config/systemd/user/splash-delay.service
```





3.Add To Nano Config:
```sh
[Unit]
Description=Wait for Splash Animation
Before=plasma-workspace.target

[Service]
Type=oneshot
ExecStart=/usr/bin/sleep 10 #the number here is for how long to wait before loading the desktop environment the whole video is 9 seconds but I set it to 10 to be safe
RemainAfterExit=yes

[Install]
WantedBy=plasma-workspace.target
```

3. save the nano config (DON'T RENAME IT otherwise the command on the next step won't work.)


4.Enable the nano config:
```sh
systemctl --user enable splash-delay.service
```


5.Restart Your PC




#### Note

To disable the nano config type:
```sh
systemctl --user disable splash-delay.service
```



## Uninstall


### This disables the delay and uninstalls all the file related to <ins>steam-girl-splash-theme</ins>
```sh
systemctl --user disable splash-delay.service

rm -r -f ~/.local/share/plasma/look-and-feel/steam-girl-splash-theme/ ~/.config/systemd/user/plasma-workspace.target.wants/ ~/.config/systemd/user/timers.target.wants/ ~/.config/systemd/user/splash-delay.service
```


## Preveiw

# WIP
