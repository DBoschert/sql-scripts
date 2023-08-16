use master;
go
drop database if exists sqlproject;
go
create database sqlproject;
go
use sqlproject;
go
create table Users (
    Id int not null primary key identity(1,1),
    Username varchar(30) UNIQUE not null,
    PASSWORD varchar(30) not null,
    Firstname varchar(30) not null,
    Lastname varchar(30) not null,
    Phone varchar(12) NULL,
    Email varchar(255) NULL,
    IsReviewer bit not null,
    IsAdmin bit not null
)
go

insert Users (Username, PASSWORD, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
VALUES ('Bobby0', 'TheBob', 'Bobby', 'Jones', '238-290-2390', 'bobby@gmail.com', 1, 0),
('Fred1', 'aprocot', 'Fred', 'Bosch', '028-730-4690', 'fred@gmail.com', 1, 0),
('Albert2', 'apple', 'Albert', 'Humes', '208-389-1083', 'albert@gmail.com', 0, 0),
('Hulvert3', 'banana', 'Hulvert', 'Willy', '294-594-2894', 'hulvert@gmail.com', 1, 1),
('Fedrick4', 'mango', 'Fedrick', 'Lukes', '138-160-3740', 'fedrick@gmail.com', 1, 0),
('Drew5', 'cucumber', 'Drew', 'Reid', '108-940-4590', 'drew@gmail.com', 1, 1);

go
create table Vendors (
    Id int not null primary key identity(1,1),
    Code varchar(30) not null UNIQUE,
    Name varchar(30) not null,
    Address varchar(30) not null,
    City varchar(30)  not null,
    State varchar(2) not NULL,
    Zip varchar(5) not null,
    Phone varchar(12) NULL,
    Email varchar(255) NULL
)
go

insert Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
VALUES ('54321', 'Amazon', '291 Robinhood dr', 'Cincy', 'OH', '41011', '289-279-2018', 'amazon@gmail.com'),
('54322', 'Craigslist', '164 Fluffy rd', 'NYC', 'NY', '79234', '145-642-2455', 'craigslist@gmail.com'),
('54323', 'Ebay', '823 Arrow st', 'Hollywood', 'CA', '10842', '643-253-2456', 'ebay@gmail.com'),
('54324', 'Walmart', '74 Flies rd', 'Columbus', 'OH', '47927', '612-245-7352', 'walmart@gmail.com'),
('54325', 'Target', '7 jumper dr', 'Ciesta Key', 'FL', '02482', '424-553-646', 'target@gmail.com'),
('54326', 'Walgreens', '843 Rosewood dr', 'Park Hill', 'UT', '49325', '223-245-3334', 'walgreens@gmail.com');

go
create table Products (
    Id int not null primary key IDENTITY(1,1),
    PartNbr varchar(30) not null unique,
    Name varchar(30) not null,
    Price decimal(11,2) not null,
    Unit varchar(30) not null,
    PhotoPath varchar(255) NULL,
    VendorId int not null foreign key REFERENCES Vendors (Id)
)
go

insert Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
VALUES ('12345', 'Computer', 120.99, '1', NULL, 1),
('12344', 'Duck', 9.99, '5', NULL, 2),
('12343', 'Phone', 899.99, '1', NULL, 3),
('12342', 'pen', 1.99, '5',NULL, 4),
('12341', 'Soccer Ball', 57.50, '2', NULL, 5),
('12340', 'Couch', 4999.99, '1', NULL, 6);

go
create table Requests(
    Id int not null primary key IDENTITY(1,1),
    Description varchar(80) not null,
    Justification varchar(80)  not null,
    RejectionReason varchar(80) NULL,
    DeliveryMode varchar(20) not null default 'Pickup',
    Status varchar(10) not null default 'NEW',
    Total decimal(11,2) not null default 0,
    UserId int not null FOREIGN KEY REFERENCES Users (Id)  
)
go
    insert Requests(Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)
    VALUES ('Duck', 'I want it', null, default, default, 50, 2),
    ('Phone', 'I want it', null, default, default, 100, 3),
    ('Pen', 'I want it', null, default, default, 200, 4);
    
go
create table RequestLine(
    Id int not null primary KEY IDENTITY(1,1),
    RequestId int not null FOREIGN KEY REFERENCES Requests (Id),
    ProductId int not null FOREIGN KEY REFERENCES Products (Id),
    Quantity int not null default 1

)
GO

insert RequestLine (RequestId, ProductId, Quantity)
Values (1, 1, 10),
(2,2, 11),
(3,3, 2);

go
--insert table1 (name) values ('test');

