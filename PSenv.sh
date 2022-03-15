#!/bin/bash

#Variables
DEV=`ls /oracle/PS_CFG_HOME | grep "dev"`
TST=`ls /oracle/PS_CFG_HOME | grep "tst" | grep -v "b$"`
TSTB=`ls /oracle/PS_CFG_HOME | grep "tst" | grep "b$"`

#Script Start

echo 
echo -e "Select an Enviroment\n \n 1. $DEV\n 2. $TST\n 3. $TSTB\n " 
echo
read -p "Your Selection: " CONT
if [ "$CONT" = "1" ]; then
        export PS_CFG_HOME='/oracle/PS_CFG_HOME/'$DEV''
        export PS_APP_HOME='/oracle/PS_APP_HOME/'$DEV''
        export PS_CUST_HOME='/oracle/PS_CUST_HOME/'$DEV''
        psadmin
fi
if [ "$CONT" = "2" ]; then
        export PS_CFG_HOME='/oracle/PS_CFG_HOME/'$TST''
        export PS_APP_HOME='/oracle/PS_APP_HOME/'$TST''
        export PS_CUST_HOME='/oracle/PS_CUST_HOME/'$TST''
        psadmin
fi
if [ "$CONT" = "3" ]; then
        export PS_CFG_HOME='/oracle/PS_CFG_HOME/'$TSTB''
        export PS_APP_HOME='/oracle/PS_APP_HOME/'$TSTB''
        export PS_CUST_HOME='/oracle/PS_CUST_HOME/'$TSTB''
        psadmin
fi
