
# All Rights to the image, video and audio in this project belong to Valve Corporation

### Please do not sell or distribute for legal resons

## but all the code in the project is free for people to fork and do as they will with (as it was developed by me)











## IMPORANT
I couldn't figure out how to add a delay to the Splash Screen code to prevent the Desktop from loading instantly but I did figure out how to force delay the plasma 5 desktop using a startup command.




### Install to settings

To install the Splash screen you can use:
```sh
mv ~"PATH_TO_THE_SPLASH_SCREEN_LOCATION" ~/.local/share/plasma/look-and-feel/
```


## To setup the Desktop delay so that the whole thing plays without instantly loading the desktop

1. type "nano ~/.nanorc" in the termnial.

2. add the text below to the nano config.




Add To Nano Config:
```sh
[Unit]
Description=Wait for Splash Animation
Before=plasma-workspace.target

[Service]
Type=oneshot
ExecStart=/usr/bin/sleep 10
RemainAfterExit=yes

[Install]
WantedBy=plasma-workspace.target
```

3. save the nano config (DON'T RENAME IT otherwise the command on the next step won't work.)

4. Enable the nano config.

Enable the nano config:
```sh
systemctl --user enable splash-delay.service
```

#now when you login in again the splash will have time to play the whole thing before loading to desktop


#### Note

To disable the nano config type:
```sh
systemctl --user disable splash-delay.service
```




