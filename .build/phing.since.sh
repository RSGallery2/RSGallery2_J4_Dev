#!/bin/bash

ECHO off
# Starts Target "Improve php file "since" doc parts: add version * @since  x.y.z"

clear

# phing -verbose -debug -logfile .\since.target.log .\updateProject.xml AddVersion2PhpSinceDoc
# phing -verbose -logfile .\since.log .\updateProject.xml AddVersion2PhpSinceDoc
# phing -logfile .\since.target.log .\updateProject.xml AddVersion2PhpSinceDoc

# - longtargets
# -
phing -logfile .\since.target.log -f .\updateProject.xml AddVersion2PhpSinceDoc


ECHO ------------------------------------
# TYPE .\since.target.log
# ECHO ------------------------------------




