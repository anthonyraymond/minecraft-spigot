FROM hypriot/rpi-java:jre-1.8.111

#Download last version of spigot
RUN apt-get update \
        && apt-get install wget \
        && mkdir -p /webserver \
        && wget https://cdn.getbukkit.org/spigot/spigot-1.12-pre5.jar -O /webserver/minecraft_server.jar \
        && apt-get remove wget \
        && apt-get autoremove --purge \
        && rm -rf /var/lib/apt/lists/*

EXPOSE 25565


# /data contains static files and database
VOLUME ["/data"]

WORKDIR /data
# start the server
CMD ["java","-Xms512M","-Xmx1008M","-Dcom.mojang.eula.agree=true","-Dfile.encoding=UTF-8","-jar","/webserver/minecraft_server.jar","nogui"]
