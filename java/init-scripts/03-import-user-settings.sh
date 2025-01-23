#!/usr/bin/env sh

# inject systemuser settings set by the nais platform vault: true
if test -f /var/run/secrets/nais.io/serviceuser/username;
then
  export SYSTEMBRUKER_USERNAME=$(cat /var/run/secrets/nais.io/serviceuser/username)
  echo "03. - exporting SYSTEMBRUKER_USERNAME"
fi

if test -f /var/run/secrets/nais.io/serviceuser/password;
then
  export SYSTEMBRUKER_PASSWORD=$(cat /var/run/secrets/nais.io/serviceuser/password)
  echo "03. - exporting SYSTEMBRUKER_PASSWORD"
fi
