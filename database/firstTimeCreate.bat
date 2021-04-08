set /P inputPath=Enter Path to Project Directory: 
set /P mysqlPath=Enter Path to MySQL 8.0 bin Directory: 
cd %mysqlPath%
mysql -u root --password --host=localhost -e "source %inputPath%\database\createOTRUser.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\DROP_CREATE.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\createSPs.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\luInserts.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\dropCreateUser.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\seedData.sql"
pause
exit