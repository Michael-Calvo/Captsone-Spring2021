drop user if exists 'posuser'@'localhost';
create user 'posuser'@'localhost' identified by 'Burnt4Pizzas!';
grant execute on posdb.* to 'posuser'@'localhost';