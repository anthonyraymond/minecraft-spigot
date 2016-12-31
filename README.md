# rpi-minecraft-spigot
A lightweight minecraft server (spigot) embedded in a  Docker container, designed for Raspberry pi.

## Building rpi-minecraft-spigot
Everytime the image is built, it **automatically download the lastest version** from [Spigot's Jenkins][1].

    docker build -t anthonyraymond/rpi-minecraft-spigot .


## Running rpi-minecraft-spigot
    docker run --restart=always -d -v /<PATH>/<TO>/<DATA>:/data -p 25565:25565 --name="minecraft-server" anthonyraymond/rpi-minecraft-spigot

#### What to put into the /data folder
Nothing is needed for the server to run.
Howether this is the place to put your minecraft config files, and realms if you already have these.


[1]:(http://ci.getbukkit.org/job/Spigot/lastSuccessfulBuild/artifact/)
