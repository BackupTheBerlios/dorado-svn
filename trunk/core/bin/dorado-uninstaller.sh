#!/bin/sh

ANT_EXEC=`which ant`

if [ "$ANT_EXEC" = "" ]; then
	ANT_EXEC=$ANT_HOME/bin/ant.sh
fi

if [ "$ANT_EXEC" = "" ]; then
	echo "No Ant Executable found in path."
	exit 1
fi

PRG="$0"
while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done
PRGDIR=`dirname "$PRG"`

$ANT_EXEC -f $PRGDIR/../conf/dorado-install.xml uninstall
