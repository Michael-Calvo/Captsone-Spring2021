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

create table if not exists posdb.PayPeriod(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    StoreID int not null,
    DateStart datetime,
    DateEnd datetime,
    primary key(`ID`)
);

create table if not exists posdb.Schedule(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    PayPeriodID int not null,
    JobID int not null,
    UserID int not null,
    primary key(`ID`)
);
create table if not exists posdb.Shift(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    ScheduleID int not null,
    DateTimeStart datetime,
    DateTimeEnd datetime,
    primary key(`ID`)
);

create table if not exists posdb.Job(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    Wage double not null,
    RoleID int not null,
    UserID int not null,
    primary key(`ID`)
);

create table if not exists posdb.Punch(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    ShiftID int not null,
    ClockIn datetime,
    ClockOut datetime,
    primary key(`ID`)
);

create table if not exists posdb.ItemsSold(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    TicketID int not null,
    MenuItemID int not null,
    CurrDatetime datetime,
    Quantity int,
    primary key(`ID`)
);

create table if not exists posdb.WasteLog(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    CurrDatetime datetime,
    StockItemID int not null,
    Quantity double,
    Unit varchar(16),
    primary key(`ID`)
);

create table if not exists posdb.Recipe(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    MenuItemID int not null,
    primary key(`ID`)
);

create table if not exists posdb.RecipeItem(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    RecipeID int not null,
    StockItemID int not null,
    Quantity double,
    Unit varchar(16),
    EWP double,
    primary key(`ID`)
);

create table if not exists posdb.StockItem(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    StoreID int,
    StockItemName varchar(128),
    Quantity double,
    Unit varchar(16),
    primary key(`ID`)
);

create table if not exists posdb.StockPurchase(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    SellerID int not null,
    StockItemID int not null,
    DateArrival datetime not null,
    Cost double,
    primary key(`ID`)
);

create table if not exists posdb.StockSeller(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    StoreID int,
    StockSellerName varchar(128),
    StockSellerType varchar(128),
    primary key(`ID`)
);

create table if not exists posdb.InventoryAudit(
	ID int not null auto_increment,
    UUID varchar(64) not null,
    SortValue int default 0,
    IsActive INT default 1,
    StoreID int not null,
    DatePerformed datetime,
    UserID int not null,
    StockItemID int not null,
    Quantity double,
    Unit varchar(16),
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

alter table posdb.PayPeriod
	add foreign key
    payperiod_store (StoreID)
    references
    posdb.Store (ID)
    on update cascade
    on delete cascade;

alter table posdb.Schedule
	add foreign key
    schedule_payperiod (PayPeriodID)
    references
    posdb.PayPeriod (ID)
    on update cascade
    on delete cascade;

alter table posdb.Schedule
	add foreign key
    schedule_userlu (UserID)
    references
    posdb.UserLU (ID)
    on update cascade
    on delete cascade;

alter table posdb.Shift
	add foreign key
    shift_schedule (ScheduleID)
    references
    posdb.Schedule (ID)
    on update cascade
    on delete cascade;

alter table posdb.Job
	add foreign key
    job_role (RoleID)
    references
    posdb.RoleLU (ID)
    on update cascade
    on delete cascade;

alter table posdb.Job
	add foreign key
    job_user (UserID)
    references
    posdb.UserLU (ID)
    on update cascade
    on delete cascade;
    
alter table posdb.Punch
	add foreign key
    punch_shift (ShiftID)
    references
    posdb.Shift (ID)
    on update cascade
    on delete cascade;

alter table posdb.ItemsSold
	add foreign key
    itemssold_ticket (TicketID)
    references
    posdb.Ticket (ID)
    on update cascade
    on delete cascade;

alter table posdb.ItemsSold
	add foreign key
    itemssold_menuitem (MenuItemID)
    references
    posdb.MenuItem (ID)
    on update cascade
    on delete cascade;

alter table posdb.WasteLog
	add foreign key
    wastelog_stockitem (StockItemID)
    references
    posdb.StockItem (ID)
    on update cascade
    on delete cascade;

alter table posdb.Recipe
	add foreign key
    recipe_menuitemid (MenuItemID)
    references
    posdb.MenuItem (ID)
    on update cascade
    on delete cascade;

alter table posdb.RecipeItem
	add foreign key
    recipeitem_recipe (RecipeID)
    references
    posdb.Recipe (ID)
    on update cascade
    on delete cascade;

alter table posdb.StockPurchase
	add foreign key
    stockpurchase_stockitem (StockItemID)
    references
    posdb.StockItem (ID)
    on update cascade
    on delete cascade;
    
alter table posdb.InventoryAudit
	add foreign key
    inventoryaudit_store (StoreID)
    references
    posdb.Store (ID)
    on update cascade
    on delete cascade;
    
alter table posdb.StockItem
	add foreign key
    stockitem_store (StoreID)
    references
    posdb.Store (ID)
    on update cascade
    on delete cascade;
    
alter table posdb.stockseller
	add foreign key
    stockseller_store (StoreID)
    references
    posdb.Store (ID)
    on update cascade
    on delete cascade;