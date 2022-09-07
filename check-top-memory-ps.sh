#!/bin/bash

get_logs() {
    if [ ! -d log ]; then
        mkdir log
    fi

    ##OUTPUT PS SORTED BY SIZE | TOP 11 | REMOVE NON NUMB
    top_ps=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
    for pid in $top_ps; do
        ## GET PS NAME
        ps_name=$(ps -p $pid -o comm=)
        ps_size=$(ps -p $pid -o size | grep [0-9])
        echo -n $(date +%F,%H:%M:%S,) >>log/$ps_name.log
        echo "$(bc <<<"scale=2;$ps_size/1024") MB" >>log/$ps_name.log
    done
}

get_logs
if [ $? -eq 0 ]; then
    echo ":D"
else
    echo ":("
fi
