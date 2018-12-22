FROM ubuntu

ENV CPU=0
ENV WALLET="NQ65 X7M7 NM00 X0T8 DD88 L1RC UE8K TG2R S56D"
ENV POOL="solo"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git

RUN apt-get install sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
RUN sudo apt-get update 

WORKDIR /app

RUN git clone https://github.com/kachind/beepminer/
WORKDIR /app/beepminer
RUN chmod +x miner start.sh

ENTRYPOINT ["sh", "-c", "sudo ./start.sh -w \"$WALLET\" -p \"$POOL\" -c \"$CPU\""]
