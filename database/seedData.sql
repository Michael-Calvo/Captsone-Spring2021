Insert into posdb.menu
	(ID,
    sortValue,
    isActive,
    StoreID,
    MenuType,
    MenuName)
    values
    (1, 1, 1, 1, 1, "ChickenSands"),
    (2, 1, 1, 1, 2, "Chilis"),
    (3, 1, 1, 1, 3, "Drinks");

Insert into posdb.menuitem
	(ID,
    sortValue,
    isActive,
    MenuID,
    ItemName,
    Price,
    PriorityScore,
    ExecutionTIme)
    values
    (1, 1, 1, 1, "Spicy Fried CHX Sand", 20.00, 0, 0),
    (2, 2, 1, 1, "SweetNSavory Fried CHX Sand", 12.00, 0, 0),
    (3, 3, 1, 1, "GRILLED CHX Sand", 24.00, 0, 0),
    (4, 4, 1, 1, "Southern Comfort CHX", 16.00, 0, 0),
    (5, 5, 1, 1, "Buffalo Fried w Bleu", 22.00, 0, 0),
    (6, 6, 1, 1, "My Baby's Sweet CHX Sand", 15.00, 0, 0),
    (7, 1, 1, 2, "White Bean CHX Chili", 8.00, 0, 0),
    (8, 2, 1, 2, "TX CHILI", 5.00, 0, 0),
    (9, 3, 1, 2, "Carnitas Chili", 13.00, 0, 0),
    (10, 4, 1, 2, "A Deep Beanin Chili", 8.00, 0, 0),
    (11, 6, 1, 2, "Chili Cheese N Chips", 12.00, 0, 0),
    (12, 7, 1, 2, "Tortilla Chili", 7.00, 0, 0),
    (13, 1, 1, 3, "Margiritas", 3.00, 0, 0),
    (14, 2, 1, 3, "Rusty Nail", 5.00, 0, 0),
    (15, 3, 1, 3, "House Amber", 5.00, 0, 0),
    (16, 3, 1, 3, "House Porter", 4.00, 0, 0);

INSERT INTO `posdb`.`postables`
(`ID`,
`sortValue`,
`isActive`,
`TableName`,
`StoreID`)
VALUES
(1, 1, 1, "Dine In 1", 1),
(2, 1, 1, "Dine In 2", 1),
(3, 1, 1, "Take Out 1", 1),
(4, 1, 1, "Take Out 2", 1),
(5, 1, 1, "Bar 1", 1),
(6, 1, 1, "Bar 2", 1),
(7, 1, 1, "Bar 3", 1),
(8, 1, 1, "Bar 4", 1),
(9, 1, 1, "Bar 5", 1),
(10, 1, 1, "Bar 6", 1),
(11, 1, 1, "Patio 1", 1),
(12, 1, 1, "Patio 2", 1),
(13, 1, 1, "Patio 3", 1),
(14, 1, 1, "Patio 4", 1),
(15, 1, 1, "Patio 5", 1),
(16, 1, 1, "Rooftop 1", 1),
(17, 1, 1, "Rooftop 2", 1),
(18, 1, 1, "Rooftop 3", 1),
(19, 1, 1, "Rooftop 4", 1),
(20, 1, 1, "Rooftop 5", 1);

INSERT INTO `posdb`.`stockitem`
(`ID`,
`SortValue`,
`IsActive`,
`StoreID`,
`StockItemName`,
`Quantity`,
`Unit`)
VALUES
(1,1,1,1,"Frozen French Fries",2,"boxes");

INSERT INTO `posdb`.`userlu`
	(`ID`,
    `UserName`,
	`FirstName`,
	`LastName`,
	`RoleID`,
	`IsActive`,
	`SortValue`)
	VALUES
    (1,'devuser','dev','dummy',4,1,1),
    (2,'Calvo.michael1','Michael','Calvo',4,1,1),
    (3,'sandman210','Jason','Manning',4,1,1),
    (4,'darthscifiguy','Richard','Abrams',4,1,1),
    (5,'Over9000Spears','Ronald','Abrams',4,1,1),
    (6,'enashburn99','Emily','Ashburn',4,1,1),
    (7,'i.wilhelmsen13','Ian','Wilhelmsen',4,1,1);