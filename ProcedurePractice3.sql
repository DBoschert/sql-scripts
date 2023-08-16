create or alter PROCEDURE ListCustomerBySales
    @lowSales DECIMAL(7,2) = 0,
    @highSales decimal(9,2) =  1000000
AS
BEGIN

    if @lowSales is null or @highSales is NULL
        return -1

    if @lowSales > @highSales
        BEGIN
            declare @sales decimal(9,2) = @lowSales;
            set @lowSales = @highSales;
            set @highSales = @sales;

        END

    select *
        from Customers c
        where Sales between @lowSales and @highSales
        order by Sales DESC

    return 0;


END
go
declare @rc int;
exec @rc = ListCustomerBySales @HighSales = 30000, @lowSales = 70000;
if @rc = 0
    print 'OK'
if @rc = -1
    print 'Both @LowSales and @HighSales must be positive numbers'