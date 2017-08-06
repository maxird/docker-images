FROM maxird/node-package:6

ADD scl.sh /app/

ENTRYPOINT ["/bin/tini", "-g", "--", "/app/scl.sh"]

CMD ["/usr/bin/bash"]
