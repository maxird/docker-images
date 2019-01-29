#!/bin/bash

DIR=/docker-entrypoint.d
if [[ -d "$DIR" ]]; then
  /bin/run-parts --verbose --regex '\.sh$' "$DIR"
fi

## launch the web service
#
echo "Launching web service..."
apachectl -D FOREGROUND
