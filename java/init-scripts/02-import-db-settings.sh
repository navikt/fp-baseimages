#!/usr/bin/env sh

# inject database settings set by the nais platform vault: true
if test -f /var/run/secrets/nais.io/defaultDSconfig/jdbc_url;
then
  export DEFAULTDS_URL=$(cat /var/run/secrets/nais.io/defaultDSconfig/jdbc_url)
  export DVHDS_URL=$(echo $DEFAULTDS_URL)
  echo "02. - exporting DEFAULTDS_URL to $DEFAULTDS_URL"
  echo "02. - exporting DVHDS_URL to $DVHDS_URL"
fi

if test -f /var/run/secrets/nais.io/defaultDS/username;
then
  export DEFAULTDS_USERNAME=$(cat /var/run/secrets/nais.io/defaultDS/username)
  echo "02. - exporting DEFAULTDS_USERNAME"
fi

if test -f /var/run/secrets/nais.io/defaultDS/password;
then
  export DEFAULTDS_PASSWORD=$(cat /var/run/secrets/nais.io/defaultDS/password)
  echo "02. - exporting DEFAULTDS_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/dvhDSconfig/jdbc_url;
then
  export DVHDS_URL=$(cat /var/run/secrets/nais.io/dvhDSconfig/jdbc_url)
  echo "02. - exporting DVHDS_URL to DVHDS_URL"
fi

if test -f /var/run/secrets/nais.io/dvhDS/username;
then
  export DVHDS_USERNAME=$(cat /var/run/secrets/nais.io/dvhDS/username)
  echo "02. - exporting DVHDS_USERNAME"
fi

if test -f /var/run/secrets/nais.io/dvhDS/password;
then
  export DVHDS_PASSWORD=$(cat /var/run/secrets/nais.io/dvhDS/password)
  echo "02. - exporting DVHDS_PASSWORD"
fi

if test -f /var/run/secrets/nais.io/serviceuser/username;
then
  export SYSTEMBRUKER_USERNAME=$(cat /var/run/secrets/nais.io/serviceuser/username)
  echo "02. - exporting SYSTEMBRUKER_USERNAME"
fi

if test -f /var/run/secrets/nais.io/serviceuser/password;
then
  export SYSTEMBRUKER_PASSWORD=$(cat /var/run/secrets/nais.io/serviceuser/password)
  echo "02. - exporting SYSTEMBRUKER_PASSWORD"
fi
