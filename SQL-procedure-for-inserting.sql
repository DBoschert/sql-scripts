create or alter PROCEDURE AddProduct
    @PartNbr varchar(30) = NULL,
    @Name varchar(30) = NULL,
    @Price decimal(11,2) = NULL,
    @Unit varchar(30) = NULL,
    @VendorName varchar(50) = NULL
AS
BEGIN

    if @PartNbr is NULL
        or @Name is NULL
        or @Price is null
        or @Unit is NULL
        or @VendorName is NULL
        return -1

        -- Check if new PartNbr already exists
        if exists (
            select 1
            from Products
            where PartNbr = @PartNbr
        )

        declare @VendorId int, @count int;

        select @count = count(*)
            from Vendors
            where Name like @VendorName + '%'

        if @count != 1
            return -2 -- zero or multiple vendors found

        select @VendorId = Id 
            from Vendors
            where Name LIKE @Vendorname + '%'

    insert Products(PartNbr, Name, Price, Unit, VendorId) values
        (@PartNbr, @Name, @Price, @Unit, @VendorId )

    return 0;

END
GO
declare @rc int;

exec @rc = AddProduct @PartNbr = 'WACH',
                    @Name = 'Timx Watch',
                    @Price = 400,
                    @Unit = 'Each',
                    @VendorName = 'TAG';




