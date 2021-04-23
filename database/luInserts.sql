INSERT INTO posdb.CheckStatusLU
           (ID
           ,CheckStatus)
     VALUES
           (1,'OPEN'),
		   (2,'CLOSED');

INSERT INTO posdb.MenuTypeLU
		(ID,MenuType)
	Values
		(1, 'CHX'),
		(2, 'CHILI'),
		(3, 'DRINKS');

Insert into posdb.PaymentStatusLU
		(ID, PaymentStatusType)
	values
		(1, 'OPEN'),
		(2, 'PAID'),
		(3, 'COMP'),
		(4, 'VOID');

Insert into posdb.PaymentTypeLU
		(ID, PaymentType)
	values
		(1, 'CASH'),
		(2, 'CARD'),
		(3, 'Check'),
		(4, 'GiftCard');

Insert into posdb.RoleLU
		(ID, RoleType)
	values
		(1, 'Server'),
		(2, 'Cook'),
		(3, 'Bartender'),
		(4, 'Manager');

Insert into posdb.TicketStatusLU
		(ID, TicketStatus)
	values
		(1, 'OPEN'),
		(2, 'SENT'),
		(3, 'WORKING'),
		(4, 'CLOSED');

Insert into posdb.TicketTypeLU
		(ID,TicketType)
	values
		(1,'KITCHEN'),
		(2,'BAR');

INSERT INTO `posdb`.`store`
(`ID`,
`StoreName`)
VALUES
(1,
'ChickuhnNChili');

