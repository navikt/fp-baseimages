#!/usr/bin/env sh

if test -d /init-scripts;
then
    for FILE in /init-scripts/*.sh
    do
        echo Sourcing $FILE
        . $FILE
    done
else
    echo "/init-scripts does not exist, skipping startup scripts"
fi

set -x
exec java ${DEFAULT_JVM_OPTS} ${JAVA_OPTS} -server -classpath ${CLASSPATH} -jar app.jar ${RUNTIME_OPTS} $@