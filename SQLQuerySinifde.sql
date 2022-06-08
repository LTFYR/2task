create database TaskInClassroom

use TaskInClassroom

create table Notebooks(
 Id int primary key identity,
 [Name] nvarchar(40) not null,
 Price decimal(5,2) default 200
)

create table Brands(
Id int primary key identity,
[Name] nvarchar(40)
)

alter table Notebooks 
add brandId int foreign key references Brands(Id)


drop column brandName

insert into Notebooks
values ('ASUS', 450.99,1,1),
('DELL', 550.99,2,2),
('HP', 480.99,3,3)

Select n.Name + ' ' + b.Name , n.Price as everything from Notebooks as n
join Brands as b
on n.brandId = b.Id


select n.Name as SelectedName from Notebooks as n
join Brands as b
on n.brandId = b.Id
where b.Name like ('%b%')
