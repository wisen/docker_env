FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN \
#  sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
  apt update && \
  apt upgrade -y && \
  apt -y --no-install-recommends install \
    ca-certificates curl sudo xorg dbus dbus-x11 ubuntu-gnome-default-settings gtk2-engines \
    ttf-ubuntu-font-family fonts-ubuntu-font-family-console fonts-droid-fallback lxappearance \
# wisen add for ssh
    vim openssh-server net-tools \
# wisen add for testing x11 application
    firefox gedit \
# wisen add for build project
    git make \
# wisen add for 
    locales \
    && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/* && \
  echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN \
  echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN \
  /etc/init.d/ssh restart

RUN \
  echo "root:123456" | chpasswd

RUN \
    locale-gen "en_US.UTF-8" \
    update-locale LANG=en_US.UTF-8

# ARG gosu_version=1.10
# RUN \
#   curl -SL "https://github.com/tianon/gosu/releases/download/${gosu_version}/gosu-$(dpkg --print-architecture)" \
#     -o /usr/local/bin/gosu && \
#   curl -SL "https://github.com/tianon/gosu/releases/download/${gosu_version}/gosu-$(dpkg --print-architecture).asc" \
#     -o /usr/local/bin/gosu.asc && \
#   gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
#   gpg --verify /usr/local/bin/gosu.asc && \
#   rm -rf /usr/local/bin/gosu.asc /root/.gnupg && \
#   chmod +x /usr/local/bin/gosu
