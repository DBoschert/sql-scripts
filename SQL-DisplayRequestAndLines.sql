SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[DisplayRequestAndLines]
    @RequestId int = NULL
as 
Begin

    If @RequestId is NULL OR @RequestId <= 0
    BEGIN
        Print '@RequestId must be a integer greater than zero'
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

exec DisplayRequestAndLines @RequestId=1

