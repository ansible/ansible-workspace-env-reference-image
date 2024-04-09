FROM quay.io/devfile/universal-developer-image:ubi8-latest

ARG PYV=3.11

LABEL org.opencontainers.image.source https://github.com/ansible/community-ansible-devspaces-image
LABEL org.opencontainers.image.authors "Ansible DevTools"
LABEL org.opencontainers.image.vendor "Red Hat"
LABEL org.opencontainers.image.licenses "GPL-3.0"
LABEL org.opencontainers.image.description "An OpenShift Dev Spaces container image for Ansible."

USER 0

# install ansible-dev-tools specific packages
RUN \
dnf -y makecache && dnf -y update \
dnf install -y \
tar \
echo \
podman \
fuse-overlayfs \
openssh-clients \
zsh \
util-linux-user \
which \
git \
dumb-init \
# ansible-pylibssh needs:
gcc \
git-core \
libssh-devel \
python3-markupsafe \
# ansible-navigator needs:
ncurses \
oniguruma-devel \
python3-bcrypt \
python3-cffi \
python3-pip \
python3-pyyaml \
python3-ruamel-yaml \
python3-wheel \
--exclude container-selinux \
    && dnf clean all

COPY ./requirements.txt requirements.txt
COPY ./requirements.yml requirements.yml
RUN \
/usr/bin/python${PYV} -m pip install --no-cache-dir -r requirements.txt \
&& ansible-galaxy collection install -r requirements.yml

RUN chgrp -R 0 /home && chmod -R g=u /etc/passwd /etc/group /home

# Configure the podman wrapper
COPY --chown=0:0 podman.py /usr/bin/podman.wrapper
RUN chmod +x /usr/bin/podman.wrapper

USER 10001
