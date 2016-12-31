FROM hypriot/rpi-java:1.8.0

#Download last version of spigot
RUN mkdir -p /webserver \
      && wget http://ci.getbukkit.org/job/Spigot/lastSuccessfulBuild/artifact/spigot-1.11.2.jar -O /webserver/minecraft_server.jar

EXPOSE 25565


# /data contains static files and database
VOLUME ["/data"]

WORKDIR /data
# start the server
CMD ["java","-Xms512M","-Xmx1008M","-Dcom.mojang.eula.agree=true","-Dfile.encoding=UTF-8","-jar","/webserver/minecraft_server.jar","nogui"]