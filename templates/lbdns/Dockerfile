FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

ADD header.cfg /proxy/header.cfg
ADD parse.sh /proxy/parse.sh
ADD reload.sh /proxy/reload.sh
ADD monitor.sh /proxy/monitor.sh
WORKDIR /proxy
CMD ["/proxy/monitor.sh"]
