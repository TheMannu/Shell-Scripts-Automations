Installation of MySQL:

sudo apt install mysql-server 

Wait for installation and then login as root 

sudo msql -u root

Set up MySQL password:

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;

show database 

create database

Explanation

• DB_NAME: The name of the database to back up.

• BACKUP_DIR: The directory where the backup will be stored.

• DATE: Captures the current date and time.

• mysqldump -u root -p $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql: Dumps the database to a SQL file.

• echo "Database backup completed: $BACKUP_DIR/$DB_NAME-$DATE.sql": Outputs a message indicating the completion of the backup.
