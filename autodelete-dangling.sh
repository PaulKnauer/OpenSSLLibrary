#!/bin/sh

list=$(docker images -q -f "dangling=true" -f "label=autodelete=true" -f "label=project=openssl")
if [ -n "$list" ]; then
     docker rmi $list
fi
