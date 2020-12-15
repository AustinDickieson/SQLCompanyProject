--AUSTIN DICKIESON, ARAN O BRIEN
--ANNIES SANDWICHES SQL DATABASE

--CREATE ALL TABLES
CREATE TABLE Customer
             (CustomerID          BIGINT    NOT NULL,
			  CustomerName        NVARCHAR(50)     NOT NULL,
	          CustomerEmail       NVARCHAR(50),
              LoyaltyPoints        Int,              
             DateJoined           Date            Not Null,
             FavSandwich         NVARCHAR(20),
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));

CREATE TABLE Employee
             (EmployeeID          BIGINT     NOT NULL,
			  EmployeeName        NVARCHAR(50)     NOT NULL,
	          EmpStreet       NVARCHAR(50),
			  EmpCity        NVARCHAR(20),
              EmpZipCode        BIGINT,              
			  EmployeeType     CHAR               Not Null, 
CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID));

CREATE TABLE Employee_Phone_Number
             (Phone_Number          BIGINT     NOT NULL,
			  EmployeeID          BIGINT     NOT NULL,
CONSTRAINT Employee_Phone_Number_PK PRIMARY KEY (Phone_Number),
CONSTRAINT Employee_Phone_Number_FK1 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)); 

CREATE TABLE Owner_
             (O_EmployeeID        BIGINT    NOT NULL,
			  Manager             BIT            NOT NULL,
			  Ownership_Percentage Int,

CONSTRAINT Owner_PK PRIMARY KEY (O_EmployeeID),
CONSTRAINT Owner_FK1 FOREIGN KEY (O_EmployeeID) REFERENCES Employee(EmployeeID));

CREATE TABLE Chef
             (C_EmployeeID        BIGINT    NOT NULL,
			  FoodLicense            BIT            NOT NULL,
			  Specialty             nvarchar(20),

CONSTRAINT Chef_PK PRIMARY KEY (C_EmployeeID),
CONSTRAINT Chef_FK1 FOREIGN KEY (C_EmployeeID) REFERENCES Employee(EmployeeID));

CREATE TABLE Salary
             (S_EmployeeID        BIGINT    NOT NULL,
			  StartDate           Date           NOT NULL,
			  SalaryAmount        BigInt    Not Null,

CONSTRAINT Salary_PK PRIMARY KEY (S_EmployeeID),
CONSTRAINT Salary_FK1 FOREIGN KEY (S_EmployeeID) REFERENCES Employee(EmployeeID));

CREATE TABLE Order_
             (OrderID        BIGINT    NOT NULL,
			  CustomerID      BIGINT   NOT NULL,
			  EmployeeID       BigInt    Not Null,
			  --OrderCost        Float        Not Null,
			  --NumItems         Int      Not Null, 

CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Order_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
Constraint Order_FK2 Foreign Key (EmployeeID) References Employee(EmployeeID));

CREATE TABLE Order_Info
             (OrderID        BIGINT    NOT NULL,
			  CustomerID      BIGINT    NOT NULL,
			  OrderDate        Date    Not Null,
			  OrderTime       Time     Not Null, 

CONSTRAINT Order_Info_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
CONSTRAINT Order_Info_FK2 FOREIGN KEY (OrderID) REFERENCES Order_(OrderID));

CREATE TABLE Ingredient
             (IngredientID        BIGINT    NOT NULL,
			  IngredientName     nvarchar(10)    NOT NULL,
			 Perishable          BIT          Not Null, 
			  LowStock          BIT        Not Null,
CONSTRAINT Ingredient_PK PRIMARY KEY (IngredientID));

CREATE TABLE Smoothie
             (SmoothieID        BIGINT   NOT NULL,
			  SmoothieName     nvarchar(10)    NOT NULL,
			  SmoothiePrice    float          Not Null, 
			  Vegetarian       BIT        Not Null, 

CONSTRAINT Smoothie_PK PRIMARY KEY (SmoothieID));

CREATE TABLE Sandwich
             (SandwichID        BIGINT  NOT NULL,
			  SandwichName     nvarchar(20)    NOT NULL,
			  SandwichPrice    float          Not Null, 
			  Vegetarian       BIT        Not Null, 

CONSTRAINT Sandwich_PK PRIMARY KEY (SandwichID));

CREATE TABLE SoftDrink
             (SoftDrinkID        BIGINT   NOT NULL,
			  SoftDrinkName     nvarchar(10)    NOT NULL,
			  SoftDrinkPrice    float          Not Null, 

CONSTRAINT SoftDrink_PK PRIMARY KEY (SoftDrinkID));

CREATE TABLE Smoothie_Order
             (SmoothieID        BIGINT    NOT NULL,
			  OrderID     BIGINT    NOT NULL,

CONSTRAINT Smoothie_Order_FK1 FOREIGN KEY (SmoothieID) REFERENCES Smoothie(SmoothieID),
CONSTRAINT Smoothie_Order_FK2 FOREIGN KEY (OrderID) REFERENCES Order_(OrderID));

CREATE TABLE Sandwich_Order
             (SandwichID        BIGINT    NOT NULL,
			  OrderID     BIGINT    NOT NULL,

CONSTRAINT Sandwich_Order_FK1 FOREIGN KEY (SandwichID) REFERENCES Sandwich(SandwichID),
CONSTRAINT Sandwich_Order_FK2 FOREIGN KEY (OrderID) REFERENCES Order_(OrderID));

CREATE TABLE SoftDrink_Order
             (SoftDrinkID        BIGINT    NOT NULL,
			  OrderID     BIGINT   NOT NULL,

CONSTRAINT SoftDrink_Order_FK1 FOREIGN KEY (SoftDrinkID) REFERENCES SoftDrink(SoftDrinkID),
CONSTRAINT SoftDrink_Order_FK2 FOREIGN KEY (OrderID) REFERENCES Order_(OrderID));
 

CREATE TABLE Smoothie_Ingredient
             (SmoothieID        BIGINT    NOT NULL,
			  IngredientID     BIGINT    NOT NULL,
			  Quantity         int           Not Null, 

CONSTRAINT Smoothie_Ingredient_FK1 FOREIGN KEY (SmoothieID) REFERENCES Smoothie(SmoothieID),
CONSTRAINT Smoothie_Ingredient_FK2 FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID));

CREATE TABLE Sandwich_Ingredient
             (SandwichID        BIGINT   NOT NULL,
			  IngredientID     BIGINT    NOT NULL,
			  Quantity         int           Not Null, 

CONSTRAINT Sandwich_Ingredient_FK1 FOREIGN KEY (SandwichID) REFERENCES Sandwich(SandwichID),
CONSTRAINT Sandwich_Ingredient_FK2 FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID));

--INSERT VALUES INTO ALL TABLES

--Select * From Customer
INSERT INTO Customer VALUES (12345, 'Guillem Badenes', 'gbadenes@scu.edu', 3, '11/19/20', 'Grilled Chicken');
INSERT INTO Customer VALUES (22345, 'Jack Stoecker', 'jstoecker@scu.edu', 3, '11/19/20', 'Veggie');
INSERT INTO Customer VALUES (23345, 'Martin Aasen', 'maasen@scu.edu', 5, '10/17/20', 'Cold Cut');
INSERT INTO Customer VALUES (23445, 'Terrell Smith', 'tsmith@scu.edu', 4, '11/18/20', 'Ham Roll');
INSERT INTO Customer VALUES (23455, 'Damani Osei', 'dosei@scu.edu', 2, '11/1/20', 'Ham & Cured Pork Roll');
INSERT INTO Customer VALUES (23456, 'Emil Christensen', 'echristensen@scu.edu', 1, '11/21/20', 'Pork Roll');
INSERT INTO Customer VALUES (33456, 'Liam Anderson', 'landerson@scu.edu', 5, '10/16/20', 'Vietnamese Meatballs');
INSERT INTO Customer VALUES (34456, 'Tennyson Stevens', 'tstevens@scu.edu', 4, '11/17/20', 'Shredded Chicken');
INSERT INTO Customer VALUES (34556, 'Alex Achramowickz', 'aa@scu.edu', 2, '11/20/20', 'Shredded Chicken With Onion');
INSERT INTO Customer VALUES (34566, 'Dayo Thomas', 'dthomas@scu.edu', 1, '11/21/20', 'BBQ Pork');
INSERT INTO Customer VALUES (34567, 'Javi Duran', 'jrduran@scu.edu', 10, '1/1/19', 'Grilled Pork');
INSERT INTO Customer VALUES (44567, 'Ale Barajas', 'a1barajas@scu.edu', 10, '12/28/18', 'Grilled Beef');
INSERT INTO Customer VALUES (45567, 'Isaac Addai', 'iaddai@scu.edu', 9, '2/10/20', 'Grilled Pork');
INSERT INTO Customer VALUES (45667, 'Saku Carter', 'scarter@scu.edu', 9, '2/22/20', 'Grilled Beef');
INSERT INTO Customer VALUES (45677, 'Cole Mootoka', 'cmook@scu.edu', 8, '3/1/20', 'Grilled Chicken');
INSERT INTO Customer VALUES (45678, 'Liam Johnson', 'ljohnson@scu.edu', 8, '3/2/20', 'Ham Roll');
INSERT INTO Customer VALUES (55678, 'Jack Murphy', 'jmurphy@scu.edu', 7, '4/10/20', 'Veggie');
INSERT INTO Customer VALUES (56678, 'Dylan Bartlett', 'dbartlett@scu.edu', 7, '5/1/20', 'Cold Cut');
INSERT INTO Customer VALUES (56778, 'Andreu Casas', 'acmundet@scu.edu', 6, '6/13/20', 'Pork Roll');
INSERT INTO Customer VALUES (56788, 'Ale Perez', 'aperez@scu.edu', 6, '8/8/2020', 'Shredded Chicken With Onion');

--Select * From Employee
INSERT INTO Employee VALUES (12345, 'Juani Neill', '6737 170th PL SE', 'Santa Clara', 95003, 'C');
INSERT INTO Employee VALUES(22345, 'Eduardo Lopez', 'Bellomy St', 'Santa Clara', 95003, 'C');
INSERT INTO Employee VALUES (23345, 'Caden Buckley', '465 Elm Street', 'Las Vegas', 89117, 'S');
INSERT INTO Employee VALUES (23445, 'Rodney Egdorf', '6737 170th PL SE', 'Santa Clara', 95003, 'S');
INSERT INTO Employee VALUES (23455, 'Julian Bravo', '6737 170th PL SE', 'Santa Clara', 95003, 'C');
INSERT INTO Employee VALUES (23456, 'Annie Van Phong', '1831 Arroyo Seco Dr', 'San Jose', 95125, 'O');
INSERT INTO Employee VALUES (33456, 'Pham Van Phong', '1831 Arroyo Seco Dr', 'San Jose', 95125, 'O');
INSERT INTO Employee VALUES (34456, 'Timothy Rast', '431 El Camino Real', 'Santa Clara', 95000, 'S');
INSERT INTO Employee VALUES (34556, 'Bishop Washington', 'Bellomy St', 'Santa Clara', 95003, 'S');
INSERT INTO Employee VALUES (34566, 'Nicholas Cudini', 'Cobh St', 'Cork City', 42129, 'O');

--Select * From Employee_Phone_Number WHERE EmployeeID=22345
Insert Into Employee_Phone_Number Values (4258943290,12345)
Insert Into Employee_Phone_Number Values (4258943030,22345)
Insert Into Employee_Phone_Number Values (4251234567,22345)
Insert Into Employee_Phone_Number Values (4258946681,23345)
Insert Into Employee_Phone_Number Values (4257856788,23445)
Insert Into Employee_Phone_Number Values (4257856445,23455)
Insert Into Employee_Phone_Number Values (2067117273,23456)
Insert Into Employee_Phone_Number Values (2317073117,33456)
Insert Into Employee_Phone_Number Values (4800809765,34456)
Insert Into Employee_Phone_Number Values (4558995290,34556)
Insert Into Employee_Phone_Number Values (4084087890,34566)

--Select * From Owner_ WHERE Manager='TRUE'
Insert Into Owner_ Values(23456, 1, 51)
Insert Into Owner_ Values(33456, 1, 24)
Insert Into Owner_ Values(34566, 0, 25)

--Select * From Chef 
Insert Into Chef Values(12345, 'TRUE', 'Grilled Chicken')
Insert Into Chef Values(22345, 'TRUE', 'Grilled Pork')
Insert Into Chef Values(23455, 'TRUE', 'Veggie')

--Select * From Salary WHERE SalaryAmount > 50000
Insert Into Salary Values(23345, '11/21/20', 50000)
Insert Into Salary Values(23445, '11/19/20', 50000)
Insert Into Salary Values(34456, '10/17/20', 50000)
Insert Into Salary Values(34556, '1/2/19', 75000)

--Select CustomerID,COUNT(OrderID) AS NumOfOrders From Order_ GROUP BY CustomerID
Insert Into Order_ Values(12345, 12345, 12345)
Insert Into Order_ Values(22345, 12345, 12345)
Insert Into Order_ Values(23345, 22345, 22345)
Insert Into Order_ Values(23445, 22345, 22345)
Insert Into Order_ Values(23455, 23345, 23445)
Insert Into Order_ Values(23456, 23345, 23345)
Insert Into Order_ Values(33456, 23445, 23445)
Insert Into Order_ Values(34456, 23445, 23445)
Insert Into Order_ Values(34556, 23455, 23455)
Insert Into Order_ Values(34566, 23455, 23455)
Insert Into Order_ Values(34567, 23456, 23456)
Insert Into Order_ Values(44567, 23456, 23456)
Insert Into Order_ Values(45567, 33456, 33456)
Insert Into Order_ Values(45667, 33456, 33456)
Insert Into Order_ Values(45677, 34456, 34456)
Insert Into Order_ Values(45678, 34456, 34456)
Insert Into Order_ Values(55678, 34556, 34556)
Insert Into Order_ Values(56678, 34556, 34556)
Insert Into Order_ Values(56778, 34566, 34566)
Insert Into Order_ Values(56788, 34566, 34566)
Insert Into Order_ Values(56789, 34567, 12345)
Insert Into Order_ Values(00000, 44567, 22345)
Insert Into Order_ Values(00001, 45567, 23345)
Insert Into Order_ Values(00002, 45667, 23445)
Insert Into Order_ Values(00003, 45677, 23455)
Insert Into Order_ Values(00004, 45678, 23456)
Insert Into Order_ Values(00005, 55678, 33456)
Insert Into Order_ Values(00006, 56678, 34456)
Insert Into Order_ Values(00007, 56778, 34556)
Insert Into Order_ Values(00008, 56788, 34566)

--Select * From Order_Info
Insert Into Order_Info Values(12345, 12345, '1/2/20','11:00')
Insert Into Order_Info Values(22345, 12345, '1/2/20','12:00')
Insert Into Order_Info Values(23345, 22345, '1/2/20','13:00')
Insert Into Order_Info Values(23445, 22345, '1/3/20','11:00')
Insert Into Order_Info Values(23455, 23345, '1/4/20','11:00')
Insert Into Order_Info Values(23456, 23345, '1/4/20','12:00')
Insert Into Order_Info Values(33456, 23445, '1/4/20','10:00')
Insert Into Order_Info Values(34456, 23445, '1/1/20','11:00')
Insert Into Order_Info Values(34556, 23455, '1/5/20','11:00')
Insert Into Order_Info Values(34566, 23455, '1/6/20','11:30')
Insert Into Order_Info Values(34567, 23456, '1/2/20','11:45')
Insert Into Order_Info Values(44567, 23456, '1/7/20','16:00')
Insert Into Order_Info Values(45567, 33456, '1/1/20','13:00')
Insert Into Order_Info Values(45667, 33456, '1/1/20','9:00')
Insert Into Order_Info Values(45677, 34456, '1/2/20','15:00')
Insert Into Order_Info Values(45678, 34456, '1/5/20','12:00')
Insert Into Order_Info Values(55678, 34556, '2/2/20','12:00')
Insert Into Order_Info Values(56678, 34556, '2/5/20','12:00')
Insert Into Order_Info Values(56778, 34566, '11/5/20','12:00')
Insert Into Order_Info Values(56788, 34566, '12/5/20','12:00')
Insert Into Order_Info Values(56789, 34567, '1/5/20','12:30')
Insert Into Order_Info Values(00000, 44567, '1/1/20','14:00')
Insert Into Order_Info Values(00001, 45567, '3/5/20','12:00')
Insert Into Order_Info Values(00002, 45667, '4/5/20','11:00')
Insert Into Order_Info Values(00003, 45677, '2/15/20','12:00')
Insert Into Order_Info Values(00004, 45678, '2/8/20','11:00')
Insert Into Order_Info Values(00005, 55678, '2/5/20','17:00')
Insert Into Order_Info Values(00006, 56678, '1/15/20','12:00')
Insert Into Order_Info Values(00007, 56778, '1/5/20','12:20')
Insert Into Order_Info Values(00008, 56788, '1/11/20','14:00')

--SELECT * FROM Ingredient
INSERT INTO Ingredient VALUES (1, 'Onion', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (2, 'Ham', 'TRUE','FALSE')
INSERT INTO Ingredient VALUES (3, 'BreadRoll', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (4, 'Chicken', 'TRUE','TRUE')
INSERT INTO Ingredient VALUES (5, 'Pate', 'TRUE','FALSE')
INSERT INTO Ingredient VALUES (6, 'Lettuce', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (7, 'Beef', 'TRUE','FALSE')
INSERT INTO Ingredient VALUES (8, 'Jalapeno', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (9, 'Mayo', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (10, 'Daikon', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (11, 'PorkRoll', 'TRUE','FALSE')
INSERT INTO Ingredient VALUES (12, 'Carrots', 'FALSE','TRUE')
INSERT INTO Ingredient VALUES (13, 'Cilantro', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (14, 'Egg', 'TRUE','FALSE')
INSERT INTO Ingredient VALUES (15, 'Avocado', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (16, 'Mango', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (17, 'Pineapple', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (18, 'Strawberry', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (19, 'Banana', 'FALSE','FALSE')
INSERT INTO Ingredient VALUES (20, 'Peach', 'FALSE','FALSE')

--SELECT * FROM Smoothie
INSERT INTO Smoothie VALUES (10,'MangoPass',5.25,'TRUE')
INSERT INTO Smoothie VALUES (11,'Strawberry',5.25,'TRUE')
INSERT INTO Smoothie VALUES (12,'Banana',5.25,'TRUE')
INSERT INTO Smoothie VALUES (13,'Mango',5.25,'TRUE')
INSERT INTO Smoothie VALUES (14,'Avocado',5.50,'TRUE')
INSERT INTO Smoothie VALUES (15,'Peach',5.25,'TRUE')
INSERT INTO Smoothie VALUES (16,'Pineapple',5.25,'TRUE')
INSERT INTO Smoothie VALUES (17,'MangoPine',5.25,'TRUE')
INSERT INTO Smoothie VALUES (18,'BananaStra',5.25,'TRUE')
INSERT INTO Smoothie VALUES (19,'PeachMango',5.50,'TRUE')
INSERT INTO Smoothie VALUES (20,'FruityVaca',6.00,'TRUE')

--CORRECTION TO CHANGE VARCHAR BUFFER
ALTER TABLE Sandwich ALTER COLUMN SandwichName VARCHAR(20)
ALTER TABLE SoftDrink ALTER COLUMN SoftDrinkName VARCHAR(20)

--SELECT * FROM Sandwich
INSERT INTO Sandwich VALUES (10,'Grilled Chicken',7.25,'FALSE')
INSERT INTO Sandwich VALUES (11,'Grilled Beef',7.50,'FALSE')
INSERT INTO Sandwich VALUES (12,'Grilled Pork',7.50,'FALSE')
INSERT INTO Sandwich VALUES (13,'Cold Cut',6.25,'FALSE')
INSERT INTO Sandwich VALUES (14,'Ham Roll',7.50,'FALSE')
INSERT INTO Sandwich VALUES (15,'Ham and Cured Pork Roll',8.00,'TRUE')
INSERT INTO Sandwich VALUES (16,'Pork Roll',7.50,'FALSE')
INSERT INTO Sandwich VALUES (17,'Veggie',5.25,'TRUE')
INSERT INTO Sandwich VALUES (18,'BBQ Pork',7.25,'FALSE')
INSERT INTO Sandwich VALUES (19,'Shredded Chicken with Onions',7.50,'FALSE')
INSERT INTO Sandwich VALUES (20,'Vietnamese Meatball',8.00,'FALSE')

--SELECT * FROM SoftDrink
INSERT INTO SoftDrink VALUES (10,'Guava Juice',3.25)
INSERT INTO SoftDrink VALUES (11,'Green Tea',2.50)
INSERT INTO SoftDrink VALUES (12,'Pepsi',2.50)
INSERT INTO SoftDrink VALUES (13,'Dr. Pepper',3.25)
INSERT INTO SoftDrink VALUES (14,'Coconut Juice',2.50)

--SELECT * FROM Smoothie_Order
Insert Into Smoothie_Order Values(11,12345)
Insert Into Smoothie_Order Values(12,12345)
Insert Into Smoothie_Order Values(11,22345)
Insert Into Smoothie_Order Values(15,23345)
Insert Into Smoothie_Order Values(16,23445)
Insert Into Smoothie_Order Values(20,23455)
Insert Into Smoothie_Order Values(11,23455)
Insert Into Smoothie_Order Values(14,23456)
Insert Into Smoothie_Order Values(18,56789)
Insert Into Smoothie_Order Values(10,0)
Insert Into Smoothie_Order Values(19,1)
Insert Into Smoothie_Order Values(12,2)
Insert Into Smoothie_Order Values(11,3)
Insert Into Smoothie_Order Values(20,4)
Insert Into Smoothie_Order Values(15,5)
Insert Into Smoothie_Order Values(14,6)
Insert Into Smoothie_Order Values(16,7)
Insert Into Smoothie_Order Values(19,8)

--SELECT * FROM Sandwich_Order
Insert Into Sandwich_Order Values(11,23345)
Insert Into Sandwich_Order Values(12,23345)
Insert Into Sandwich_Order Values(12,23445)
Insert Into Sandwich_Order Values(20,23455)
Insert Into Sandwich_Order Values(15,23456)
Insert Into Sandwich_Order Values(17,33456)
Insert Into Sandwich_Order Values(19,34456)
Insert Into Sandwich_Order Values(20,34556)
Insert Into Sandwich_Order Values(12,34566)
Insert Into Sandwich_Order Values(13,34567)
Insert Into Sandwich_Order Values(17,44567)
Insert Into Sandwich_Order Values(19,45567)
Insert Into Sandwich_Order Values(18,45667)
Insert Into Sandwich_Order Values(14,45677)
Insert Into Sandwich_Order Values(15,45678)
Insert Into Sandwich_Order Values(10,55678)
Insert Into Sandwich_Order Values(10,56678)
Insert Into Sandwich_Order Values(10,56778)
Insert Into Sandwich_Order Values(16,56788)
Insert Into Sandwich_Order Values(20,56789)

--SELECT * FROM SoftDrink_Order
Insert Into SoftDrink_Order Values(12,45677)
Insert Into SoftDrink_Order Values(11,45678)
Insert Into SoftDrink_Order Values(10,55678)
Insert Into SoftDrink_Order Values(10,56678)
Insert Into SoftDrink_Order Values(10,56778)
Insert Into SoftDrink_Order Values(10,4)
Insert Into SoftDrink_Order Values(12,5)
Insert Into SoftDrink_Order Values(13,6)
Insert Into SoftDrink_Order Values(13,7)
Insert Into SoftDrink_Order Values(13,8)

--SELECT * FROM Smoothie_Ingredient
INSERT INTO Smoothie_Ingredient VALUES (10,16,1)
INSERT INTO Smoothie_Ingredient VALUES (10,18,4)
INSERT INTO Smoothie_Ingredient VALUES (11,18,8)
INSERT INTO Smoothie_Ingredient VALUES (12,19,4)
INSERT INTO Smoothie_Ingredient VALUES (13,16,2)
INSERT INTO Smoothie_Ingredient VALUES (14,15,2)
INSERT INTO Smoothie_Ingredient VALUES (15,20,3)
INSERT INTO Smoothie_Ingredient VALUES (16,17,1)
INSERT INTO Smoothie_Ingredient VALUES (17,16,1)
INSERT INTO Smoothie_Ingredient VALUES (17,17,1)
INSERT INTO Smoothie_Ingredient VALUES (18,19,1)
INSERT INTO Smoothie_Ingredient VALUES (18,18,1)
INSERT INTO Smoothie_Ingredient VALUES (19,20,1)
INSERT INTO Smoothie_Ingredient VALUES (19,16,1)
INSERT INTO Smoothie_Ingredient VALUES (20,16,1)
INSERT INTO Smoothie_Ingredient VALUES (20,17,1)
INSERT INTO Smoothie_Ingredient VALUES (20,18,1)
INSERT INTO Smoothie_Ingredient VALUES (20,19,1)
INSERT INTO Smoothie_Ingredient VALUES (20,20,1)

--SELECT * FROM Sandwich_Ingredient
INSERT INTO Sandwich_Ingredient VALUES (10,4,2)
INSERT INTO Sandwich_Ingredient VALUES (10,3,1)
INSERT INTO Sandwich_Ingredient VALUES (11,7,2)
INSERT INTO Sandwich_Ingredient VALUES (11,3,1)
INSERT INTO Sandwich_Ingredient VALUES (12,11,2)
INSERT INTO Sandwich_Ingredient VALUES (12,3,1)
INSERT INTO Sandwich_Ingredient VALUES (13,1,2)
INSERT INTO Sandwich_Ingredient VALUES (13,2,2)
INSERT INTO Sandwich_Ingredient VALUES (13,3,1)
INSERT INTO Sandwich_Ingredient VALUES (14,2,2)
INSERT INTO Sandwich_Ingredient VALUES (14,3,1)
INSERT INTO Sandwich_Ingredient VALUES (15,2,2)
INSERT INTO Sandwich_Ingredient VALUES (15,11,2)
INSERT INTO Sandwich_Ingredient VALUES (15,3,1)
INSERT INTO Sandwich_Ingredient VALUES (16,11,2)
INSERT INTO Sandwich_Ingredient VALUES (16,3,1)
INSERT INTO Sandwich_Ingredient VALUES (17,1,2)
INSERT INTO Sandwich_Ingredient VALUES (17,6,2)
INSERT INTO Sandwich_Ingredient VALUES (17,10,2)
INSERT INTO Sandwich_Ingredient VALUES (17,12,2)
INSERT INTO Sandwich_Ingredient VALUES (18,11,2)
INSERT INTO Sandwich_Ingredient VALUES (18,3,1)
INSERT INTO Sandwich_Ingredient VALUES (19,4,2)
INSERT INTO Sandwich_Ingredient VALUES (19,1,2)
INSERT INTO Sandwich_Ingredient VALUES (19,3,1)
INSERT INTO Sandwich_Ingredient VALUES (20,2,4)
INSERT INTO Sandwich_Ingredient VALUES (20,7,2)
INSERT INTO Sandwich_Ingredient VALUES (20,3,1)

--VIEWS

--VIEWS 1
--EVERY SANDWICH AND ITS INGREDIENT LIST
CREATE VIEW Sandwich_Recipies AS 
SELECT Sandwich.SandwichID,Sandwich.SandwichName,
Sandwich_Ingredient.IngredientID,Sandwich_Ingredient.Quantity 
FROM Sandwich INNER JOIN Sandwich_Ingredient 
ON Sandwich.SandwichID = Sandwich_Ingredient.SandwichID

CREATE VIEW SandwichRecipieList AS 
SELECT SandwichName, Ingredient.IngredientName, Quantity 
FROM Sandwich_Recipies INNER JOIN Ingredient 
ON Sandwich_Recipies.IngredientID=Ingredient.IngredientID

SELECT * FROM SandwichRecipieList

--VIEW 2
--Display Items and Prices of Each Order

--First view connects all items in an order
CREATE VIEW FullOrders AS SELECT Order_.OrderID, Smoothie_Order.SmoothieID, Sandwich_Order.SandwichID, SoftDrink_Order.SoftDrinkID
FROM Order_ 
LEFT JOIN Smoothie_Order
	ON Order_.OrderID=Smoothie_Order.OrderID
LEFT JOIN Sandwich_Order
	ON Order_.OrderID=Sandwich_Order.OrderID
LEFT JOIN SoftDrink_Order
	ON Order_.OrderID=SoftDrink_Order.OrderID

--Then join order with prices and names of items in order
CREATE VIEW OrdersWithPrices AS SELECT FullOrders.OrderID, 
Smoothie.SmoothieName, Smoothie.SmoothiePrice,
Sandwich.SandwichName, Sandwich.SandwichPrice,
SoftDrink.SoftDrinkName, SoftDrink.SoftDrinkPrice
FROM FullOrders
LEFT JOIN Smoothie
	ON FullOrders.SmoothieID = Smoothie.SmoothieID
LEFT JOIN Sandwich
	ON FullOrders.SandwichID = Sandwich.SandwichID
LEFT JOIN SoftDrink
	ON FullOrders.SoftDrinkID = SoftDrink.SoftDrinkID

--Replace NULLS with 0s to sum prices in order correct
SELECT OrderID,OrdersWithPrices.SmoothiePrice,
OrdersWithPrices.SandwichPrice,OrdersWithPrices.SoftDrinkPrice,
COALESCE(OrdersWithPrices.SmoothiePrice,0)+
COALESCE(OrdersWithPrices.SandwichPrice,0)+
COALESCE(OrdersWithPrices.SoftDrinkPrice,0)
AS OrderTotal
FROM OrdersWithPrices

--VIEW 3
--Display amount of orders per customer to see most loyal
CREATE VIEW LoyalCustomer AS
Select Order_.CustomerID, Customer.CustomerName, 
COUNT(OrderID) AS NumOfOrders 
From Order_ 
INNER JOIN Customer ON Order_.CustomerID=Customer.CustomerID
GROUP BY Order_.CustomerID, Customer.CustomerName

SELECT * FROM LoyalCustomer WHERE NumOfOrders > 1
