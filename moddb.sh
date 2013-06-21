#!/bin/bash

BTICK='`'
EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`

# Q1 and Q2 are really the only differences
# Q1 revokes all permissions, giving us a clean slate
# Q2 grants just the user premissions
Q1="REVOKE ALL PRIVILEGES ON *.* FROM '$2'@'%';"
Q2="GRANT ALL ON ${BTICK}$1${BTICK}.* TO '$2'@'%' IDENTIFIED BY '$3';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass"
  exit $E_BADARGS
fi

$MYSQL -e "$SQL"
