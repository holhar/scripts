#!/bin/bash

#    java -jar /path/to/app/hello-world.jar initializes the application.
#    > /path/to/log.txt redirects any anything written to STDOUT into the file /path/to/log.txt.
#    2>&1 redirects all errors printed on STDERR to STDOUT. This way all the logs will go to STDOUT which is already redirected to /path/to/log.txt
#    & at the end makes the application run in the background.
#    echo $! will print the PID of the last command
#    The PID is then written to a file using > /path/to/app/pid.file
#    nohup lets the java process run in the background even after the user is logged out.

nohup java "$@" -jar /path/to/app/hello-world.jar > /path/to/log.txt 2>&1 &
sleep 1
cut -c 1-5 <<< $(jps|grep "qod.jar") > /home/holhar/opt/pid.file