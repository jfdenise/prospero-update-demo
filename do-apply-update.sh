#!/bin/sh

UPDATE_JBOSS_HOME="$1"
INSTALLATION_JBOSS_HOME="$2"

# First kill the running server
JBOSS_HOME="$INSTALLATION_JBOSS_HOME"
export JBOSS_HOME

echo " " 
echo "*** Shutdown of the running server from the installation directory ***"
echo " "

$JBOSS_HOME/bin/jboss-cli.sh -c shutdown

echo " " 
echo "*** Updating the server from the update directory ***"
echo " " 

JBOSS_HOME="$UPDATE_JBOSS_HOME"
export JBOSS_HOME
time $JBOSS_HOME/bin/prospero.sh apply-update --dir="$JBOSS_HOME" --target-dir="$INSTALLATION_JBOSS_HOME"

JBOSS_HOME="$INSTALLATION_JBOSS_HOME"
export JBOSS_HOME

echo " " 
echo "*** Restarting the server from the installation directory ***"
echo " " 
$JBOSS_HOME/bin/standalone.sh &

echo " " 
echo "*** Deleting update directory ***"
echo " " 
rm -rf "$UPDATE_JBOSS_HOME"

echo "*** Update DONE ***"