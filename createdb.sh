#!/bin/bash

# This script creates a database like so:
# ./createdb [database name] [user name] [database password]

BTICK='`' # So that we don't accidentally escape our code...
EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`

Q1="CREATE DATABASE IF NOT EXISTS ${BTICK}$1${BTICK};"
Q2="GRANT ALL ON ${BTICK}$1${BTICK}.* TO '$2'@'%' IDENTIFIED BY '$3';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass"
  exit $E_BADARGS
fi

$MYSQL -e "$SQL"
