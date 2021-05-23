FROM alpine:3.13
LABEL maintainer="Test"

ENV DEBIAN_FRONTEND noninteractive

ENV pip_packages "ansible"

# Install dependencies.
RUN CARGO_NET_GIT_FETCH_WITH_CLI=1 && \
    apk --no-cache add \
        python3\
        git && \
    pip install --upgrade pip wheel && \        
    pip install ansible && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/pip && \

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
