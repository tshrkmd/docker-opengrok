#!/bin/sh

service tomcat8 start

echo "Generate the index."
OpenGrok index /src

echo "Update the index every one minute."
while true
do
    OpenGrok index /src
    sleep 600
done
