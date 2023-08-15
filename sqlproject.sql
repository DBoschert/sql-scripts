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
create table RequestLine(
    Id int not null primary KEY IDENTITY(1,1),
    RequestId int not null FOREIGN KEY REFERENCES Requests (Id),
    ProductId int not null FOREIGN KEY REFERENCES Products (Id),
    Quantity int not null default 1

)
go
--insert table1 (name) values ('test');
