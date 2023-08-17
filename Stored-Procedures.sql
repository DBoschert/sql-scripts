CREATE OR ALTER PROCEDURE DisplayRequestAndLines
    @RequestId int = NULL
as 
Begin

    If @RequestId is NULL   
    BEGIN
        Print '@RequestId must be and integer'
        RETURN
    END


    Select r.id, r.[Description], r.Total, rl.Quantity, p.Price, 
            (rl.Quantity * p.Price) LineTotal
    from Requests r
    join RequestLine rl on r.id = rl.RequestId
    join Products p on p.id = rl.ProductId
    where r.id = @RequestId;

END
GO
exec DisplayRequestAndLines @RequestId = 1
go