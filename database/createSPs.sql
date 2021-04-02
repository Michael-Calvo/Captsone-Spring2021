use posdb;
Delimiter $$
drop procedure if exists posdb.create_Menu$$
create procedure create_Menu 
(
	IN p_StoreID varchar(64),
    IN p_MenuName varchar(64),
    IN p_MenuType varchar(64),
	IN p_UUID varchar(64),
	IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
BEGIN
	declare currStoreID int;
    declare currMenuName varchar(64);
    declare currMenuType int;
	declare currUUID varchar(64);
	declare currIsActive int;
    declare currSortValue int;
    set currStoreID = cast(p_StoreID as unsigned);
    set currMenuName = p_MenuName;
    set currMenuType = cast(p_MenuType as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
    
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
		currUUID,
        currSortValue, 
        currIsActive,
        currStoreID, 
        currMenuType,
        currMenuName
	);
	set retID = last_insert_id();
END$$

drop procedure if exists read_Menu$$
create procedure read_Menu
(
    in p_IsActive varchar(64),
    in p_StoreID varchar(64),
	out op_StoreID int,
    out op_MenuName varchar(64),
    out op_MenuType int,
	out op_ID int,
    out op_UUID varchar(64),
	out op_IsActive int,
    out op_SortValue int
)
BEGIN
	declare currIsActive int;
    declare currStoreID int;
    set currIsActive = cast(p_IsActive as unsigned);
    set currStoreID = cast(p_StoreID as unsigned);
    SELECT `menu`.`StoreID`,
		`menu`.`MenuName`,
		`menu`.`MenuType`,
		`menu`.`ID`,
		`menu`.`UUID`,
		`menu`.`IsActive`,
		`menu`.`SortValue`
	FROM `posdb`.`menu`
    WHERE `Menu`.`IsActive` = currIsActive and
		`Menu`.`StoreID` = currStoreID;
END$$

drop procedure if exists update_Menu$$
create procedure update_Menu
(
	IN p_StoreID varchar(64),
    IN p_MenuName varchar(64),
    IN p_MenuType varchar(64),
	IN p_ID varchar(64),
    IN p_UUID varchar(64),
	IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retVal int
)
BEGIN
	declare currStoreID int;
    declare currMenuName varchar(64);
    declare currMenuType int;
	declare currID int;
    declare currUUID varchar(64);
	declare currIsActive int;
    declare currSortValue int;
    set currStoreID = cast(p_StoreID as unsigned);
    set currMenuName = p_MenuName;
    set currMenuType = cast(p_MenuType as unsigned);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	UPDATE `posdb`.`Menu` SET
		`SortValue` = currSortValue,
		`IsActive` = currIsActive,
		`StoreID` = currStoreID,
		`MenuType` = currMenuType,
		`MenuName` = currMenuName
	WHERE posdb.menu.UUID = currUUID and `ID` = currID;
	set retVal = 1;
END$$

drop procedure if exists posdb.delete_Menu$$
create procedure posdb.delete_Menu
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
BEGIN
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	UPDATE posdb.menu
    SET
		`IsActive` = currIsActive
	WHERE `ID` = currID and `UUID` = currUUID;
    SET retVal = 1;
END$$

drop procedure if exists create_MenuItem$$
create procedure create_MenuItem
(
	IN p_ItemName varchar(64),
    IN p_MenuID varchar(64),
    IN p_Price varchar(64),
    IN p_PriorityScore varchar(64),
    IN p_ExecutionTime varchar(64),
    IN p_UUID varchar(64),
	IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
BEGIN
	declare currItemName varchar(64);
    declare currMenuID int;
    declare currPrice double;
    declare currPriorityScore int;
    declare currExecutionTime int;
    declare currUUID varchar(64);
	declare currIsActive int;
    declare currSortValue int;
    set currItemName = p_ItemName;
    set currMenuID = cast(p_MenuID as unsigned);
    set currPrice = cast(p_Price as decimal(10,2));
    set currPriorityScore = cast(p_PriorityScore as unsigned);
    set currExecutionTime = cast(p_ExecutionTime as unsigned);
    set currUUID = p_UUID;
	set currIsActive = cast(p_IsActive as binary);
    set currSortValue = cast(p_SortValue as unsigned);
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
		currUUID,
        currSortValue, 
        currIsActive,
        currMenuID,
		currItemName,
		currPrice,
		currPriorityScore,
		currExecutionTime
	);
    set retID = last_insert_id();
END$$

drop procedure if exists read_MenuItem$$
create procedure read_MenuItem
(
	in p_MenuID varchar(64),
    in p_IsActive varchar(64),
    out op_ItemName varchar(64),
    out op_MenuID int,
    out op_Price double,
    out op_PriorityScore int,
    out op_ExecutionTime int,
    out op_ID int,
    out op_UUID varchar(64),
	out op_IsActive int,
    out op_SortValue int
)
BEGIN
	declare currMenuID int;
    declare currIsActive int;
    set currMenuID = cast(p_MenuID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    SELECT `MenuItem`.`ItemName`, 
		`MenuItem`.`MenuID`,
        `MenuItem`.`Price`,
        `MenuItem`.`PriorityScore`,
		`MenuItem`.`ExecutionTime`,
        `MenuItem`.`ID`,
		`MenuItem`.`UUID`,
		`MenuItem`.`IsActive`,
        `MenuItem`.`SortValue`
	FROM `posdb`.`MenuItem` WHERE `MenuItem`.`IsActive` = currIsActive and
		`MenuItem`.`MenuID` = currMenuID;
END$$

drop procedure if exists update_MenuItem$$
create procedure update_MenuItem
(
	IN p_ItemName varchar(64),
    IN p_MenuID varchar(64),
    IN p_Price varchar(64),
    IN p_PriorityScore varchar(64),
    IN p_ExecutionTime varchar(64),
	IN p_ID varchar(64),
    IN p_UUID varchar(64),
	IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retVal int
)
BEGIN
	declare currItemName varchar(64);
    declare currMenuID int;
    declare currPrice double;
    declare currPriorityScore int;
    declare currExecutionTime int;
	declare currID int;
    declare currUUID varchar(64);
	declare currIsActive int;
    declare currSortValue int;
    set currItemName = p_ItemName;
    set currMenuID = cast(p_MenuID as unsigned);
    set currPrice = cast(p_Price as decimal(10,2));
    set currPriorityScore = cast(p_PriorityScore as unsigned);
    set currExecutionTime = cast(p_ExecutionTIme as unsigned);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	UPDATE `posdb`.`MenuItem` SET
		`SortValue` = currSortValue,
		`IsActive` = currIsActive,
		`MenuID` = currMenuID,
		`ItemName` = currItemName,
		`Price` = currMenuName
	WHERE `UUID` = currUUID and `ID` = currID;
	set retVal = 1;
END$$

drop procedure if exists delete_MenuItem$$
create procedure delete_MenuItem
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
BEGIN
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	UPDATE `posdb`.`MenuItem` SET
		`IsActive` = currIsActive
	where `UUID` = currUUID and `ID` = currID;
    SET retVal = 1;
END$$

drop procedure if exists create_PosCheck$$
create procedure create_PosCheck
(
	IN p_TableID varchar(64),
    IN p_UserID varchar(64),
    IN p_CheckStatus varchar(64),
    IN p_DateStarted varchar(64),
    IN p_DateClosed varchar(64),
	IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
BEGIN
	declare currTableID int;
    declare currUserID int;
    declare currCheckStatus int;
    declare currDateStarted datetime;
    declare currDateClosed datetime;
	declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currTableID = cast(p_TableID as unsigned);
    set currUserID = cast(p_UserID as unsigned);
    set currCheckStatus = cast(p_CheckStatus as unsigned);
    set currDateStarted = cast(p_DateStarted as datetime);
    set currDateClosed = cast(p_DateClosed as datetime);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
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
		currUUID,
        currSortValue,
        currIsActive,
        currTableID,
        currUserID,
        currCheckStatus,
        currDateStarted,
        currDateClosed
    );
	set retID = last_insert_id();
END$$

drop procedure if exists read_PosCheck$$
create procedure read_PosCheck
(
	IN p_IsActive varchar(64),
    IN p_TableID varchar(64),
    IN p_UserID varchar(64),
    IN p_CheckStatus varchar(64),
	out op_TableID int,
    out op_UserID int,
    out op_CheckStatus int,
    out op_DateStarted datetime,
    out op_DateClosed datetime,
    out op_ID int,
	out op_UUID varchar(64),
    out op_IsActive int,
    out op_SortValue int
)
BEGIN
	declare currIsActive int;
    declare currTableID int;
    declare currUserID int;
    declare currCheckStatus int;
    set currIsActive = cast(p_IsActive as unsigned);
    set currTableID = cast(p_TableID as unsigned);
    set currUserID = cast(p_UserID as unsigned);
    set currCheckStatus = cast(p_CheckStatus as unsigned);
	SELECT `poscheck`.`TableID`,
    `poscheck`.`UserID`,
    `poscheck`.`CheckStatus`,
    `poscheck`.`DateStarted`,
    `poscheck`.`DateClosed`,
    `poscheck`.`ID`,
    `poscheck`.`UUID`,
    `poscheck`.`IsActive`,
    `poscheck`.`SortValue`    
	FROM `posdb`.`poscheck`
    where `IsActive` = currIsActive and
    `TableID` = currTableID and
    `UserID` = currUserID and
    `CheckStatus` = currCheckStatus;
END$$

drop procedure if exists delete_PosCheck$$
create procedure delete_PosCheck
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
BEGIN
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	UPDATE `posdb`.`poscheck`
	SET
		`IsActive` = currIsActive
	WHERE `ID` = currID and `UUID` = currUUID;
    SET retVal = 1;
END$$

drop procedure if exists create_PosTables$$
create procedure create_PosTables
(
	IN p_TableName varchar(64),
    IN p_StoreID varchar(64),
	IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
Begin
	declare currTableName varchar(64);
    declare currStoreID int;
	declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currTableName = p_TableName;
    set currStoreID = cast(p_StoreID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	INSERT INTO `posdb`.`postables`
		(`UUID`,
		`SortValue`,
		`IsActive`,
		`TableName`,
		`StoreID`)
	VALUES
		(currUUID,
        currSortValue,
		currIsActive,
		currTableName,
		currStoreID);
	SET retID = last_insert_id();
END$$

Drop procedure if exists read_PosTable$$
create procedure read_PosTable
(
	IN p_IsActive varchar(64),
    IN p_StoreID varchar(64),
    out op_TableName varchar(64),
    out op_StoreID int,
    out op_ID int,
	out op_UUID varchar(64),
    out op_IsActive int,
    out op_SortValue int
)
BEGIN
	declare currIsActive int;
    declare currStoreID int;
    set currIsActive = cast(p_IsActive as unsigned);
    set currStoreID = cast(p_StoreID as unsigned);
	SELECT `postables`.`TableName`,
    `postables`.`StoreID`,
    `postables`.`ID`,
    `postables`.`UUID`,
    `postables`.`sortValue`,
    `postables`.`isActive`
FROM `posdb`.`postables`
WHERE `StoreID` = currStoreID and
		`IsActive` = currIsActive;
END$$

Drop procedure if exists update_PosTable$$
create procedure update_PosTable
(
	IN p_TableName varchar(64),
    IN p_StoreID varchar(64),
    IN p_ID varchar(64),
    IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retVal int
)
BEGIN
	declare currTableName varchar(64);
    declare currStoreID int;
    declare currID int;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currTableName = p_TableName;
    set currStoreID = cast(p_StoreID as unsigned);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	UPDATE `posdb`.`postables`
		SET
			`sortValue` = currSortValue,
			`isActive` = currIsActive,
			`TableName` = currTableName,
			`StoreID` = currStoreID
		WHERE `ID` = currID AND `UUID` = currUUID;
	SET retVal = 1;
END$$

Drop procedure if exists delete_PosTable$$
create procedure delete_PosTable
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
BEGIN
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	UPDATE `posdb`.`postables`
		SET
			`IsActive` = currIsActive
		WHERE `ID` = currID AND `UUID` = currUUID;
	SET retVal = 1;
END$$

drop procedure if exists create_Ticket$$
create procedure create_Ticket
(
	IN p_DateStarted varchar(64),
    IN p_UserID varchar(64),
    IN p_TableID varchar(64),
    IN p_TicketStatus varchar(64),
    IN p_TicketType varchar(64),
	IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
BEGIN
	declare currDateStarted date;
    declare currUserID int;
    declare currTableID int;
    declare currTicketStatus int;
    declare currTicketType int;
    declare currID int;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currDateStarted = cast(p_DateStarted as date);
    set currUserID = cast(p_UserID as unsigned);
    set currTableID = cast(p_TableID as unsigned);
    set currTicketStatus = cast(p_TicketStatus as unsigned);
    set currTicketType = cast(p_TicketType as unsigned);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
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
		(currUUID,
        currSortValue,
        currIsActive,
        currDateStarted,
        currUserID,
        currTableID,
        currTicketStatus,
        currTicketType);
	SET retID = last_insert_id();
END$$

drop procedure if exists read_Ticket$$
create procedure read_Ticket
(
	IN p_UserID varchar(64),
    IN p_TableID varchar(64),
    IN p_IsActive varchar(64),
	out op_DateStarted date,
    out op_UserID int,
    out op_TableID int,
    out op_TicketStatus int,
    out op_TicketType int,
    out op_ID int,
	out op_UUID varchar(64),
    out op_IsActive int,
    out op_SortValue int
)
BEGIN
	declare currUserID int;
    declare currTableID int;
    declare currIsActive int;
    set currUserID = cast(p_UserID as unsigned);
    set currTableID = cast(p_TableID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
	SELECT `ticket`.`DateStarted`,
    `ticket`.`UserID`,
    `ticket`.`TableID`,
    `ticket`.`TicketStatus`,
    `ticket`.`TicketType`,
    `ticket`.`ID`,
    `ticket`.`UUID`,
    `ticket`.`isActive`,
    `ticket`.`sortValue`    
FROM `posdb`.`ticket`
    WHERE `UserID` = currUserID and
    `TableID` = currTableID and
    `IsActive` = currIsActive;
END$$

drop procedure if exists update_Ticket$$
create procedure update_Ticket
(
	IN p_DateStarted varchar(64),
    IN p_UserID varchar(64),
    IN p_TableID varchar(64),
    IN p_TicketStatus varchar(64),
    IN p_TicketType varchar(64),
	IN p_ID varchar(64),
    IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retVal int
)
BEGIN
	declare currDateStarted date;
    declare currUserID int;
    declare currTableID int;
    declare currTicketStatus int;
    declare currTicketType int;
    declare currID int;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currDateStarted = cast(p_DateStarted as date);
    set currUserID = cast(p_UserID as unsigned);
    set currTableID = cast(p_TableID as unsigned);
    set currTicketStatus = cast(p_TicketStatus as unsigned);
    set currTicketType = cast(p_TicketType as unsigned);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	UPDATE `posdb`.`ticket`
		SET
			`SortValue` = currSortValue,
			`IsActive` = currIsActive,
			`DateStarted` = currDateStarted,
			`UserID` = currUserID,
			`TableID` = currTableID,
			`TicketStatus` = currTicketStatus,
			`TicketType` = currTicketType
		WHERE `ID` = currID and `UUID` = currUUID;
	SET retVal = 1;
END$$

drop procedure if exists delete_Ticket$$
create procedure delete_Ticket
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
BEGIN
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	UPDATE `posdb`.`Ticket`
		SET `IsActive` = currIsActive
        WHERE `ID` = currID and `UUID` = currUUID;
	SET retVal = 1;
END$$

drop procedure if exists create_TicketItem$$
create procedure create_TicketItem
(
	IN p_TicketID varchar(64),
    IN p_MenuItemID varchar(64),
    IN p_ItemPrice varchar(64),
    IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
begin
	declare currTicketID int;
    declare currMenuItemID int;
    declare currItemPrice double;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currTicketID = cast(p_TicketID as unsigned);
    set currMenuItemID = cast(p_MenuItemID as unsigned);
    set currItemPrice = cast(p_ItemPrice as decimal(10, 2));
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	Insert into `posdb`.`TicketItem`
    (`UUID`,
    `IsActive`,
    `SortValue`,
    `TicketID`,
	`MenuItemID`,
    `ItemPrice`)
    values
    (currUUID,
    currIsActive,
    currSortValue,
    currTicketID,
    currMenuItemID,
    currItemPrice);
	set retID = last_insert_id();
END$$

Drop procedure if exists read_TicketItem$$
create procedure read_TicketItem
(
	IN p_IsActive varchar(64),
    IN p_TicketID varchar(64),
    out op_TicketID int,
    out op_MenuItemID varchar(64),
    out op_ItemPrice double,
    out op_ID int,
    out op_UUID varchar(64),
    out op_IsActive int,
    out op_SortValue int
)
begin
	declare currIsActive int;
    declare currTicketID int;
    set currIsActive = cast(p_IsActive as unsigned);
    set currTicketID = cast(p_TicketID as unsigned);
	SELECT `ticketitem`.`TicketID`,
    `ticketitem`.`MenuItemID`,
    `ticketitem`.`ItemPrice`,
    `ticketitem`.`ID`,
    `ticketitem`.`UUID`,
    `ticketitem`.`IsActive`,
    `ticketitem`.`SortValue`
FROM `posdb`.`ticketitem`
    where `IsActive` = currIsActive and
    `TicketID` = currTicketID;
end$$

Drop procedure if exists update_TicketItem$$
create procedure update_TicketItem
(
	IN p_TicketID varchar(64),
    IN p_MenuItemID varchar(64),
    IN p_ItemPrice varchar(64),
    IN p_ID varchar(64),
    IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retVal int
)
begin
	declare currTicketID int;
    declare currMenuItemID int;
    declare currItemPrice double;
    declare currID int;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currTicketID = cast(p_TicketID as unsigned);
    set currMenuItemID = cast(p_MenuItemID as unsigned);
    set currItemPrice = cast(p_ItemPrice as decimal(10,2));
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	update `posdb`.`TicketItem` set
		`IsActive` = currIsActive,
        `SortValue` = currSortValue,
        `TicketID` = currTicketID,
        `MenuItemID` = currMenuItemID,
        `ItemPrice` = currItemPrice
	where `ID` = currID and `UUID` = currUUID;
    set retVal = 1;
end$$

Drop procedure if exists delete_TicketItem$$
create procedure delete_TicketItem
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
begin
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	update `posdb`.`TicketItem` set
		`IsActive` = currIsActive
	where `ID` = currID and `UUID` = currUUID;
    set retVal = 1;
end$$

drop procedure if exists create_TransactionHistory$$
create procedure create_TransactionHistory
(
	IN p_FinalTotal varchar(64),
    IN p_CheckID varchar(64),
    IN p_UserID varchar(64),
    IN p_PaymentType varchar(64),
    IN p_PaymentStatus varchar(64),
    IN p_PaymentDate varchar(64),
    IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retID int
)
begin
    declare currFinalTotal double;
    declare currCheckID int;
    declare currUserID int;
    declare currPaymentType int;
    declare currPaymentStatus int;
    declare currPaymentDate date;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currFinalTotal = cast(p_FinalTotal as decimal(10,2));
    set currCheckID = cast(p_CheckID as unsigned);
    set currUserID = cast(p_UserID as unsigned);
    set currPaymentType = cast(p_PaymentType as unsigned);
    set currPaymentStatus = cast(p_PaymentStatus as unsigned);
    set currPaymentDate = cast(p_PaymentDate as date);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
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
        (currUUID,
        currIsActive,
        currSortValue,
        currFinalTotal,
        currCheckID,
        currUserID,
        currPaymentType,
        currPaymentStatus,
        currPaymentDate);
	Set retID = last_insert_id();
end$$

drop procedure if exists read_TransactionHistory$$
create procedure read_TransactionHistory
(
	IN p_IsActive varchar(64),
    IN p_UserID varchar(64),
    IN p_PaymentStatus varchar(64),
    out op_FinalTotal double,
    out op_CheckID int,
    out op_UserID int,
    out op_PaymentType int,
    out op_PaymentStatus int,
    out op_PaymentDate date,
    out op_ID int,
    out op_UUID varchar(64),
    out op_IsActive int,
    out op_SortValue int
)
begin
	declare currIsActive int;
    declare currUserID int;
    declare currPaymentStatus int;
    set currIsActive = cast(p_IsActive as unsigned);
    set currUserID = cast(p_UserID as unsigned);
    set currPaymentStatus = cast(p_PaymentStatus as unsigned);
	SELECT 
    `transactionhistory`.`FinalTotal`,
    `transactionhistory`.`CheckID`,
    `transactionhistory`.`UserID`,
    `transactionhistory`.`PaymentType`,
    `transactionhistory`.`PaymentStatus`,
    `transactionhistory`.`PaymentDate`,
    `transactionhistory`.`ID`,
    `transactionhistory`.`UUID`,
    `transactionhistory`.`IsActive`,
    `transactionhistory`.`SortValue`
FROM
    `posdb`.`transactionhistory`
WHERE
    `UserID` = currUserID
        AND `PaymentStatus` = currPaymentStatus
        AND `IsActive` = currIsActive;
end$$

drop procedure if exists update_TransactionHistory$$
create procedure update_TransactionHistory
(
	IN p_FinalTotal varchar(64),
    IN p_CheckID varchar(64),
    IN p_UserID varchar(64),
    IN p_PaymentType varchar(64),
    IN p_PaymentStatus varchar(64),
    IN p_PaymentDate varchar(64),
    IN p_ID varchar(64),
    IN p_UUID varchar(64),
    IN p_IsActive varchar(64),
    IN p_SortValue varchar(64),
    OUT retVal int
)
begin
    declare currFinalTotal double;
    declare currCheckID int;
    declare currUserID int;
    declare currPaymentType int;
    declare currPaymentStatus int;
    declare currPaymentDate date;
    declare currID int;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currFinalTotal = cast(p_FinalTotal as decimal(10,2));
    set currCheckID = cast(p_CheckID as unsigned);
    set currUserID = cast(p_UserID as unsigned);
    set currPaymentType = cast(p_PaymentType as unsigned);
    set currPaymentStatus = cast(p_PaymentStatus as unsigned);
    set currPaymentDate = cast(p_PaymentDate as date);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	update `posdb`.`TransactionHistory` set
        `IsActive` = currIsActive,
		`SortValue` = currSortValue,
        `FinalTotal` = currFinalTotal,
        `CheckID` = currCheckID,
        `UserID` = currUserID,
        `PaymentType` = currPaymentType,
        `PaymentStatus` = currPaymentStatus,
        `PaymentDate` = currPaymentDate
        where `ID` = currID and `UUID` = currUUID;
	set retVal = 1;
end$$

drop procedure if exists delete_TransactionHistory$$
create procedure delete_TransactionHistory
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
begin
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	update `posdb`.`TransactionHistory` set
        `IsActive` = currIsActive
        where `ID` = currID  and `UUID` = currUUID;
	set retVal = 1;
end$$

drop procedure if exists create_UserLU$$
create procedure create_UserLU
(
	in p_UserName varchar(64),
    in p_FirstName varchar(64),
    in p_LastName varchar(64),
    in p_RoleID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    in p_SortValue varchar(64),
    out retID int
)
begin
declare currUserName varchar(64);
declare currFirstName varchar(64);
declare currLastName varchar(64);
declare currRoleID int;
declare currUUID varchar(64);
declare currIsActive int;
declare currSortValue int;
set currUserName = p_UserName;
set currFirstName = p_FirstName;
set currLastName = p_LastName;
set currRoleID = cast(p_RoleID as unsigned);
set currUUID = p_UUID;
set currIsActive = cast(p_IsActive as unsigned);
set currSortValue = cast(p_SortValue as unsigned);
INSERT INTO `posdb`.`userlu`
(`UserName`,
`FirstName`,
`LastName`,
`RoleID`,
`UUID`,
`IsActive`,
`SortValue`)
VALUES
(currUserName,
currFirstName,
currLastName,
currRoleID,
currUUID,
currIsActive,
currSortValue);
set retID = last_insert_id();
end$$

drop procedure if exists read_UserLU$$
create procedure read_UserLU
(
	in p_UserName varchar(64),
	out op_UserName varchar(64),
    out op_FirstName varchar(64),
    out op_LastName varchar(64),
    out op_RoleID int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_IsActive int,
    out op_SortValue int
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
	in p_UserName varchar(64),
    in p_FirstName varchar(64),
    in p_LastName varchar(64),
    in p_RoleID varchar(64),
    in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    in p_SortValue varchar(64),
    out retVal int
)
begin
	declare currUserName varchar(64);
    declare currFirstName varchar(64);
    declare currLastName varchar(64);
    declare currRoleID int;
    declare currID int;
    declare currUUID varchar(64);
    declare currIsActive int;
    declare currSortValue int;
    set currUserName = p_UserName;
    set currFirstName = p_FirstName;
    set currLastName = p_LastName;
    set currRoleID = cast(p_RoleID as unsigned);
    set currID = cast(p_ID as unsigned);
    set currUUID = p_UUID;
    set currIsActive = cast(p_IsActive as unsigned);
    set currSortValue = cast(p_SortValue as unsigned);
	UPDATE `posdb`.`userlu`
	SET
		`UUID` = currUUID,
		`UserName` = currUserName,
		`FirstName` = currFirstName,
		`LastName` = currLastName,
		`RoleID` = currRoleID,
        `IsActive` = currIsActive,
        `SortValue` = currSortValue
	WHERE `ID` = currID;
	set retVal = 1;
end$$

drop procedure if exists delete_UserLU$$
create procedure delete_UserLU
(
	in p_ID varchar(64),
    in p_UUID varchar(64),
    in p_IsActive varchar(64),
    OUT retVal int
)
begin
	declare currID int;
    declare currUUID varchar(64);
    declare currIsActive bit;
    set currID = cast(p_ID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currUUID = p_UUID;
	UPDATE `posdb`.`userlu`
	SET
		`IsActive` = currIsActive
	WHERE `ID` = currID;
	set retVal = 1;
end$$

drop procedure if exists create_inventoryaudit$$
create procedure create_inventoryaudit
(
    in p_UUID varchar(64),
    in p_SortValue varchar(64),
    in p_IsActive varchar(64),
    in p_DatePerformed varchar(64),
    in p_StoreID varchar(64),
    in p_UserID varchar(64),
    in p_StockItemID varchar(64),
    in p_Quantity varchar(64),
    in p_Unit varchar(16),
    out retID int
)
begin
    declare currUUID varchar(64);
    declare currSortValue int;
    declare currIsActive int;
    declare currDatePerformed datetime;
    declare currStoreID int;
    declare currUserID int;
    declare currStockItemID int;
    declare currQuantity double;
    declare currUnit varchar(16);
    
    set currUUID = p_UUID;
    set currSortValue = cast(p_SortValue as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currDatePerformed = cast(p_currDatePerformed as datetime);
    set currStoreID = cast(p_StoreID as unsigned);
    set currUserID = cast(p_UserID as unsigned);
    set currStockItemID = cast(p_StockItemID as unsigned);
    set currQuantity = cast(p_Quantity as decimal(10,2));
    set currUnit = p_Unit;
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
	(currUUID,
	currSortValue,
	currIsActive,
	currDatePerformed,
	currStoreID,
	currUserID,
	currStockItemID,
	currQuantity,
	currUnit);
	set retID = last_insert_id();
end$$

drop procedure if exists read_inventoryaudit$$
create procedure read_inventoryaudit
(
	in p_StoreID varchar(64),
    in p_IsActive varchar(64),
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_StoreID int,
    out op_DatePerformed datetime,
    out op_UserID int,
    out op_StockItemID int,
    out op_Quantity double,
    out op_Unit varchar(16)
)
begin
	declare currStoreID int;
    declare currIsActive int;
    set currStoreID = cast(p_StoreID as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
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
    where `inventoryaudit`.`StoreID` = currStoreID
    and `inventoryaudit`.`IsActive` = currIsActive;
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
    in p_Unit varchar(124),
    out retval int
)
begin
	declare currID int;
    declare currUUID varchar(64);
    declare currSortValue int;
    declare currIsActive int;
    declare currStoreID int;
    declare currDatePerformed datetime;
    declare currUserID int;
    declare currStockItemID int;
    declare currQuantity double;
    declare currUnit varchar(12);
    set currID = cast(p_ID as unsigned);
    set currSortValue = cast(p_currSortValue as unsigned);
    set currIsActive = cast(p_IsActive as unsigned);
    set currStoreID = cast(p_StoreID as unsigned);
    set currDatePerformed = cast(p_DatePerformed as datetime);
    set currUserID = cast(p_UserID as unsigned);
    set currStockItemID = cast(p_StockItemID as unsigned);
    set currQuantity = cast(p_Quantity as decimal(10,2));

	UPDATE `posdb`.`inventoryaudit`
	SET
		`UUID` = p_UUID,
		`SortValue` = currSortValue,
		`IsActive` = currIsActive,
		`DatePerformed` = currDatePerformed,
		`StoreID` = currStoreID,
		`UserID` = currUserID,
		`StockItemID` = currStockItemID,
		`Quantity` = currQuantity,
		`Unit` = p_Unit
	WHERE `ID` = currID;
	set retVal = 1;
end$$

drop procedure if exists delete_inventoryaudit$$
create procedure delete_inventoryaudit
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retval int
)
begin
	UPDATE `posdb`.`inventoryaudit`
	SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID;
	set retVal = 1;
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
    in p_Quantity int,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_itemssold$$
create procedure read_itemssold
(
	in p_MenuItemID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_TicketItemID int,
    out op_MenuItemID int,
    out op_CurrDateTime datetime,
    out op_Quantity int
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
    in p_Quantity int,
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_itemssold$$
create procedure delete_itemssold
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`itemssold`
	SET
		`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_job$$
create procedure create_job
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_Wage double,
    in p_RoleID int,
    in p_UserID int,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_job$$
create procedure read_job
(
	in p_UserID int,
    in p_IsAcitve int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_Wage double,
    out op_RoleID int,
    out op_UserID int
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
    in p_UserID int,
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_job$$
create procedure delete_job
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`job`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_payperiod$$
create procedure create_payperiod
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_DateStart datetime,
    in p_DateEnd datetime,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_payperiod$$
create procedure read_payperiod
(
	in p_StoreID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_StoreID int,
    out op_DateStart datetime,
    out op_DateEnd datetime
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
    in p_DateStart datetime,
    in p_DateEnd datetime,
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_payperiod$$
create procedure delete_payperiod
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`payperiod`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_punch$$
create procedure create_punch
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_ShiftID int,
    in p_ClockIn datetime,
    in p_ClockOut datetime,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_punch$$
create procedure read_punch
(
	in p_ShiftID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_ShiftID int,
    out op_ClockIn datetime,
    out op_ClockOut datetime
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
    in p_ClockOut datetime,
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_punch$$
create procedure delete_punch
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`punch`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_recipe$$
create procedure create_recipe
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_MenuItemID int,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_recipe$$
create procedure read_recipe
(
	in p_MenuItemID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_MenuItemID int
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
    in p_MenuItemID int,
    out retVal int
)
begin
	UPDATE `posdb`.`recipe`
	SET
	`UUID` = p_UUID,
	`SortValue` = p_SortValue,
	`IsActive` = p_IsActive,
	`MenuItemID` = p_MenuItemID
	WHERE `ID` = p_ID;
    set retVal = 1;
end$$

drop procedure if exists delete_recipe$$
create procedure delete_recipe
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`recipe`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
    set retVal = 1;
end$$

drop procedure if exists create_schedule$$
create procedure create_schedule
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_PayPeriodID int,
    in p_JobID int,
    in p_UserID int,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_schedule$$
create procedure read_schedule
(
	in p_PayPeriodID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_PayPeriodID int,
    out op_JobID int,
    out op_UserID int
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
    in p_UserID int,
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_schedule$$
create procedure delete_schedule
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`schedule`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_shift$$
create procedure create_shift
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_ScheduleID int,
    in p_DateTimeStart datetime,
    in p_DateTimeEnd datetime,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_shift$$
create procedure read_shift
(
	in p_ScheduleID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_ScheduleID int,
    out op_DateTimeStart datetime,
    out op_DateTimeEnd datetime
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
    in p_DateTimeStart datetime,
    in p_DateTimeEnd datetime,
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_shift$$
create procedure delete_shift
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`shift`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
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
    in p_Unit varchar(16),
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_stockitem$$
create procedure read_stockitem
(
	in p_StoreID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_StoreID int,
    out op_StockItemName varchar(128),
    out op_Quantity double,
    out op_Unit varchar(16)
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
    in p_Unit varchar(16),
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_stockitem$$
create procedure delete_stockitem
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`stockitem`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_stockpurchase$$
create procedure create_stockpurchase
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_SellerID int,
    in p_StockItemID int,
    in p_DateArrival datetime,
    in p_Cost double,
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_stockpurchase$$
create procedure read_stockpurchase
(
	in p_StockItemID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_SellerID int,
    out op_StockItemID int,
    out op_DateArrival datetime,
    out op_Cost double
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
    in p_DateArrival datetime,
    in p_Cost double,
    out retVal int
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
    set retVal = 1;
end$$

drop procedure if exists delete_stockpurchase$$
create procedure delete_stockpurchase
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`stockpurchase`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
    set retVal = 1;
end$$

drop procedure if exists create_stockseller$$
create procedure create_stockseller
(
    in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_StoreID int,
    in p_StockSellerName varchar(128),
    in p_StockSellerType varchar(128),
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_stockseller$$
create procedure read_stockseller
(
	in p_StoreID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_StoreID int,
    out op_StockSellerName varchar(128),
    out op_StockSellerType varchar(128)
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
    in p_StockSellerType varchar(128),
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_stockseller$$
create procedure delete_stockseller
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`stockseller`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$

drop procedure if exists create_wastelog$$
create procedure create_wastelog
(
	in p_UUID varchar(64),
    in p_SortValue int,
    in p_IsActive int,
    in p_CurrDatetime datetime,
    in p_StockItemID int,
    in p_Quantity double,
    in p_Unit varchar(16),
    out retID int
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
	set retID = last_insert_id();
end$$

drop procedure if exists read_wastelog$$
create procedure read_wastelog
(
	in p_StockItemID int,
    in p_IsActive int,
    out op_ID int,
    out op_UUID varchar(64),
    out op_SortValue int,
    out op_IsActive int,
    out op_CurrDatetime datetime,
    out op_StockItemID int,
    out op_Quantity double,
    out op_Unit varchar(16)
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
    in p_CurrDatetime datetime,
    in p_StockItemID int,
    in p_Quantity double,
    in p_Unit varchar(16),
    out retVal int
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
	set retVal = 1;
end$$

drop procedure if exists delete_wastelog$$
create procedure delete_wastelog
(
	in p_ID int,
    in p_UUID varchar(64),
    in p_IsActive int,
    out retVal int
)
begin
	UPDATE `posdb`.`wastelog`
	SET
	`IsActive` = p_IsActive
	WHERE `ID` = p_ID and `UUID` = p_UUID;
	set retVal = 1;
end$$