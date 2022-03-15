#!/bin/bash

##Vaiables
SNAME=`uname -n`
DEV=`ls /oracle/PS_CFG_HOME | grep "dev"`
PRD=`ls /oracle/PS_CFG_HOME | grep "prd"`
TST=`ls /oracle/PS_CFG_HOME | grep "tst" | grep -v "b$"`
OTH=`ls /oracle/PS_CFG_HOME | grep "xxx"`

##Start Script
if [[ "$SNAME" != np* ]]
    then
        if [[ "$SNAME" == csapp* ]] || [[ "$SNAME" == ihapp* ]]
            then rm -rf /oracle/PS_CFG_HOME/$PRD/appserv/"$PRD"a/CACHE/*
                 rm -rf /oracle/PS_CFG_HOME/$PRD/appserv/"$PRD"b/CACHE/*
        else
            rm -rf /oracle/PS_CFG_HOME/$PRD/appserv/"$PRD"a/CACHE/*
        fi
else
    echo
    echo -e "Which Environment's cache do you want to clear?\n \n 1. ${DEV^^}\n 2. ${TST^^}\n 3. ${OTH^^}\n q. Quit\n"
    echo
    read -p "Your Selection:  " CONT

    if [[ "$CONT" == "1" ]]
        then 
			rm -rf /oracle/PS_CFG_HOME/$DEV/appserv/$DEV/CACHE/*
    elif [[ "$CONT" == "2" ]]
        then 
			rm -rf /oracle/PS_CFG_HOME/$TST/appserv/$TST/CACHE/*
            rm -rf /oracle/PS_CFG_HOME/$TST/appserv/"$TST"b/CACHE/*
    elif [[ "$CONT" == "3" ]]
		then
			rm -rf /oracle/PS_CFG_HOME/$OTH/appserv/$OTH/CACHE/*
    else
		exit 0
	fi	
fi
