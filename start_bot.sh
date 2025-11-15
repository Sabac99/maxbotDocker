#!/bin/bash

DBMAINPASSWORD=$(openssl rand -base64 12)
DBMAINPASSWORD=$(echo "$DBMAINPASSWORD" | sed 's|/|%2F|g')
echo 'export DBMAINPASSWORD="'$DBMAINPASSWORD'"' >>~/.bashrc
echo "ПАРОЛЬ ОТ БАЗЫ ДАННЫХ: $DBMAINPASSWORD"

docker run --name maxbot-timie -d --network=host -v ./postgres_data/:/var/lib/postgresql/ -e DBMAINPASSWORD=$DBMAINPASSWORD maxbot-timie
