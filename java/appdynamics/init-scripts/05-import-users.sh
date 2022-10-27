#!/usr/bin/env bash

if test -f /var/run/secrets/nais.io/defaultDSconfig/jdbc_url;
then
  export DEFAULTDS_URL=$(cat /var/run/secrets/nais.io/defaultDSconfig/jdbc_url)
  export DVHDS_URL=$(echo $DEFAULTDS_URL)
  export FPINFOSCHEMA_URL=$(echo $DEFAULTDS_URL)
  echo "- exporting DEFAULTDS_URL to $DEFAULTDS_URL"
  echo "- exporting DVHDS_URL to $DVHDS_URL"
  echo "- exporting FPINFOSCHEMA_URL til $FPINFOSCHEMA_URL"
fi

if test -f /var/run/secrets/nais.io/defaultDS/username;
then
  export DEFAULTDS_USERNAME=$(cat /var/run/secrets/nais.io/defaultDS/username)
  echo "- exporting DEFAULTDS_USERNAME"
fi

if test -f /var/run/secrets/nais.io/defaultDS/password;
then
  export DEFAULTDS_PASSWORD=$(cat /var/run/secrets/nais.io/defaultDS/password)
  echo "- exporting DEFAULTDS_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/dvhDSconfig/jdbc_url;
then
  export DVHDS_URL=$(cat /var/run/secrets/nais.io/dvhDSconfig/jdbc_url)
  echo "- exporting DVHDS_URL to $DVHDS_URL"
fi

if test -f /var/run/secrets/nais.io/dvhDS/username;
then
  export DVHDS_USERNAME=$(cat /var/run/secrets/nais.io/dvhDS/username)
  echo "- exporting DVHDS_USERNAME"
fi

if test -f /var/run/secrets/nais.io/dvhDS/password;
then
  export DVHDS_PASSWORD=$(cat /var/run/secrets/nais.io/dvhDS/password)
  echo "- exporting DVHDS_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/fpinfoSchemaConfig/jdbc_url;
then
  export FPINFOSCHEMA_URL=$(cat /var/run/secrets/nais.io/fpinfoSchemaConfig/jdbc_url)
  echo "- exporting FPINFOSCHEMA_URL to $FPINFOSCHEMA_URL"
fi

if test -f /var/run/secrets/nais.io/fpinfoSchema/username;
then
   export  FPINFOSCHEMA_USERNAME=$(cat /var/run/secrets/nais.io/fpinfoSchema/username)
   echo "- exporting FPINFOSCHEMA_USERNAME"

fi

if test -f /var/run/secrets/nais.io/fpinfoSchema/password;
then
    export  FPINFOSCHEMA_PASSWORD=$(cat /var/run/secrets/nais.io/fpinfoSchema/password)
    echo "- exporting FPINFOSCHEMA_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/serviceuser/username;
then
  export SYSTEMBRUKER_USERNAME=$(cat /var/run/secrets/nais.io/serviceuser/username)
  echo "- exporting SYSTEMBRUKER_USERNAME"
fi

if test -f /var/run/secrets/nais.io/serviceuser/password;
then
  export SYSTEMBRUKER_PASSWORD=$(cat /var/run/secrets/nais.io/serviceuser/password)
  echo "- exporting SYSTEMBRUKER_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/ldap/username;
then
  export LDAP_USERNAME=$(cat /var/run/secrets/nais.io/ldap/username)
  echo "- exporting LDAP_USERNAME"
fi

if test -f /var/run/secrets/nais.io/ldap/password;
then
  export LDAP_PASSWORD=$(cat /var/run/secrets/nais.io/ldap/password)
  echo "- exporting LDAP_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/mq/username;
then
  export MQ_USERNAME=$(cat /var/run/secrets/nais.io/mq/username)
  echo "- exporting MQ_USERNAME"
fi

if test -f /var/run/secrets/nais.io/mq/password;
then
  export MQ_PASSWORD=$(cat /var/run/secrets/nais.io/mq/password)
  echo "- exporting MQ_PASSWORD"
fi
