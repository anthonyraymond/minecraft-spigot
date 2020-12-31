## Building spigot
    docker build -t spigot .

## Running spigot
    docker run -d -v /<local-filesystem-path>:/data -p 25565:25565 --name="minecraft" spigot

## Upgrading between versions
- Update the `SPIGOT_VERSION` 
- Rebuild the image


*When upgrading to the next major version:*
- Upgrade to the latest minor of the current major version (ie, if you are in 1.14.1 and waht to go up to 1.15.x, upgrade to the latest 1.14 build) first.
- Rerun the server with the argument --forceUpgrade `docker run ... spigot --forceUpgrade`
- Wait for the `Upgrading all chunks` to complete
- Stop the server
- Upgrade to the next major version

#### What to put into the /data folder
Nothing is needed for the server to run.
Howether this is the place to put your minecraft config files, and realms if you already have these.

