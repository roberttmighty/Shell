#!/bin/bash

#This is an SPC custom script to Change Enviroment variables
#to access different PeopleSoft enviroments.

#Last Update: 05/17/2019 by Josh Westmoreland
#Changes Made: Update Script to use Varables in export Paths

#Update Variables below to work for each different servers.
ENV1=fstm3
ENV2=hrtm3

#Script Start

echo 
echo -e "Select an Enviroment\n \n 1. $ENV1\n 2. $ENV2\n " 
echo
read -p "Your Selection: " CONT
if [ "$CONT" = "1" ]; then
        export PS_CFG_HOME='/oracle/PS_CFG_HOME/'$ENV1''
        export PS_APP_HOME='/oracle/PS_APP_HOME/'$ENV1''
        export PS_CUST_HOME='/oracle/PS_CUST_HOME/'$ENV1''
        psadmin 
fi
if [ "$CONT" = "2" ]; then
        export PS_CFG_HOME='/oracle/PS_CFG_HOME/'$ENV2''
        export PS_APP_HOME='/oracle/PS_APP_HOME/'$ENV2''
        export PS_CUST_HOME='/oracle/PS_CUST_HOME/'$ENV2''
        psadmin 
fi
