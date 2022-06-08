create database BooksAuthors

use BooksAuthors

create table Books(
 Id int primary key identity,
 [Name] nvarchar(100) check(Len(Name)>=2 and Len(Name)<= 100),
 PageCount int check (PageCount<10)
)

insert into Books
values('IT',9,1)

alter table Books
add AuthorId int foreign key references Authors(Id)

create table Authors(
 Id int primary key identity,
 [Name] nvarchar(50) not null,
 Surname nvarchar(40)
)

insert into Authors
values('Stephen','King')



create view vw_ABooks
as
select id,name,pagecount from
(
select Authors.Surname as Fullname, Books.Id,Books.Name,Books.PageCount from  Books
join Authors
on Books.AuthorId = Authors.Id
) ab

select ab.Name, ab.pagecount as count from vw_ABooks as ab


create procedure usp_SearchValue
(
@Search nvarchar(50) = 'l'
)
as
begin
--serti basa dusmedim--
end


create procedure usp_InsertAuthor
(
@Author_Name nvarchar(50),
@Author_Surname nvarchar(50)
)
as
begin
insert into Authors
values(@Author_Name,@Author_Surname)
end

exec usp_InsertAuthor 'Lutfiyar','Aliyev'

create procedure usp_UpdateAuthor
(
@Author_Name nvarchar(50),
@Author_Surname nvarchar(50)
)
as
begin
update Authors
Set @Author_Name = 'Lutfiyar'
end

exec usp_UpdateAuthor 'Test','TestSurname'


create procedure uspDeletetAuthor
(
@Author_Name nvarchar(50),
@Author_Surname nvarchar(50)
)
as
begin
delete from Authors
Where @Author_Name = 'Lutfiyar'
end

exec uspDeletetAuthor 'Test','TestSurname'


create view vw_ReturnBooksValue
as
select *from
(
select Books.Id as Id, Books.PageCount as Count, Authors.Name, Authors.Surname as Fullname from Authors
join Books
on Books.AuthorId = Authors.Id
)
 as rb

