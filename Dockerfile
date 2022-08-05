FROM ghcr.io/fhem/fhem/fhem-docker:bullseye
MAINTAINER holoarts<holoarts@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies
RUN apt-get update
RUN apt-get -q -y install openjdk-17-jre-headless
RUN apt-get -q -y install zip
RUN apt-get clean && apt-get autoremove


WORKDIR "/tmp"
RUN wget -qN https://github.com/AsamK/signal-cli/releases/download/v0.10.9/signal-cli-0.10.9-Linux.tar.gz -O signal-cli-0.10.9.tar.gz
RUN tar zxf signal-cli-0.10.9.tar.gz
RUN mv signal-cli-0.10.9  /opt/signal
RUN wget -qN https://github.com/bublath/FHEM-Signalbot/raw/main/armhf-glibc2.31-0.10.9/libsignal_jni.so
RUN zip -u /opt/signal/lib/libsignal-client-*.jar libsignal_jni.so

RUN rm -f signal-cli-0.10.9.tar.gz libsignal_jni.so
RUN cpan install Protocol::DBus

COPY org.asamk.Signal.conf /etc/dbus-1/system.d/org.asamk.Signal.conf
COPY org.asamk.Signal.service /usr/share/dbus-1/system-services/org.asamk.Signal.service
#COPY signal.service /etc/systemd/system

COPY signal_start.sh /opt/signal/
RUN chmod a+x /opt/signal/signal_start.sh

# End Dockerfile