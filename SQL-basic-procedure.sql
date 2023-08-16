create or alter PROCEDURE ListAllProducts
AS
BEGIN

    select *
    from Products

END
go
exec ListAllProducts