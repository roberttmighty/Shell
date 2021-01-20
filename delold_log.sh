#!/bin/bash

#Variables
ENV=`ls /oracle/PS_CFG_HOME/ | grep "prd$"`
PS_CFG_HOME=/oracle/PS_CFG_HOME
Aa=$PS_CFG_HOME/$ENV/appserv/"$ENV"a/LOGS/
Ab=$PS_CFG_HOME/$ENV/appserv/"$ENV"b/LOGS/
Ac=$PS_CFG_HOME/$ENV/appserv/"$ENV"c/LOGS/
Pa=$PS_CFG_HOME/$ENV/appserv/prcs/"$ENV"a/LOGS/
Pb=$PS_CFG_HOME/$ENV/appserv/prcs/"$ENV"b/LOGS/

#Start
find $Aa -type f -mtime +340 -exec rm {} \; &> /dev/null
find $Ab -type f -mtime +340 -exec rm {} \; &> /dev/null
find $Ac -type f -mtime +340 -exec rm {} \; &> /dev/null
find $Pa -type f -mtime +340 -exec rm {} \; &> /dev/null
find $Pb -type f -mtime +340 -exec rm {} \; &> /dev/null
