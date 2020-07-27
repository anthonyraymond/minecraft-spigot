FROM adoptopenjdk:11.0.8_10-jre-hotspot-bionic AS builder

WORKDIR /build

RUN SPIGOT_VERSION=1.16.1 \
        && apt-get update \
        && apt-get install -y curl git \
        && curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
        && java -Xmx2048M -jar BuildTools.jar --rev $SPIGOT_VERSION --compile SPIGOT \
        && mv spigot-$SPIGOT_VERSION.jar spigot.jar \
        && rm -rf /var/lib/apt/lists/*

RUN ls


FROM adoptopenjdk:11.0.8_10-jre-hotspot-bionic

WORKDIR /data

COPY --from=builder /build/spigot.jar /opt/spigot/

EXPOSE 25565

VOLUME ["/data"]

ENTRYPOINT ["java","-Xms1024M","-Xmx2048M","-Dcom.mojang.eula.agree=true","-Dfile.encoding=UTF-8","-jar","/opt/spigot/spigot.jar", "nogui"]
CMD [""]
