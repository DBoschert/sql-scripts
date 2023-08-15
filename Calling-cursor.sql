Select r.id, r.[Description], r.Total, rl.Quantity, p.Price, (rl.Quantity * p.Price) LineTotal
from Requests r
join RequestLine rl on r.id = rl.RequestId
join Products p on p.id = rl.ProductId
where r.id = 2;