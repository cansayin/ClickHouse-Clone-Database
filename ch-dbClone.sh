echo "----------------------------------------------------------------------"
echo "################# ClickHouse Database Clone Tool #################"
echo "----------------------------------------------------------------------"
echo ""
echo "######### ClickHouse Databases ###########"
echo "------------------------------------------"

clickhouse-client --password yourpassword --query 'show databases Format CSV;'
echo Please choose a database name:
read -p "Database Name :" database_name

echo Please write a branch name:
read -p "Clone Name : " branch_name


clickhouse-client --password yourpassword --query "BACKUP DATABASE ${database_name} TO Disk('backups','${database_name}.${branch_name}.zip')"
echo "INFO: ${database_name} Backup Has Been Taken"

clickhouse-client --password yourpassword --query "RESTORE DATABASE ${database_name} AS ${database_name}_${branch_name} FROM Disk('backups','${database_name}.${branch_name}.zip')"
echo "INFO: ${database_name}_${branch_name} Restore Finished"
