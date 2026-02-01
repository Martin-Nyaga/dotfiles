#! /usr/bin/env bash
set -xe

# Run a simple ruby server. Defaults to port 8080,
# But accepts a port number as an argument

if [ -z "$1" ]
then
  port=8080
else
  port=$1
fi

ruby -run -e httpd . -p $port
