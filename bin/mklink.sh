#!/usr/bin/env bash

cmd.exe /c "mklink /J "${1//\//\\}" "${2//\//\\}

# Alias: mklink=" . mklink.sh"
# USAGE: mklink <mylink> <target>
