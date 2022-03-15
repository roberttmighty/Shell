#!/bin/bash

##Script Variables
SNAME=`uname -n`
LOGDIR=/home/psoft/.local/bin/logs
PRD=`ls /oracle/PS_CFG_HOME | grep "prd"`
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

##Set Enviroment Variables Not sure if needed but doesn't hurt.
export JAVA_HOME='/oracle/psft/pt/jdk1.8.0_251'
export PATH="$JAVA_HOME/bin:$ORACLE_HOME/bin:$PATH"
export PS_CFG_HOME='/oracle/PS_CFG_HOME'

##Start Script

#Checks to see if directory used in $LOGDIR is there and if it isn't creates.
if [ ! -d "$LOGDIR" ];
    then mkdir -p $LOGDIR 
fi
#Starts running Delivered Weblogic Shell scripts, and outputs to log file.

$PS_CFG_HOME/$PRD/webserv/peoplesoft/bin/adminserverStatus.sh >> $LOGDIR/${PRD}_Status.log
$PS_CFG_HOME/$PRD/webserv/peoplesoft/bin/multiserverStatus.sh PIA >> $LOGDIR/${PRD}_Status.log
$PS_CFG_HOME/$PRD/webserv/peoplesoft/bin/multiserverStatus.sh PIA1 >> $LOGDIR/${PRD}_Status.log

#Checks to see if this a Campus or IHUB web server and if so runs additional scripts output to log file.

if [[ "$SNAME" == csweb* ]] || [[ "$SNAME" == ihweb* ]];
    then $PS_CFG_HOME/$PRD/webserv/peoplesoft/bin/multiserverStatus.sh PIA2 >> $LOGDIR/${PRD}_Status.log
         $PS_CFG_HOME/$PRD/webserv/peoplesoft/bin/multiserverStatus.sh PIA3 >> $LOGDIR/${PRD}_Status.log
fi

#Grabbing info and prints to screen most of this is just formatting to make it look nice.

echo
echo "     ${SNAME^^} WebLogic Processes     "
echo
        if cat $LOGDIR/${PRD}_Status.log | grep "Adminserver 'WebLogicAdmin' is in state : RUNNING" &> /dev/null
                then printf "${PRD^^} WebLogicAdmin : ${GREEN}RUNNING${NC}\n"
        else
                printf "${PRD^^} WebLogicAdmin : ${RED}SHUTDOWN${NC}\n"
        fi

        if cat $LOGDIR/${PRD}_Status.log | grep "Server PIA is in state : RUNNING" &> /dev/null
                then printf "${PRD^^} PIA           : ${GREEN}RUNNING${NC}\n"
        else
                printf "${PRD^^} PIA           : ${RED}SHUTDOWN${NC}\n"
        fi

        if cat $LOGDIR/${PRD}_Status.log | grep "Server PIA1 is in state : RUNNING" &> /dev/null
                then printf "${PRD^^} PIA1          : ${GREEN}RUNNING${NC}\n"
        else
                printf "${PRD^^} PIA1          : ${RED}SHUTDOWN${NC}\n"
        fi
#Grabs additional information and prints if this is a Campus or IHUB web server
if [[ "$SNAME" == csweb* ]] || [[ "$SNAME" == ihweb* ]];
    then
        if cat $LOGDIR/${PRD}_Status.log | grep "Server PIA2 is in state : RUNNING" &> /dev/null
                then printf "${PRD^^} PIA2          : ${GREEN}RUNNING${NC}\n"
        else
                printf "${PRD^^} PIA2          : ${RED}SHUTDOWN${NC}\n"
        fi

        if cat $LOGDIR/${PRD}_Status.log | grep "Server PIA3 is in state : RUNNING" &> /dev/null
                then printf "${PRD^^} PIA3          : ${GREEN}RUNNING${NC}\n"
        else
                printf "${PRD^^} PIA3          : ${RED}SHUTDOWN${NC}\n"
        fi
fi
echo

#Removes all log files in log dir

rm -rf $LOGDIR/*.log
