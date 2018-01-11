#!/bin/bash

docker run -it --rm \
    --name elastalert \
    -v $PWD/test:/config \
    junk
