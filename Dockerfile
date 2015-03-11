FROM busybox

ONBUILD ENV PATH /root/.nix-profile/bin:/root/.nix-profile/sbin:/root/bin:/bin:/sbin:/usr/bin:/usr/sbin
ONBUILD ENV ENV /etc/profile
ENV ENV /etc/profile

ADD ./nix.conf /etc/nix/nix.conf

ADD ./installnix.sh /root/installnix.sh
RUN chmod +x /root/installnix.sh && /root/installnix.sh

ADD ./install.sh /root/install.sh
RUN chmod +x /root/install.sh && /root/install.sh

ADD ./postInstall.sh /root/postInstall.sh
RUN chmod +x /root/postInstall.sh && /root/postInstall.sh

WORKDIR /root/bin
