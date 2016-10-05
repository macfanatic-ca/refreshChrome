#!/bin/bash

USER=`who | grep console | awk '{print $1}'`
logFile=/Users/$USER/Library/Logs/refreshChrome.log

if [ -z /Users/$USER/Library/Logs/ ]; then
    mkdir -p /Users/$USER/Library/Logs/
fi

if [ -d /Users/$USER/Library/Application\ Support/Google/Chrome ]; then
    rm -rf /Users/$USER/Library/Application\ Support/Google/Chrome
        if [ $? == 0 ]; then
            echo "`date`: Refreshed Chrome for $USER" | tee -a $logFile
            echo "`date` ################ Complete ################" | tee -a $logFile
            exit 0
        else
            echo "`date`: ERROR: Unable to refresh Chrome for $USER" | tee -a $logFile
            echo "`date` ################ Complete ################" | tee -a $logFile
            exit 1
        fi
else
    echo "`date`: Unable to locate existing Chrome files" | tee -a $logFile
    echo "`date` ################ Complete ################" | tee -a $logFile
    exit 2
fi
