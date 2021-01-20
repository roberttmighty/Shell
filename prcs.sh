#!/bin/bash
##Script Variables
ENV=$1
DOM=$3 #Only used for Production Servers
TOOLS=enter tools folder

##Set Enviroment Variables
export JAVA_HOME='/oracle/psft/pt/jdk1.8.0_201'
export ORACLE_HOME='/oracle/psft/pt/oracle-client/12.1.0.2/'
export PATH="$JAVA_HOME/bin:$ORACLE_HOME/bin:$PATH"
export PS_CFG_HOME='/oracle/PS_CFG_HOME/'$ENV''
export TUXDIR='/oracle/psft/pt/bea/tuxedo/tuxedo12.2.2.0.0'
export PS_APP_HOME='/oracle/PS_APP_HOME/'$ENV''
export PS_CUST_HOME='/oracle/PS_CUST_HOME/'$ENV''
. $TUXDIR/tux.env
. /oracle/PS_HOME/$TOOLS/psconfig.sh

##Example to start the Process Scheduler A  domain on a production server it would be the below
##    ./s_prcs.sh csprd start a 

##Start script

psadmin -p $2 -d $ENV$DOM
