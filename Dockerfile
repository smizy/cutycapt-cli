FROM centos:7
MAINTAINER smizy

RUN set -x \
    && yum install -y \
        xorg-x11-server-Xvfb \ 
        vlgothic-fonts \ 
        vlgothinc-p-fonts \
        epel-release \
    && sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo \
    && yum --enablerepo=epel install -y CutyCapt \
    && dbus-uuidgen > /var/lib/dbus/machine-id

RUN mkdir -p /root/.fonts
COPY *.otf   /root/.fonts/
COPY fonts.conf /root/.fonts/

RUN fc-cache -fv

VOLUME ["/code"]
WORKDIR "/code"

# docker run -it --rm -v $(pwd):/code cutycapt:centos bash
# xvfb-run --server-args="-screen 0, 1024x768x24" CutyCapt --url=https://github.com --out=github.png --user-style-path=/code/custom.css
# xvfb-run --server-args="-screen 0, 1024x768x24" CutyCapt --url=http://www.yahoo.co.jp --out=yahoo.png --user-style-path=/code/custom.css
