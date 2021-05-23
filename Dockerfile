FROM alpine:3.13
LABEL maintainer="Test"

ENV DEBIAN_FRONTEND noninteractive

ENV pip_packages "ansible"

# Install dependencies.
RUN CARGO_NET_GIT_FETCH_WITH_CLI=1 && \
    apk --no-cache add \
        sudo \
        python3\
        py3-pip \
        rsync \
        git && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev \
        build-base && \
    pip install ansible==2.9 && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/pip && \

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
