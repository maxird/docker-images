FROM maxird/centos:7

ADD wait.sh /app/
RUN chmod +x /app/wait.sh
ENTRYPOINT ["/bin/tini", "-g", "--", "bash", "/app/wait.sh"]
