FROM ubuntu

COPY ./automation/ubuntu/docker/install.sh ./install.sh
RUN chmod +x ./install.sh &&\
    ./install.sh

ENTRYPOINT [ "/bin/bash" ]
