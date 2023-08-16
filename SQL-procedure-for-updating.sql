CREATE OR ALTER PROC UpdateProduct
    @PartNbr varchar(30) = NULL,
    @Name varchar(30) = NULL,
    @Price decimal(9,2) = null,
    @Unit varchar(30) = NULL,
    @VendorId int = NULL,
    @Id int = NULL
AS
 
BEGIN
 
    IF @Id is NULL
        return -1; -- must provide the ID to be updated
 
    DECLARE @OrigId int,
            @OrigPartNbr varchar(30),
            @OrigName varchar(30),
            @OrigPrice decimal(9,2),
            @OrigUnit varchar(30),
            @OrigVendorId int;
 
    SELECT @OrigId = Id,
            @OrigPartNbr = PartNbr,
            @OrigName = Name,
            @OrigPrice = Price,
            @OrigUnit = Unit,
            @OrigVendorId = VendorId
        from Products
        Where Id = @Id;
 
    IF @PartNbr is NULL
        Set @PartNbr = @OrigPartNbr;
 
    IF @Name is NULL
        Set @Name = @OrigName;
 
    IF @Price is NULL
        Set @Price = @OrigPrice;
 
    IF @Unit is NULL
        Set @Unit = @OrigUnit;
 
    If @VendorId is NULL
        Set @VendorId = @OrigVendorId;
 
    UPDATE Products SET
        PartNbr = @PartNbr,
        Name = @Name,
        Price = @Price,
        Unit = @Unit,
        VendorId = @VendorId
        Where Id = @Id;
 
    return 0;
 
END
GO
 
Declare @rc int;
exec @rc = UpdateProduct @id = 11,
                            @Name = 'Timex Platinum Watch', 
                            @Price = 350;
if @rc != 0
    PRINT 'ERROR rc = ' + str(@rc)
