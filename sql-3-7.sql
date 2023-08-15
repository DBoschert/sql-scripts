--Ch 3.7

/*
Select *
From Invoices
WHERE
(PaymentTotal > 0 AND PaymentDate IS NOT NULL)
OR
(PaymentTotal = 0 AND PaymentDate IS NULL)
*/

Select *
From Invoices
WHERE ((InvoiceTotal- PaymentTotal - CreditTotal <= 0) 
        AND PaymentDate IS NULL) 
    OR
        ((InvoiceTotal - PaymentTotal - CreditTotal > 0) 
        AND PaymentDate IS NOT NULL);