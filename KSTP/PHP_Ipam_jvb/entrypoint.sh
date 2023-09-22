

echo " replacing some Variables "

DB_PASS='az secret $storateAccount '

envsubst '${MARIADB_USER}, ${MARIADB_PASSWORD}, ${MARIADB_DATABASE_HOST}, ${MARIADB_DATABASE}' < /var/www/html/config_template.php > /var/www/html/config.php

echo "starting apache2....."
echo "testing....."
env
service apache2 start

