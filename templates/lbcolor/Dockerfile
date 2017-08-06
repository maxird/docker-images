FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

ADD template.ctmpl /proxy/template.ctmpl
ADD reload.sh /proxy/reload.sh
ADD monitor.sh /proxy/monitor.sh
WORKDIR /proxy
CMD ["/proxy/monitor.sh"]
