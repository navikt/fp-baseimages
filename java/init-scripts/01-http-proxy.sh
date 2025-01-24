#!/usr/bin/env sh

# inject proxy settings set by the nais platform webproxy: true
if [ ${JAVA_PROXY_OPTIONS} ];
then
  export JAVA_OPTS="${JAVA_OPTS} ${JAVA_PROXY_OPTIONS}"
  echo "01. - JAVA_PROXY_OPTIONS injected."
else
  echo "01. - No JAVA_PROXY_OPTIONS found."
fi
