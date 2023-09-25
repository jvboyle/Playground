#!/bin/bash

# wait for postgresql
until nc -vz $POSTGRES_HOST $POSTGRES_PORT; do
echo "Postgresql is not ready, sleeping..."
sleep 1
done
echo "Postgresql is ready, starting Rails."

python manage.py db init
python manage.py db migrate
python manage.py db upgrade
service nginx start 
uwsgi --ini sasg.ini
