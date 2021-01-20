#!/bin/bash

#This is a SPC custom script that will clear all App Domain Cache
#This is a general script so please update the below lines to point the proper cache folders

#Last Update: 09/02/2020 by Josh Westmoreland
#Changes Made: Updated to use user defined argument

#Start of Script
rm -rf /oracle/PS_CFG_HOME/$1/appserv/"$1"/CACHE/*
rm -rf /oracle/PS_CFG_HOME/$1/appserv/"$1"a/CACHE/*
rm -rf /oracle/PS_CFG_HOME/$1/appserv/"$1"b/CACHE/*
rm -rf /oracle/PS_CFG_HOME/$1/appserv/"$1"c/CACHE/*