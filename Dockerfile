FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y wget bzip2 openjdk-8-jre-headless blender

WORKDIR /lokirender

RUN wget http://download.blender.org/release/Blender2.76/blender-2.76b-linux-glibc211-x86_64.tar.bz2 && \
    tar xvjf blender-2.76b-linux-glibc211-x86_64.tar.bz2 && \
    rm blender-2.76b-linux-glibc211-x86_64.tar.bz2 && \
    wget https://downloads.sourceforge.net/project/loki-render/loki-render/0.7.2/LokiRender-072.jar

ENTRYPOINT ["java", "-jar", "LokiRender-072.jar", "/lokirender/blender-2.76b-linux-glibc211-x86_64/blender"]
