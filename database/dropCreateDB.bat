set /P inputPath=Enter Path to Project Directory: 
c:
cd \Program Files\MySQL\MySQL Server 8.0\bin\
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\DROP_CREATE.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\createSPs.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\luInserts.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\dropCreateUser.sql"
mysql -u OTRUser --password=1q2w3e4r5t -h localhost -e "source %inputPath%\database\seedData.sql"
pause
exit