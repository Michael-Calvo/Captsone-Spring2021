use posdb;
Delimiter $$
drop procedure if exists posdb.create_Menu$$
create procedure create_Menu 
(
	IN p_UUID varchar(64),
	IN p_IsActive int,
    IN p_SortValue int,
	IN p_StoreID int,
    IN p_MenuName varchar(64),
    IN p_MenuType int
)
BEGIN
	INSERT INTO `posdb`.`Menu`
    (
		`UUID`,
        `SortValue`,
        `IsActive`,
        `StoreID`,
        `MenuType`,
        `MenuName`
	) VALUES
    (
		p_UUID,
        p_SortValue, 
        p_IsActive,
        p_StoreID, 
        p_MenuType,
        p_MenuName
	);
	select last_insert_id();
END$$

drop procedure if exists read_Menu$$
create procedure read_Menu
(
    in p_IsActive int,
    in p_StoreID int
)
BEGIN
	SELECT `menu`.`ID`,
    `menu`.`UUID`,
    `menu`.`IsActive`,
    `menu`.`SortValue`,
    `menu`.`StoreID`,
    `menu`.`MenuName`,
    `menu`.`MenuType`
	FROM `posdb`.`menu`
    WHERE `Menu`.`IsActive` = p_IsActive and
		`Menu`.`StoreID` = p_StoreID;
END$$

drop procedure if exists update_Menu$$
create procedure update_Menu
(
	IN p_ID int,
    IN p_UUID varchar(64),
	IN p_IsActive int,
    IN p_SortValue int,
    IN p_StoreID int,
    IN p_MenuName varchar(64),
    IN p_MenuType int
)
BEGIN
	UPDATE `posdb`.`Menu` SET
		`SortValue` = p_SortValue,
		`IsActive` = p_IsActive,
		`StoreID` = p_StoreID,
		`MenuType` = p_MenuType,
		`MenuName` = p_MenuName
	WHERE posdb.menu.UUID = p_UUID and `ID` = p_ID;
END$$

drop procedure if exists posdb.delete_Menu$$
create procedure posdb.delete_Menu
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
BEGIN
	UPDATE posdb.menu
    SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
END$$

drop procedure if exists create_MenuItem$$
create procedure create_MenuItem
(
	IN p_UUID varchar(64),
	IN p_IsActive int,
    IN p_SortValue int,
    IN p_MenuID int,
    IN p_ItemName varchar(64),
    IN p_Price double,
    IN p_PriorityScore int,
    IN p_ExecutionTime int
)
BEGIN
	INSERT INTO `posdb`.`MenuItem`
    (
		`UUID`,
        `SortValue`,
        `IsActive`,
        `MenuID`,
        `ItemName`,
        `Price`,
        `PriorityScore`,
        `ExecutionTime`
	) VALUES
    (
		p_UUID,
        p_SortValue, 
        p_IsActive,
        p_MenuID,
		p_ItemName,
		p_Price,
		p_PriorityScore,
		p_ExecutionTime
	);
    select last_insert_id();
END$$

drop procedure if exists read_MenuItem$$
create procedure read_MenuItem
(
    in p_IsActive int,
	in p_MenuID int
)
BEGIN
	SELECT `menuitem`.`ID`,
    `menuitem`.`UUID`,
    `menuitem`.`SortValue`,
    `menuitem`.`IsActive`,
    `menuitem`.`MenuID`,
    `menuitem`.`ItemName`,
    `menuitem`.`Price`,
    `menuitem`.`PriorityScore`,
    `menuitem`.`ExecutionTime`
	FROM `posdb`.`MenuItem` WHERE `MenuItem`.`IsActive` = p_IsActive and
		`MenuItem`.`MenuID` = p_MenuID;
END$$

drop procedure if exists update_MenuItem$$
create procedure update_MenuItem
(
	IN p_ID int,
    IN p_UUID varchar(64),
	IN p_IsActive int,
    IN p_SortValue int,
    IN p_MenuID int,
    IN p_ItemName varchar(64),
    IN p_Price double,
    IN p_PriorityScore int,
    IN p_ExecutionTime int
)
BEGIN
	UPDATE `posdb`.`MenuItem` SET
		`SortValue` = p_SortValue,
		`IsActive` = p_IsActive,
		`MenuID` = p_MenuID,
		`ItemName` = p_ItemName,
		`Price` = p_MenuName
	WHERE `UUID` = p_UUID and `ID` = p_ID;
END$$

drop procedure if exists delete_MenuItem$$
create procedure delete_MenuItem
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
BEGIN
	UPDATE `posdb`.`MenuItem` SET
		`IsActive` = p_IsActive
	where `UUID` = p_UUID and `ID` = p_ID;
END$$

drop procedure if exists create_PosCheck$$
create procedure create_PosCheck
(
	IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
	IN p_TableID int,
    IN p_UserID int,
    IN p_CheckStatus int,
    IN p_DateStarted varchar(64),
    IN p_DateClosed varchar(64)
)
BEGIN
	INSERT INTO `posdb`.`poscheck`
	(
		`UUID`,
        `IsActive`,
        `SortValue`,
		`TableID`,
		`UserID`,
		`CheckStatus`,
		`DateStarted`,
		`DateClosed`
	) VALUES
	(
		p_UUID,
        p_SortValue,
        p_IsActive,
        p_TableID,
        p_UserID,
        p_CheckStatus,
        p_DateStarted,
        p_DateClosed
    );
	select last_insert_id();
END$$

drop procedure if exists read_PosCheck$$
create procedure read_PosCheck
(
	IN p_IsActive int,
    IN p_TableID int,
    IN p_UserID int,
    IN p_CheckStatus int
)
BEGIN
	SELECT `poscheck`.`ID`,
    `poscheck`.`UUID`,
    `poscheck`.`IsActive`,
    `poscheck`.`SortValue`,
    `poscheck`.`TableID`,
    `poscheck`.`UserID`,
    `poscheck`.`CheckStatus`,
    `poscheck`.`DateStarted`,
    `poscheck`.`DateClosed`
	FROM `posdb`.`poscheck`
    where `IsActive` = p_IsActive and
    `TableID` = p_TableID and
    `UserID` = p_UserID and
    `CheckStatus` = p_CheckStatus;
END$$

drop procedure if exists delete_PosCheck$$
create procedure delete_PosCheck
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
BEGIN
	UPDATE `posdb`.`poscheck`
	SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
END$$

drop procedure if exists create_PosTables$$
create procedure create_PosTables
(
	IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
    IN p_TableName varchar(64),
    IN p_StoreID int
)
Begin
	INSERT INTO `posdb`.`postables`
		(`UUID`,
		`SortValue`,
		`IsActive`,
		`TableName`,
		`StoreID`)
	VALUES
		(p_UUID,
        p_SortValue,
		p_IsActive,
		p_TableName,
		p_StoreID);
	select last_insert_id();
END$$

Drop procedure if exists read_PosTable$$
create procedure read_PosTable
(
	IN p_IsActive int,
    IN p_StoreID int
)
BEGIN
	SELECT `postables`.`ID`,
    `postables`.`UUID`,
    `postables`.`sortValue`,
    `postables`.`isActive`,
    `postables`.`TableName`,
    `postables`.`StoreID`
	FROM `posdb`.`postables`
	WHERE `StoreID` = p_StoreID and
		`IsActive` = p_IsActive;
END$$

Drop procedure if exists update_PosTable$$
create procedure update_PosTable
(
	IN p_ID int,
    IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
	IN p_TableName varchar(64),
    IN p_StoreID int
)
BEGIN
	UPDATE `posdb`.`postables`
		SET
			`sortValue` = p_SortValue,
			`isActive` = p_IsActive,
			`TableName` = p_TableName,
			`StoreID` = p_StoreID
		WHERE `ID` = p_ID AND `UUID` = p_UUID;
END$$

Drop procedure if exists delete_PosTable$$
create procedure delete_PosTable
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
BEGIN
	UPDATE `posdb`.`postables`
		SET
			`IsActive` = p_IsActive
		WHERE `ID` = p_ID AND `UUID` = p_UUID;
END$$

drop procedure if exists create_Ticket$$
create procedure create_Ticket
(
	IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
    IN p_DateStarted varchar(64),
    IN p_UserID int,
    IN p_TableID int,
    IN p_TicketStatus int,
    IN p_TicketType int
)
BEGIN
	INSERT INTO `posdb`.`ticket`
		(`UUID`,
		`SortValue`,
		`IsActive`,
		`DateStarted`,
		`UserID`,
		`TableID`,
		`TicketStatus`,
		`TicketType`)
	VALUES
		(p_UUID,
        p_SortValue,
        p_IsActive,
        p_DateStarted,
        p_UserID,
        p_TableID,
        p_TicketStatus,
        p_TicketType);
	select last_insert_id();
END$$

drop procedure if exists read_Ticket$$
create procedure read_Ticket
(
	IN p_IsActive int,
    IN p_UserID int,
    IN p_TableID int
)
BEGIN
	SELECT `ticket`.`ID`,
    `ticket`.`UUID`,
    `ticket`.`sortValue`,
    `ticket`.`isActive`,
    `ticket`.`DateStarted`,
    `ticket`.`UserID`,
    `ticket`.`TableID`,
    `ticket`.`TicketStatus`,
    `ticket`.`TicketType`
	FROM `posdb`.`ticket`
    WHERE `UserID` = p_UserID and
    `TableID` = p_TableID and
    `IsActive` = p_IsActive;
END$$

drop procedure if exists update_Ticket$$
create procedure update_Ticket
(
	IN p_ID int,
    IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
    IN p_DateStarted varchar(64),
    IN p_UserID int,
    IN p_TableID int,
    IN p_TicketStatus int,
    IN p_TicketType int
)
BEGIN
	UPDATE `posdb`.`ticket`
		SET
			`SortValue` = p_SortValue,
			`IsActive` = p_IsActive,
			`DateStarted` = p_DateStarted,
			`UserID` = p_UserID,
			`TableID` = p_TableID,
			`TicketStatus` = p_TicketStatus,
			`TicketType` = p_TicketType
		WHERE `ID` = p_ID and `UUID` = p_UUID;
END$$

drop procedure if exists delete_Ticket$$
create procedure delete_Ticket
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
BEGIN
	UPDATE `posdb`.`Ticket`
		SET `IsActive` = p_IsActive
        WHERE `ID` = currID and `UUID` = p_UUID;
END$$

drop procedure if exists create_TicketItem$$
create procedure create_TicketItem
(
	IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
	IN p_TicketID int,
    IN p_MenuItemID int,
    IN p_ItemPrice double
)
begin
	Insert into `posdb`.`TicketItem`
    (`UUID`,
    `IsActive`,
    `SortValue`,
    `TicketID`,
	`MenuItemID`,
    `ItemPrice`)
    values
    (p_UUID,
    currIsActive,
    currSortValue,
    currTicketID,
    currMenuItemID,
    currItemPrice);
	select last_insert_id();
END$$

Drop procedure if exists read_TicketItem$$
create procedure read_TicketItem
(
	IN p_IsActive varchar(64),
    IN p_TicketID varchar(64)
)
begin
	SELECT `ticketitem`.`ID`,
    `ticketitem`.`UUID`,
    `ticketitem`.`SortValue`,
    `ticketitem`.`IsActive`,
    `ticketitem`.`TicketID`,
    `ticketitem`.`MenuItemID`,
    `ticketitem`.`ItemPrice`
	FROM `posdb`.`ticketitem`
    where `IsActive` = p_IsActive and
    `TicketID` = p_TicketID;
end$$

Drop procedure if exists update_TicketItem$$
create procedure update_TicketItem
(
	IN p_ID int,
    IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
	IN p_TicketID int,
    IN p_MenuItemID int,
    IN p_ItemPrice double
)
begin
	update `posdb`.`TicketItem` set
		`IsActive` = p_IsActive,
        `SortValue` = p_SortValue,
        `TicketID` = p_TicketID,
        `MenuItemID` = p_MenuItemID,
        `ItemPrice` = p_ItemPrice
	where `ID` = p_ID and `UUID` = p_UUID;
end$$

Drop procedure if exists delete_TicketItem$$
create procedure delete_TicketItem
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	update `posdb`.`TicketItem` set
		`IsActive` = p_IsActive
	where `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_TransactionHistory$$
create procedure create_TransactionHistory
(
	IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
    IN p_CheckID int,
    IN p_UserID int,
    IN p_FinalTotal double,
    IN p_PaymentType int,
    IN p_PaymentDate varchar(64),
    IN p_PaymentStatus int
)
begin
	insert into `posdb`.`TransactionHistory`
		(`UUID`,
        `IsActive`,
        `SortValue`,
        `FinalTotal`,
        `CheckID`,
        `UserID`,
        `PaymentType`,
        `PaymentStatus`,
        `PaymentDate`)
        values
        (p_UUID,
        p_IsActive,
        p_SortValue,
        p_FinalTotal,
        p_CheckID,
        p_UserID,
        p_PaymentType,
        p_PaymentStatus,
        p_PaymentDate);
	Select last_insert_id();
end$$

drop procedure if exists read_TransactionHistory$$
create procedure read_TransactionHistory
(
	IN p_IsActive int,
    IN p_UserID int,
    IN p_PaymentStatus int
)
begin
	SELECT `transactionhistory`.`ID`,
    `transactionhistory`.`UUID`,
    `transactionhistory`.`IsActive`,
    `transactionhistory`.`SortValue`,
    `transactionhistory`.`CheckID`,
    `transactionhistory`.`UserID`,
    `transactionhistory`.`FinalTotal`,
    `transactionhistory`.`PaymentType`,
    `transactionhistory`.`PaymentDate`,
    `transactionhistory`.`PaymentStatus`
	FROM `posdb`.`transactionhistory`
    WHERE `UserID` = p_UserID
	AND `PaymentStatus` = p_PaymentStatus
    AND `IsActive` = p_IsActive;
end$$

drop procedure if exists update_TransactionHistory$$
create procedure update_TransactionHistory
(
	IN p_ID int,
    IN p_UUID varchar(64),
    IN p_IsActive int,
    IN p_SortValue int,
    IN p_CheckID int,
    IN p_UserID int,
	IN p_FinalTotal double,
    IN p_PaymentType int,
    IN p_PaymentDate varchar(64),
    IN p_PaymentStatus int
)
begin
	update `posdb`.`TransactionHistory` set
        `IsActive` = p_IsActive,
		`SortValue` = p_SortValue,
        `FinalTotal` = p_FinalTotal,
        `CheckID` = p_CheckID,
        `UserID` = p_UserID,
        `PaymentType` = p_PaymentType,
        `PaymentStatus` = p_PaymentStatus,
        `PaymentDate` = p_PaymentDate
        where `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists delete_TransactionHistory$$
create procedure delete_TransactionHistory
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	update `posdb`.`TransactionHistory` set
        `IsActive` = p_IsActive
        where `ID` = p_ID  and `UUID` = p_UUID;
end$$

drop procedure if exists create_UserLU$$
create procedure create_UserLU
(
	in p_UserName varchar(64),
    in p_FirstName varchar(64),
    in p_LastName varchar(64),
    in p_RoleID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    in p_SortValue int
)
begin
	INSERT INTO `posdb`.`userlu`
	(`UserName`,
	`FirstName`,
	`LastName`,
	`RoleID`,
	`UUID`,
	`IsActive`,
	`SortValue`)
	VALUES
	(p_UserName,
	p_FirstName,
	p_LastName,
	p_RoleID,
	p_UUID,
	p_IsActive,
	p_SortValue);
	select last_insert_id();
end$$

drop procedure if exists read_UserLU$$
create procedure read_UserLU
(
	in p_UserName varchar(64)
)
begin
SELECT `userlu`.`UserName`,
    `userlu`.`FirstName`,
    `userlu`.`LastName`,
    `userlu`.`RoleID`,
    `userlu`.`ID`,
    `userlu`.`UUID`,
    `userlu`.`IsActive`,
    `userlu`.`SortValue`
FROM `posdb`.`userlu`
where `userlu`.`UserName` = p_UserName;
end$$

drop procedure if exists update_UserLU$$
create procedure update_UserLU
(
	in p_ID int,
	in p_UserName varchar(64),
    in p_FirstName varchar(64),
    in p_LastName varchar(64),
    in p_RoleID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    in p_SortValue int
)
begin
	UPDATE `posdb`.`userlu`
	SET
		`UUID` = p_UUID,
		`UserName` = p_UserName,
		`FirstName` = p_FirstName,
		`LastName` = p_LastName,
		`RoleID` = p_RoleID,
        `IsActive` = p_IsActive,
        `SortValue` = p_SortValue
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_UserLU$$
create procedure delete_UserLU
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`userlu`
	SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID;
end$$

drop procedure if exists create_inventoryaudit$$
create procedure create_inventoryaudit
(
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_DatePerformed varchar(64),
    in p_UserID int,
    in p_StockItemID int,
    in p_Quantity double,
    in p_Unit varchar(16)
)
begin
    INSERT INTO `posdb`.`inventoryaudit`
		(`UUID`,
		`SortValue`,
		`IsActive`,
		`DatePerformed`,
		`StoreID`,
		`UserID`,
		`StockItemID`,
		`Quantity`,
		`Unit`)
	VALUES
	(p_UUID,
	p_SortValue,
	p_IsActive,
	p_DatePerformed,
	p_StoreID,
	p_UserID,
	p_StockItemID,
	p_Quantity,
	p_Unit);
	select last_insert_id();
end$$

drop procedure if exists read_inventoryaudit$$
create procedure read_inventoryaudit
(
	in p_IsActive int,
    in p_StoreID int
)
begin
	SELECT `inventoryaudit`.`ID`,
    `inventoryaudit`.`UUID`,
    `inventoryaudit`.`SortValue`,
    `inventoryaudit`.`IsActive`,
    `inventoryaudit`.`StoreID`,
    `inventoryaudit`.`DatePerformed`,
    `inventoryaudit`.`UserID`,
    `inventoryaudit`.`StockItemID`,
    `inventoryaudit`.`Quantity`,
    `inventoryaudit`.`Unit`
	FROM `posdb`.`inventoryaudit`
    where `inventoryaudit`.`StoreID` = p_StoreID
    and `inventoryaudit`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_inventoryaudit$$
create procedure update_inventoryaudit
(
	in p_ID varchar(124),
    in p_UUID varchar(124),
    in p_SortValue varchar(124),
    in p_IsActive varchar(124),
    in p_StoreID varchar(124),
    in p_DatePerformed varchar(124),
    in p_UserID varchar(124),
    in p_StockItemID varchar(124),
    in p_Quantity varchar(124),
    in p_Unit varchar(124)
)
begin
	UPDATE `posdb`.`inventoryaudit`
	SET
		`UUID` = p_UUID,
		`SortValue` = p_SortValue,
		`IsActive` = p_IsActive,
		`DatePerformed` = p_DatePerformed,
		`StoreID` = p_StoreID,
		`UserID` = p_UserID,
		`StockItemID` = p_StockItemID,
		`Quantity` = p_Quantity,
		`Unit` = p_Unit
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_inventoryaudit$$
create procedure delete_inventoryaudit
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`inventoryaudit`
	SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID;
end$$

drop procedure if exists create_itemssold$$
create procedure create_itemssold
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_TicketID int,
    in p_MenuItem int,
    in p_CurrDatetime datetime,
    in p_Quantity int
)
begin
	INSERT INTO `posdb`.`itemssold`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`TicketID`,
		`MenuItemID`,
		`CurrDatetime`,
		`Quantity`)
	VALUES
	(
		p_UUID,
		p_SortValue,
        p_IsActive,
        p_TicketID,
        p_MenuItem,
        p_CurrDatetime,
        p_Quantity
	);
	select last_insert_id();
end$$

drop procedure if exists read_itemssold$$
create procedure read_itemssold
(
	in p_IsActive int,
	in p_MenuItemID int
)
begin
SELECT `itemssold`.`ID`,
    `itemssold`.`UUID`,
    `itemssold`.`SortValue`,
    `itemssold`.`IsActive`,
    `itemssold`.`TicketID`,
    `itemssold`.`MenuItemID`,
    `itemssold`.`CurrDatetime`,
    `itemssold`.`Quantity`
FROM `posdb`.`itemssold`
where `itemssold`.`MenuItemID` = p_MenuItemID
	and `itemssold`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_itemssold$$
create procedure update_itemssold
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_TicketID int,
    in p_MenuItemID int,
    in p_CurrDatetime datetime,
    in p_Quantity int
)
begin
	UPDATE `posdb`.`itemssold`
	SET
		`UUID` = p_UUID,
		`SortValue` = p_SortValue,
		`IsActive` = p_IsActive,
		`TicketID` = p_TicketID,
		`MenuItemID` = p_MenuItemID,
		`CurrDatetime` = p_CurrDatetime,
		`Quantity` = p_Quantity
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_itemssold$$
create procedure delete_itemssold
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`itemssold`
	SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_job$$
create procedure create_job
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_Wage double,
    in p_RoleID int,
    in p_UserID int
)
begin
	INSERT INTO `posdb`.`job`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`Wage`,
		`RoleID`,
		`UserID`)
	VALUES
	(
		p_UUID,
        p_SortValue,
        p_IsActive,
        p_Wage,
        p_RoleID,
        p_UserID
	);
	select last_insert_id();
end$$

drop procedure if exists read_job$$
create procedure read_job
(
	in p_IsAcitve int,
    in p_UserID int
)
begin
	SELECT `job`.`ID`,
    `job`.`UUID`,
    `job`.`SortValue`,
    `job`.`IsActive`,
    `job`.`Wage`,
    `job`.`RoleID`,
    `job`.`UserID`
	FROM `posdb`.`job`
    where `job`.`UserID` = p_UserID
    and `job`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_job$$
create procedure update_job
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_Wage double,
    in p_RoleID int,
    in p_UserID int
)
begin
	UPDATE `posdb`.`job`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`Wage` = p_Wage,
	`RoleID` = p_RoleID,
	`UserID` = p_UserID
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_job$$
create procedure delete_job
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`job`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_payperiod$$
create procedure create_payperiod
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_DateStart varchar(64),
    in p_DateEnd varchar(64)
)
begin
	INSERT INTO `posdb`.`payperiod`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`StoreID`,
		`DateStart`,
		`DateEnd`
	)
	VALUES
	(
		p_UUID,
		p_SortValue,
		p_IsActive,
		p_StoreID,
		p_DateStart,
		p_DateEnd
    );
	select last_insert_id();
end$$

drop procedure if exists read_payperiod$$
create procedure read_payperiod
(
	in p_IsActive int,
    in p_StoreID int
)
begin

	SELECT `payperiod`.`ID`,
    `payperiod`.`UUID`,
    `payperiod`.`SortValue`,
    `payperiod`.`IsActive`,
    `payperiod`.`StoreID`,
    `payperiod`.`DateStart`,
    `payperiod`.`DateEnd`
	FROM `posdb`.`payperiod`
    where `payperiod`.`StoreID` = p_StoreID
    and `payperiod`.`IsActive` = p_IsActive;

end$$

drop procedure if exists update_payperiod$$
create procedure update_payperiod
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_DateStart varchar(64),
    in p_DateEnd varchar(64)
)
begin
	UPDATE `posdb`.`payperiod`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`StoreID` = p_StoreID,
	`DateStart` = p_DateStart,
	`DateEnd` = p_DateEnd
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_payperiod$$
create procedure delete_payperiod
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`payperiod`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_punch$$
create procedure create_punch
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_ShiftID int,
    in p_ClockIn varchar(64),
    in p_ClockOut varchar(64)
)
begin
	INSERT INTO `posdb`.`punch`
		(
			`UUID`,
			`SortValue`,
			`IsActive`,
			`ShiftID`,
			`ClockIn`,
			`ClockOut`
		)
		VALUES
		(
			p_UUID,
            p_SortValue,
            p_IsActive,
            p_ShiftID,
            p_ClockIn,
            p_ClockOut
		);
	select last_insert_id();
end$$

drop procedure if exists read_punch$$
create procedure read_punch
(
	in p_IsActive int,
	in p_ShiftID int
)
begin
	SELECT `punch`.`ID`,
    `punch`.`UUID`,
    `punch`.`SortValue`,
    `punch`.`IsActive`,
    `punch`.`ShiftID`,
    `punch`.`ClockIn`,
    `punch`.`ClockOut`
	FROM `posdb`.`punch`
    where `punch`.`ShiftID` = p_ShiftID
    and `punch`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_punch$$
create procedure update_punch
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_ShiftID int,
    in p_ClockIn datetime,
    in p_ClockOut datetime
)
begin
	UPDATE `posdb`.`punch`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`ShiftID` = p_ShiftID,
	`ClockIn` = p_ClockIn,
	`ClockOut` = p_ClockOut
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_punch$$
create procedure delete_punch
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`punch`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_recipe$$
create procedure create_recipe
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_MenuItemID int
)
begin
	INSERT INTO `posdb`.`recipe`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`MenuItemID`
	)
	VALUES
	(
		p_UUID,
        p_SortValue,
        p_IsActive,
        p_MenuItemID
    );
	select last_insert_id();
end$$

drop procedure if exists read_recipe$$
create procedure read_recipe
(
	in p_IsActive int,
    in p_MenuItemID int
)
begin
	SELECT `recipe`.`ID`,
    `recipe`.`UUID`,
    `recipe`.`SortValue`,
    `recipe`.`IsActive`,
    `recipe`.`MenuItemID`
	FROM `posdb`.`recipe`
    where `recipe`.`MenuItemID` = p_MenuItemID
    and `recipe`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_recipe$$
create procedure update_recipe
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_MenuItemID int
)
begin
	UPDATE `posdb`.`recipe`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`MenuItemID` = p_MenuItemID
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_recipe$$
create procedure delete_recipe
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`recipe`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_schedule$$
create procedure create_schedule
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_PayPeriodID int,
    in p_JobID int,
    in p_UserID int
)
begin
	INSERT INTO `posdb`.`schedule`
	(
	`UUID`,
	`SortValue`,
	`IsActive`,
	`PayPeriodID`,
	`JobID`,
	`UserId`)
	VALUES
	(
		p_UUID,
        p_SortValue,
        p_IsActive,
        p_PayPeriodID,
        p_JobID,
        p_UserID
    );
	select last_insert_id();
end$$

drop procedure if exists read_schedule$$
create procedure read_schedule
(
	in p_IsActive int,
    in p_PayPeriodID int
)
begin
	SELECT `schedule`.`ID`,
    `schedule`.`UUID`,
    `schedule`.`SortValue`,
    `schedule`.`IsActive`,
    `schedule`.`PayPeriodID`,
    `schedule`.`JobID`,
    `schedule`.`UserID`
	FROM `posdb`.`schedule`
    where `Schedule`.`PayPeriodID` = p_PayPeriodID
    and `Schedule`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_schedule$$
create procedure update_schedule
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_PayPeriodID int,
    in p_JobID int,
    in p_UserID int
)
begin
	UPDATE `posdb`.`schedule`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`PayPeriodID` = p_PayPeriodID,
	`JobID` = p_JobID,
	`Employeeid` = p_UserID
	WHERE `schedule`.`ID` = p_ID;
end$$

drop procedure if exists delete_schedule$$
create procedure delete_schedule
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`schedule`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_shift$$
create procedure create_shift
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_ScheduleID int,
    in p_DateTimeStart varchar(64),
    in p_DateTimeEnd varchar(64)
)
begin
	INSERT INTO `posdb`.`shift`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`ScheduleID`,
		`DateTimeStart`,
		`DateTimeEnd`
	)
	VALUES
	(
		p_UUID,
        p_SortValue,
        p_IsActive,
        p_ScheduleID,
        p_DateTimeStart,
        p_DateTimeEnd
    );
	select last_insert_id();
end$$

drop procedure if exists read_shift$$
create procedure read_shift
(
	in p_IsActive int,
    in p_ScheduleID int
)
begin
	SELECT `shift`.`ID`,
    `shift`.`UUID`,
    `shift`.`SortValue`,
    `shift`.`IsActive`,
    `shift`.`ScheduleID`,
    `shift`.`DateTimeStart`,
    `shift`.`DateTimeEnd`
	FROM `posdb`.`shift`
    where `shift`.`ScheduleID` = p_ScheduleID
    and `shift`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_shift$$
create procedure update_shift
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_ScheduleID int,
    in p_DateTimeStart varchar(64),
    in p_DateTimeEnd varchar(64)
)
begin
	UPDATE `posdb`.`shift`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`ScheduleID` = p_ScheduleID,
	`DateTimeStart` = p_DateTimeStart,
	`DateTimeEnd` = p_DateTimeEnd
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_shift$$
create procedure delete_shift
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`shift`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_stockitem$$
create procedure create_stockitem
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_StockItemName varchar(128),
    in p_Quantity double,
    in p_Unit varchar(16)
)
begin
	INSERT INTO `posdb`.`stockitem`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`StoreID`,
		`StockItemName`,
		`Quantity`,
		`Unit`
    )
	VALUES
	(
		p_UUID,
        p_SortValue,
        p_IsActive,
        p_StoreID,
        p_StockItemName,
        p_Quantity,
        p_Unit
	);
	select last_insert_id();
end$$

drop procedure if exists read_stockitem$$
create procedure read_stockitem
(
	in p_IsActive int,
    in p_StoreID int
)
begin
	SELECT `stockitem`.`ID`,
    `stockitem`.`UUID`,
    `stockitem`.`SortValue`,
    `stockitem`.`IsActive`,
    `stockitem`.`StoreID`,
    `stockitem`.`StockItemName`,
    `stockitem`.`Quantity`,
    `stockitem`.`Unit`
	FROM `posdb`.`stockitem`
    where `stockitem`.`StoreID` = p_StoreID
    and `stockitem`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_stockitem$$
create procedure update_stockitem
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_StockItemName varchar(128),
    in p_Quantity double,
    in p_Unit varchar(16)
)
begin
	UPDATE `posdb`.`stockitem`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`StoreID` = p_StoreID,
	`StockItemName` = p_StockItemName,
	`Quantity` = p_Quantity,
	`Unit` = p_Unit
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_stockitem$$
create procedure delete_stockitem
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`stockitem`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_stockpurchase$$
create procedure create_stockpurchase
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_SellerID int,
    in p_StockItemID int,
    in p_DateArrival varchar(64),
    in p_Cost double
)
begin
	INSERT INTO `posdb`.`stockpurchase`
	(
		`UUID`,
		`SortValue`,
		`IsActive`,
		`SellerID`,
		`StockItemID`,
		`DateArrival`,
		`Cost`
    )
	VALUES
	(p_UUID,
    p_SortValue,
    p_IsActive,
    p_SellerID,
    p_StockItemID,
    p_DateArrival,
    p_Cost);
	select last_insert_id();
end$$

drop procedure if exists read_stockpurchase$$
create procedure read_stockpurchase
(
	in p_IsActive int,
    in p_StockItemID int
)
begin
	SELECT `stockpurchase`.`ID`,
    `stockpurchase`.`UUID`,
    `stockpurchase`.`SortValue`,
    `stockpurchase`.`IsActive`,
    `stockpurchase`.`SellerID`,
    `stockpurchase`.`StockItemID`,
    `stockpurchase`.`DateArrival`,
    `stockpurchase`.`Cost`
	FROM `posdb`.`stockpurchase`
    where `stockpurchase`.`StockItemID` = p_StockItemID
    and `stockpurchase`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_stockpurchase$$
create procedure update_stockpurchase
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_SellerID int,
    in p_StockItemID int,
    in p_DateArrival varchar(64),
    in p_Cost double
)
begin
	UPDATE `posdb`.`stockpurchase`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`SellerID` = p_SellerID,
	`StockItemID` = p_StockItemID,
	`DateArrival` = p_DateArrival,
	`Cost` = p_Cost
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_stockpurchase$$
create procedure delete_stockpurchase
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`stockpurchase`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_stockseller$$
create procedure create_stockseller
(
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_StockSellerName varchar(128),
    in p_StockSellerType varchar(128)
)
begin
	INSERT INTO `posdb`.`stockseller`
	(`UUID`,
	`SortValue`,
	`IsActive`,
    `StoreID`,
	`StockSellerName`,
	`StockSellerType`)
	VALUES
	(p_UUID,
    p_SortValue,
    p_IsActive,
    p_StoreID,
    p_StockSellerName,
    p_StockSellerType);
	select last_insert_id();
end$$

drop procedure if exists read_stockseller$$
create procedure read_stockseller
(
	in p_IsActive int,
    in p_StoreID int
)
begin
	SELECT `stockseller`.`ID`,
    `stockseller`.`UUID`,
    `stockseller`.`SortValue`,
    `stockseller`.`IsActive`,
    `stockseller`.`StoreID`,
    `stockseller`.`StockSellerName`,
    `stockseller`.`StockSellerType`
	FROM `posdb`.`stockseller`
    where `stockseller`.`StoreID` = p_StoreID
    and `stockseller`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_stockseller$$
create procedure update_stockseller
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_StockSellerName varchar(128),
    in p_StockSellerType varchar(128)
)
begin
	UPDATE `posdb`.`stockseller`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
    `StoreID` = p_StoreID,
	`StockSellerName` = p_StockSellerName,
	`StockSellerType` = p_StockSellerType
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_stockseller$$
create procedure delete_stockseller
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`stockseller`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$

drop procedure if exists create_wastelog$$
create procedure create_wastelog
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_CurrDatetime varchar(64),
    in p_StockItemID int,
    in p_Quantity double,
    in p_Unit varchar(16)
)
begin
	INSERT INTO `posdb`.`wastelog`
	(`UUID`,
	`SortValue`,
	`IsActive`,
	`CurrDatetime`,
	`StockItemID`,
	`Quantity`,
	`Unit`)
	VALUES
	(p_UUID,
    p_SortValue,
    p_IsActive,
    p_CurrDatetime,
    p_StockItemID,
    p_Quantity,
    p_Unit);
	select last_insert_id();
end$$

drop procedure if exists read_wastelog$$
create procedure read_wastelog
(
	in p_IsActive int,
    in p_StockItemID int
)
begin
	SELECT `wastelog`.`ID`,
    `wastelog`.`UUID`,
    `wastelog`.`SortValue`,
    `wastelog`.`IsActive`,
    `wastelog`.`CurrDatetime`,
    `wastelog`.`StockItemID`,
    `wastelog`.`Quantity`,
    `wastelog`.`Unit`
	FROM `posdb`.`wastelog`
    where `wastelog`.`StockItemID` = p_StockItemID
    and `wastelog`.`IsActive` = p_IsActive;
end$$

drop procedure if exists update_wastelog$$
create procedure update_wastelog
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_CurrDatetime varchar(64),
    in p_StockItemID int,
    in p_Quantity double,
    in p_Unit varchar(16)
)
begin
	UPDATE `posdb`.`wastelog`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`CurrDatetime` = p_CurrDatetime,
	`StockItemID` = p_StockItemID,
	`Quantity` = p_Quantity,
	`Unit` = p_Unit
	WHERE `ID` = p_ID;
end$$

drop procedure if exists delete_wastelog$$
create procedure delete_wastelog
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int
)
begin
	UPDATE `posdb`.`wastelog`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
end$$