# whonix-docker:gateway-cli
#
# VERSION               0.0.1
FROM debian:bullseye as baseimage
ENV DEBIAN_FRONTEND noninteractive
USER root
# RUN dmesg | grep eth
RUN apt-get update;\
apt-get install -y gnupg2 sudo git apt-utils wget time curl lsb-release fakeroot dpkg-dev procps;\
apt-get install -y adduser;\
echo no | apt-get install -y apt-cacher-ng;\
wget https://www.whonix.org/patrick.asc -O ~/patrick.asc;\
gpg --import ~/patrick.asc;\
gpg --keyid-format long --import --import-options show-only --with-fingerprint ~/patrick.asc;\
sudo apt-key --keyring /etc/apt/trusted.gpg.d/whonix.gpg add ~/patrick.asc;\
echo "deb http://deb.whonix.org bullseye main" | tee /etc/apt/sources.list.d/whonix.list;\
apt-get update && apt-get upgrade -y;\
wget https://www.kicksecure.com/derivative.asc;\
mv derivative.asc /usr/share/keyrings/derivative.asc;\
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] https://deb.kicksecure.com bullseye main contrib non-free" | sudo tee /etc/apt/sources.list.d/derivative.list;\
apt-get update;\
apt-get install -y genmkfile
RUN adduser --quiet --disabled-password --home /home/user --gecos 'user,,,,' user;\
echo "user:changeme" | chpasswd;\
addgroup user sudo
# UPGRADE TO WHONIX PACKAGES & INSTALL TOR
RUN apt-get install -y net-tools tor;

# WRITE TOR CONFIG
COPY torrc.sh /root
RUN sh ~/torrc.sh
# START/RESTART TOR AND UPGRADE TO WHONIX PACKAGES
RUN pkill tor;\
tor 2>&1 &\
sleep 2;\
apt-get update && apt-get dist-upgrade -y

# SIMULATE REBOOT
FROM baseimage
USER user
RUN wget https://www.whonix.org/patrick.asc -O ~/patrick.asc;\
gpg --import ~/patrick.asc;\
gpg --keyid-format long --import --import-options show-only --with-fingerprint ~/patrick.asc;\
git clone --depth=1 --branch 16.0.4.2-developers-only --jobs=4 --recurse-submodules --shallow-submodules https://gitlab.com/whonix/Whonix.git ~/Whonix;\
cd ~/Whonix && git fetch;\
git verify-tag 16.0.4.2-developers-only;\
git checkout --recurse-submodules 16.0.4.2-developers-only
USER root
RUN /bin/bash -c 'cd /home/user/Whonix;\
sudo /home/user/Whonix/whonix_build --flavor whonix-gateway-cli --target root --build'

