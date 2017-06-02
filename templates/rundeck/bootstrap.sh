#!/bin/bash

source /etc/rundeck/profile

stty sane
exec $rundeckd
