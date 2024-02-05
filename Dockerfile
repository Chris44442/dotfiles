FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade && apt-get install -y \
    git

RUN git clone https://github.com/Chris44442/HowToDocs.git

RUN chmod +x HowToDocs/install_scripts/core.sh
# RUN HowToDocs/install_scripts/core.sh

