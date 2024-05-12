


*************** /*     TRAVEL_AGENCY MANAGEMENT  SYSTEM   */ *************


CREATE TABLE Customers (
    CustomerID INT  NOT NULL PRIMARY KEY,
    Name VARCHAR(5000),
    Email VARCHAR(500)
)

INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'kamal', 'kamal@example.com'),
(2, 'Ashraf', 'ashraf@example.com'),
(3, 'Pamel', 'Pamel@example.com'),
(4, 'Saif', 'saif@example.com'),
(5, 'Tanvir', 'Tanvir@example.com'),
(6, 'Jashim', 'jashim@example.com'),
(7, 'Shorif', 'shorif@example.com'),
(8, 'Tarek', 'tarek@example.com'),
(9, 'Rahi', 'rahi@example.com'),
(10, 'Shawon', 'shawon@example.com');



CREATE TABLE Destinations (
    DestinationID INT  NOT NULL PRIMARY KEY,
    Name VARCHAR(500),
    Description VARCHAR(900),
    Country VARCHAR(500)
);

INSERT INTO Destinations (DestinationID, Name, Description, Country) VALUES
(1, 'Sajek', 'City of cloud', 'Rangamati'),
(2, 'Nafakom', 'Beautiful Waterfall', 'Bnadarban'),
(3, 'Tangoar Haor', '2nd largest haor in BD', 'Sonamgonj'),
(4, 'Kapai Lake', 'Beautiful man made lake', 'Kaptai'),
(5, 'Coxs bazar', 'Largest Beach in the World', 'coxsbazar'),
(6, 'Sairo', 'Beautiful Hill resort ', 'Bandarban'),
(7, 'Saintmartin', 'Cocunut Island', 'Bangladesh'),
(8, 'Srimongol', 'The city of tea', 'Shylet'),
(9, 'Bali', 'The Island of Gods', 'Indonesia'), 
(10, 'Nayagra fall', ' A natural wonder', 'USA');


CREATE TABLE Flights (
    FlightID INT NOT NULL  PRIMARY KEY,
    DestinationID INT,
    DepartureDate DATE,
    ArrivalDate DATE,
    Price DECIMAL(10, 2),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID)
);

INSERT INTO Flights (FlightID, DestinationID, DepartureDate, ArrivalDate, Price) VALUES
(1, 1, '2024-05-01', '2024-05-05', 500.00),
(2, 2, '2024-06-01', '2024-06-05', 600.00),
(3, 3, '2024-07-01', '2024-07-07', 800.00),
(4, 4, '2024-08-01', '2024-08-07', 900.00),
(5, 5, '2024-09-01', '2024-09-07', 1000.00),
(6, 6, '2024-10-01', '2024-10-07', 700.00),
(7, 7, '2024-11-01', '2024-11-07', 750.00),
(8, 8, '2024-12-01', '2024-12-07', 850.00),
(9, 9, '2025-01-01', '2025-01-07', 950.00),
(10, 10, '2025-02-01', '2025-02-07', 550.00);


CREATE TABLE Hotels (
    HotelID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(900),
    Address VARCHAR(900),
    Rating DECIMAL(3, 1)
);

INSERT INTO Hotels (HotelID, Name, Address, Rating) VALUES
(1, 'Sajek', 'rangamati', 4.6),
(2, 'Nafakom' , 'Bnadarban',4.3),
(3, 'Tangoar Haor', 'Sonamgonj,Tahirpor',4.8),
(4, 'Kapai Lake','Kaptai',4.2),
(5, 'Coxs bazar', 'coxsbazar',4.9),
(6, 'Sairo', 'Bandarban',4.4),
(7, 'Saintmartin','Bangladesh',4.8),
(8, 'Srimongol','Shylet',4.5),
(9, 'Bali', 'Indonesia',4.4),
(10, 'Nayagra fall', 'USA',4.6);


CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    FlightID INT,
    HotelID INT,
    BookingDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

INSERT INTO Bookings (BookingID, CustomerID, FlightID, HotelID, BookingDate) VALUES
(1, 1, 1, 1, '2024-04-26'),
(2, 2, 2, 2, '2024-04-26'),
(3, 3, 3, 3, '2024-04-27'),
(4, 4, 4, 4, '2024-04-27'),
(5, 5, 5, 5, '2024-04-28'),
(6, 6, 6, 6, '2024-04-28'),
(7, 7, 7, 7, '2024-04-29'),
(8, 8, 8, 8, '2024-04-29'),
(9, 9, 9, 9, '2024-04-30'),
(10, 10, 10, 10, '2024-04-30');


CREATE TABLE Activities (
    ActivityID INT PRIMARY KEY,
    Name VARCHAR(600),
    Description TEXT
);

INSERT INTO Activities (ActivityID, Name, Description) VALUES

(1, 'Sajek', 'Adventure the nature,cloud and rain'),
(2, 'Nafakom' , 'Wonder of nature over hill'),
(3, 'Tangoar Haor', 'Infinity view of haor with rain'),
(4, 'Kapai Lake','Beautiful blue water'),
(5, 'Coxs bazar', 'Experiances  longest natural sandy beach'),
(6, 'Sairo', 'Balancing with nature'),
(7, 'Saintmartin','Enjoy the cocunut with nature'),
(8, 'Srimongol','Tasted different types of tea with one cup'),
(9, 'Bali', 'Adventure  hill tracking with sea view'),
(10, 'Nayagra fall','Beautiful blue-green color water fallen');


CREATE TABLE DestinationActivities (
    DestinationID INT,
    ActivityID INT,
    PRIMARY KEY (DestinationID, ActivityID),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);

INSERT INTO DestinationActivities (DestinationID, ActivityID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    DestinationID INT,
    Rating DECIMAL(3, 1),
    Comment VARCHAR(900),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID)
);

INSERT INTO Reviews (ReviewID, CustomerID, DestinationID, Rating, Comment) VALUES
(1, 1, 1, 4.5, 'Sajek was beautiful, but the weather was a bit unpredictable.'),
(2, 2, 2, 4.0, 'Nafakom was amazing!'),
(3, 3, 3, 4.2, 'Tangoar haour was amazing!'),
(4, 4, 4, 3.8, 'Kaptai lake is beautiful'),
(5, 5, 5, 4.5, 'Coxsbazar was amazing'),
(6, 6, 6, 4.0, 'Had a wonderful time in sairo'),
(7, 7, 7, 4.3, 'Saintmartin was beatuful to enjoy free time'),
(8, 8, 8, 4.1, 'Srimangal was charming with so much history!!'),
(9, 9, 9, 4.7, 'Bali is wonderful to visit'),
(10, 10, 10, 4.6, 'Nayagra was amazing to look at!');


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentDate) VALUES
(1, 1, 500.00, '2024-04-27'),
(2, 2, 600.00, '2024-04-27'),
(3, 3, 800.00, '2024-04-28'),
(4, 4, 900.00, '2024-04-29'),
(5, 5, 1000.00, '2024-04-30'),
(6, 6, 700.00, '2024-05-01'),
(7, 7, 750.00, '2024-05-02'),
(8, 8, 850.00, '2024-05-03'),
(9, 9, 950.00, '2024-05-04'),
(10, 10, 550.00, '2024-05-05');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(500),
    Position VARCHAR(500),
    Email VARCHAR(500)
);

INSERT INTO Employees (EmployeeID, Name, Position, Email) VALUES
(1, 'Alice smith', 'Travel Consultant', 'alice@example.com'),
(2, 'David Smith', 'Customer Service Representative', 'david@example.com'),
(3, 'Charlie Brown', 'Travel Consultant', 'charlie@example.com'),
(4, 'David Miller', 'Customer Service Representative', 'david@example.com'),
(5, 'Jhon smit', 'Travel Consultant', 'jhon@example.com'),
(6, 'Frank Taylor', 'Customer Service Representative', 'frank@example.com'),
(7, 'Traves Head', 'Travel Consultant', 'traves@example.com'),
(8, 'Henry karlos', 'Customer Service Representative', 'henry@example.com'),
(9, 'Roverto karlos', 'Travel Consultant', 'roverto@example.com'),
(10, 'Jack White', 'Customer Service Representative', 'jack@example.com');


*******************        /*  SHOW ALL TABLE   */      *************************


SELECT * FROM Customers
SELECT * FROM Destinations
SELECT * FROM Flights
SELECT * FROM Hotels
SELECT * FROM Bookings
SELECT * FROM Activities
SELECT * FROM DestinationActivities
SELECT * FROM Reviews
SELECT * FROM Payments
SELECT * FROM Employees



     *******   /*   Query ->> All References With Join   */ ***********


SELECT 
    B.BookingID,
    C.Name AS CustomerName,
	D.Name AS DestinationName,
    F.DepartureDate,
    F.ArrivalDate,
    H.Name AS HotelName,
    P.Amount AS PaymentAmount
FROM 
    Bookings AS B
JOIN 
    Customers AS C ON B.CustomerID = C.CustomerID
JOIN 
    Flights AS F ON B.FlightID = F.FlightID
JOIN 
    Hotels AS H ON B.HotelID = H.HotelID
JOIN 
    Destinations AS D ON F.DestinationID = D.DestinationID
JOIN 
    Payments AS P ON B.BookingID = P.BookingID;




	***************        /*      Search   By Date       */      *****************



SELECT 
    B.BookingID,
    C.Name AS CustomerName,
	D.Name AS DestinationName,
    F.DepartureDate,
    F.ArrivalDate,
    H.Name AS HotelName,
    P.Amount AS PaymentAmount
FROM 
    Bookings AS B
JOIN 
    Customers AS C ON B.CustomerID = C.CustomerID
JOIN 
    Flights AS F ON B.FlightID = F.FlightID
JOIN 
    Destinations AS D ON F.DestinationID = D.DestinationID
JOIN 
    Hotels AS H ON B.HotelID = H.HotelID
JOIN 
    Payments AS P ON B.BookingID = P.BookingID
WHERE 
    B.BookingDate BETWEEN '2024-04-01' AND '2024-12-01';




	*******************     /*       MAX AND MINIMUM AMOUNT WISE SEARCH   */    **************

SELECT 
    B.BookingID,
    C.Name AS CustomerName,
    D.Name AS DestinationName,
    F.DepartureDate,
    F.ArrivalDate,
    H.Name AS HotelName,
    P.Amount AS PaymentAmount
FROM 
    Bookings AS B
JOIN 
    Customers AS C ON B.CustomerID = C.CustomerID
JOIN 
    Flights AS F ON B.FlightID = F.FlightID
JOIN 
    Hotels AS H ON B.HotelID = H.HotelID
JOIN 
    Payments AS P ON B.BookingID = P.BookingID
JOIN 
    Destinations AS D ON F.DestinationID = D.DestinationID
WHERE 
    P.Amount = (SELECT MAX(Amount) FROM Payments);


	SELECT 
    B.BookingID,
    C.Name AS CustomerName,
    D.Name AS DestinationName,
    F.DepartureDate,
    F.ArrivalDate,
    H.Name AS HotelName,
    P.Amount AS PaymentAmount
FROM 
    Bookings AS B
JOIN 
    Customers AS C ON B.CustomerID = C.CustomerID
JOIN 
    Flights AS F ON B.FlightID = F.FlightID
JOIN 
    Hotels AS H ON B.HotelID = H.HotelID
JOIN 
    Payments AS P ON B.BookingID = P.BookingID
JOIN 
    Destinations AS D ON F.DestinationID = D.DestinationID
WHERE 
    P.Amount = (SELECT MIN(Amount) FROM Payments);





	***************  /*    TOTAL DATA IN A TABLE   */  ***************

	SELECT COUNT(*) AS TotalRows FROM Customers;







   ***************  /*    TOTAL DATA IN A TABLE   */  ***************


   SELECT COUNT(*) Email  FROM Customers;







   ************** /*   SHOW ANYTHING  FROM ANY TABLE   */  *************

    SELECT   NAME    FROM    Customers;
	SELECT   email     FROM    Customers;
	SELECT   name     FROM   Destinations   ;







	****************    /*    FIND BY ID WITH RELATED DATA TABLE   */ ***********************






SELECT 
    B.BookingID,
    C.Name AS CustomerName,
    D.Name AS DestinationName,
    F.DepartureDate,
    F.ArrivalDate,
    H.Name AS HotelName,
    P.Amount AS PaymentAmount
FROM 
    Bookings AS B
JOIN 
    Customers AS C ON B.CustomerID = C.CustomerID
JOIN 
    Flights AS F ON B.FlightID = F.FlightID
JOIN 
    Hotels AS H ON B.HotelID = H.HotelID
JOIN 
    Payments AS P ON B.BookingID = P.BookingID
JOIN 
    Destinations AS D ON F.DestinationID = D.DestinationID
WHERE 
    B.BookingID = 1; 
