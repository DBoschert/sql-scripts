create or alter PROCEDURE ListAllUsers
as 
BEGIN

select Id, CONCAT(Firstname, ' ', Lastname) Name, Phone, Email
from Users
where IsAdmin = 0

END

go

exec ListAllUsers 

select * from Users