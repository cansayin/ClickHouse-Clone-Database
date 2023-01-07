echo "----------------------------------------------------------------------"
echo "################# ClickHouse Database Clone Tool #################"
echo "----------------------------------------------------------------------"
echo ""


echo "Please enter ClickHouse User Name"
read -p "User Name : " username

echo "Please enter ClickHouse Password"
read -p "Password : " password

echo "######### ClickHouse Databases ###########"
echo "------------------------------------------"

clickhouse-client --user ${username} --password ${password} --query 'show databases Format CSV;'

echo ""
echo "Please Select Branching Option"
echo "To Create Branch WITH DATA Press '1'"
echo "To Create Branch WITHOUT DATA Press '2'"
echo ""
read -p "Your Choice : " chosen_statement

if [ $chosen_statement == 1 ]
then
echo Please choose a database name:
read -p "Database Name : " database_name

echo Please write a Clone name:
read -p "Clone Name : " branch_name


clickhouse-client --user ${username} --password ${password} --query "BACKUP DATABASE ${database_name} TO Disk('backups','${database_name}.${branch_name}.zip')"
echo "INFO: ${database_name} Backup Has Been Taken"

clickhouse-client --user ${username} --password ${password} --query "RESTORE DATABASE ${database_name} AS ${database_name}_${branch_name} FROM Disk('backups','${database_name}.${branch_name}.zip')"
echo "INFO: ${database_name}_${branch_name} Restore Finished"

elif [ $chosen_statement == 2 ]
then
echo Please choose a database name:
read -p "Database Name : " database_name

echo Please write a Clone name:
read -p "Clone Name : " branch_name

clickhouse-client --user ${username} --password ${password} --query "CREATE DATABASE ${database_name}_${branch_name}"
echo "INFO: ${database_name}_${branch_name} sucessfully createad WITHOUT DATA"

fi
