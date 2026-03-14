I couldn't figure out how to add a delay to the Splash Screen code to prevent the Desktop from loading instantly but I did figure out how to force delay the plasma 5 desktop using a startup command.



Steps to setup the delay to let the Splash play all the way through.

1. type "nano ~/.nanorc" in the termnial.

2. add the text below to the nano config.
____________________________________________________________________________________________________________________________________________________________________________________________________________

[Unit]
Description=Wait for Splash Animation
Before=plasma-workspace.target

[Service]
Type=oneshot
ExecStart=/usr/bin/sleep 10
RemainAfterExit=yes

[Install]
WantedBy=plasma-workspace.target

______________________________________________________________________________________________________________________________________________________________________________________________________

3.save the nano config (DON'T RENAME IT)

4.type "systemctl --user enable splash-delay.service" into the terminal to enable the nano config file.

#now when you login in again the splash will have time to play the whole thing before loading to desktop



To disable the nano config just simple type "systemctl --user disable splash-delay.service" into the terminal


To install the Splash screen you can use 

mv "PATH_TO_THE_SPLASH_SCREEN" ~/.local/share/plasma/look-and-feel/


If you simple just want to copy it use

cp -r "PATH_TO_THE_SPLASH_SCREEN" ~/.local/share/plasma/look-and-feel/

