drop user if exists 'posuser'@'localhost';
create user 'posuser'@'localhost' identified by '1q2w3e4r5t';
grant execute on posdb.* to 'posuser'@'localhost';