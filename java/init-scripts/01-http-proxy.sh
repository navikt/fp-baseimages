#!/usr/bin/env sh

# inject proxy settings set by the nais platform webproxy: true
if [ -n "${JAVA_PROXY_OPTIONS}" ];
then
  export JAVA_OPTS="${JAVA_OPTS} ${JAVA_PROXY_OPTIONS}"
  echo "01. - JAVA_PROXY_OPTIONS injected."
fi
