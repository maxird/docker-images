FROM maxird/centos:7

ADD template.ctmpl /proxy/template.ctmpl
ADD reload.sh /proxy/reload.sh
ADD monitor.sh /proxy/monitor.sh
WORKDIR /proxy
ENTRYPOINT ["/proxy/monitor.sh"]
