FROM alpine
LABEL maintainer="BlesK <maksarestov2000@gmail.com>"

RUN apk update && apk add --no-cache \
    postgresql \
    git \
    openssh-client \
    nodejs \
    npm \
    vim \
    bash \
    sudo

COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa &&\
    ssh-keyscan github.com >> /root/.ssh/known_hosts && \
    git clone git@github.com:Sabac99/maxbot.git

WORKDIR /maxbot/

STOPSIGNAL SIGTERM

CMD git pull && \
    bash ./init.script.sh
