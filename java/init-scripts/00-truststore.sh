#!/usr/bin/env sh

# import of truststore settings injected by nais platform
if test -r "${NAV_TRUSTSTORE_PATH}";
then
    JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=${NAV_TRUSTSTORE_PATH}"
    JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStorePassword=${NAV_TRUSTSTORE_PASSWORD}"
    export JAVA_OPTS
    echo "00. - Truststore injected."
else
    echo "00. - No truststore found: '${NAV_TRUSTSTORE_PATH}'."
fi
