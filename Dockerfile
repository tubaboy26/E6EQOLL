# syntax=docker/dockerfile:1

FROM openjdk:11-jdk-buster

LABEL version="0.5.21"

RUN apt-get update && apt-get install -y curl unzip && \
 addgroup minecraft && \
 adduser --home /data --ingroup minecraft --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD "Enigmatica 6 0.5.21 Server Powered by Docker"

CMD ["/launch.sh"]
