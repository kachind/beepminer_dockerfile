FROM ubuntu

ENV CPU=0
ENV WALLET="NQ65 X7M7 NM00 X0T8 DD88 L1RC UE8K TG2R S56D"
ENV POOL="solo"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git

WORKDIR /app

RUN git clone https://github.com/kachind/beepminer/
WORKDIR /app/beepminer
RUN chmod +x miner start.sh

ENTRYPOINT ["sh", "-c", "./start.sh -w \"$WALLET\" -p \"$POOL\" -c \"$CPU\""]
