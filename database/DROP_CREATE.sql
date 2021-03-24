Drop database if exists `posdb`;
CREATE DATABASE `posdb`;
Create table if not exists posdb.PosCheck (

	  ID INT NOT NULL AUTO_INCREMENT,
	  UUID varchar(64) NOT NULL,
      IsActive INT NOT NULL default 1,
      SortValue int not null default 0,
	  TableID INT NOT NULL,
	  UserID INT NOT NULL,
	  CheckStatus INT NOT NULL,
	  DateStarted DATETIME NOT NULL,
	  DateClosed datetime NULL,
	  PRIMARY KEY (ID)
);
Create table if not exists posdb.CheckStatusLU (

	ID int NOT NULL,
	CheckStatus varchar(50) NULL,
    primary key(ID)
 );
Create table if not exists posdb.Menu(

	ID int NOT NULL auto_increment,
    UUID varchar(64) NOT NULL,
    IsActive INT NOT NULL default 1,
    SortValue int NOT NULL default 0,
	StoreID int NOT NULL,
    MenuName varchar(64) NULL,
	MenuType int NOT NULL,
	PRIMARY KEY (ID)
);
Create table if not exists posdb.MenuItem  (

	ID INT NOT NULL AUTO_INCREMENT,
    UUID varchar(64) NOT NULL,
    SortValue int NOT NULL default 0,
    IsActive INT NOT NULL default 1,
	MenuID int NOT NULL,
	ItemName varchar(64) NOT NULL,
	Price double NOT NULL,
	PriorityScore int NULL,
	ExecutionTime int NULL,
	primary key(ID)
);
Create table if not exists posdb.MenuTypeLU  (

	ID int NOT NULL,
	MenuType varchar(50) NULL,
    primary key(ID)
); 
Create table if not exists posdb.PaymentStatusLU  (

	ID INT NOT NULL AUTO_INCREMENT,
	PaymentStatusType varchar(64) NOT NULL,
	primary key(ID)
); 

Create table if not exists posdb.PaymentTypeLU (

	ID INT NOT NULL AUTO_INCREMENT,
	PaymentType varchar(64) NULL,
    primary key(ID)
); 

Create table if not exists posdb.RoleLU  (

	ID int NOT NULL,
	RoleType varchar(64) NULL,
	primary key(ID)
); 

Create table if not exists posdb.Store  (

	ID int NOT NULL,
	StoreName varchar(64) NOT NULL,
	primary key(ID)
); 

Create table if not exists posdb.POSTables  (

	ID INT NOT NULL AUTO_INCREMENT,
	UUID varchar(64) NOT NULL,
    sortValue int NOT NULL default 0,
    isActive INT NOT NULL default 1,
	TableName varchar(64) NOT NULL,
	StoreID int NOT NULL,
	primary key(ID)
); 

Create table if not exists posdb.TableStatusLU  (

	ID int NOT NULL,
	TableStatus varchar(64) NULL,
	primary key(ID)
); 

CREATE TABLE IF NOT EXISTS posdb.Ticket (

    ID INT NOT NULL AUTO_INCREMENT,
	UUID varchar(64) NOT NULL,
    sortValue int NOT NULL default 0,
    isActive INT NOT NULL default 1,
    DateStarted DATE NOT NULL,
    UserID INT NOT NULL,
    TableID INT NOT NULL,
    TicketStatus INT NOT NULL,
    TicketType INT NOT NULL,
    PRIMARY KEY (ID)
); 

Create table if not exists posdb.TicketStatusLU  (

	ID INT NOT NULL AUTO_INCREMENT,
	TicketStatus varchar(64) NULL,
	primary key(ID)
); 

CREATE TABLE IF NOT EXISTS posdb.TicketTypeLU (

    ID INT NOT NULL,
    TicketType varchar(64) NULL,
    PRIMARY KEY (ID)
); 

CREATE TABLE IF NOT EXISTS posdb.TransactionHistory (

    ID INT NOT NULL AUTO_INCREMENT,
    UUID varchar(64) not null,
    IsActive INT default 1,
    SortValue int default 0,
    CheckID INT NOT NULL,
    UserID INT NOT NULL,
    FinalTotal double not null,
    PaymentType INT NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentStatus INT NOT NULL,
    PRIMARY KEY (`ID`)
); 

Create table if not exists posdb.UserLU  (

	ID INT NOT NULL AUTO_INCREMENT,
	UserName varchar(64) NOT NULL,
	FirstName varchar(64) NOT NULL,
	LastName varchar(64) NOT NULL,
	RoleID int NOT NULL,
    UUID varchar(64) not null,
    IsActive int default 1,
    SortValue int default 0,
    primary key(`ID`)
);

create table if not exists posdb.TicketItem (

	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    TicketID int not null,
    MenuItemID int not null,
    ItemPrice double not null,
    primary key(`ID`)
);

Alter table posdb.TicketItem
	add foreign key
    ticket_ticketitem (TicketID)
    references 
posdb.ticket (ID)
    on update cascade
    on delete cascade;

Alter table posdb.TicketItem
	add foreign key
    menuitem_ticketitem (MenuItemID)
    references 
posdb.MenuItem (ID)
    on update cascade
    on delete cascade;

Alter table posdb.POSCheck
	ADD FOREIGN KEY
    check_table (TableId)
    references 
posdb.postables (ID)
    on update cascade
    on delete cascade;

Alter table posdb.POSCheck
	ADD FOREIGN KEY
    check_userLU (UserID)
    references 
posdb.UserLU (ID)
    on update cascade
    on delete cascade;
    
Alter table posdb.POSCheck
	ADD FOREIGN KEY
    check_checkstatus (CheckStatus)
    references 
posdb.checkstatuslu (ID)
    on update cascade
    on delete cascade;

Alter table posdb.menu
	ADD FOREIGN KEY
    menu_store (StoreID)
    references 
posdb.store (ID)
    on update cascade
    on delete cascade;


Alter table posdb.menu
	ADD FOREIGN KEY
    menu_menutype (menutype)
    references 
posdb.menutypelu (ID)
    on update cascade
    on delete cascade;

Alter table posdb.menuitem
	ADD FOREIGN KEY
    menuitem_menu (MenuID)
    references 
posdb.menu (ID)
    on update cascade
    on delete cascade;

alter table posdb.ticket
	add foreign key
    ticket_userid (UserID)
    references 
posdb.userlu (ID)
    on update cascade
    on delete cascade;

alter table posdb.ticket
	add foreign key
    ticket_resttable (TableID)
    references 
posdb.postables (ID)
    on update cascade
    on delete cascade;

alter table posdb.ticket
	add foreign key
    ticket_ticketstatuslu (TicketStatus)
    references 
posdb.ticketstatuslu (ID)
    on update cascade
    on delete cascade;
    
alter table posdb.ticket
	add foreign key
    ticket_tickettypelu (TicketType)
    references 
posdb.tickettypelu (ID)
    on update cascade
    on delete cascade;

alter table posdb.userlu
	add foreign key
    userlu_roleid (RoleID)
    references 
posdb.rolelu (ID)
    on update cascade
    on delete cascade;

alter table posdb.TransactionHistory
	add foreign key
    transact_restcheck (CheckID)
    references 
posdb.poscheck (ID)
    on update cascade
    on delete cascade;

alter table posdb.transactionhistory
	add foreign key
    transact_userlu (UserID)
    references 
posdb.userlu (ID)
    on update cascade
    on delete cascade;
    
alter table posdb.transactionhistory
	add foreign key
    transact_paymenttype (PaymentType)
    references 
posdb.paymenttypelu (ID)
    on update cascade
    on delete cascade;

alter table posdb.transactionhistory
	add foreign key
    transact_paymentstatus (PaymentStatus)
    references 
posdb.paymentstatuslu (ID)
    on update cascade
    on delete cascade;