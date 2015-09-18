#!/bin/bash

docker rmi pptp-client
docker build -t pptp-client .
