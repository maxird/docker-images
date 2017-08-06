FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

ADD scl.sh /app/

ENTRYPOINT ["/bin/tini", "-g", "--", "/app/scl.sh"]

CMD ["/usr/bin/bash"]
