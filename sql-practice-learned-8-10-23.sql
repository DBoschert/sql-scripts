

/*
SELECT * 
FROM GLAccounts
WHERE AccountDescription LIKE '__c%';


SELECT *
FROM GLAccounts
WHERE AccountNo in (
    SELECT AccountNo 
    FROM GLAccounts
    WHERE LEFT(AccountDescription, 8) = 'Employer'
);

SELECT * 
FROM invoices
WHERE InvoiceTotal > (SELECT AVG(InvoiceTotal)
FROM Invoices);

SELECT *
FROM glAccounts 
WHERE AccountNo NOT IN(100,200,300);



--SELECT 'Greg' + ' ' + 'O''Doud'

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal 
FROM Invoices
ORDER BY InvoiceTotal; 

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal FROM Invoices
ORDER BY InvoiceTotal;

SELECT TOP 5 InvoiceID 'ID', InvoiceTotal, PaymentTotal, CreditTotal, CreditTotal + PaymentTotal AS 'Total Credits'
FROM Invoices
ORDER BY InvoiceTotal DESC ;


SELECT *
FROM glAccounts
WHERE AccountNo >= 200 AND AccountNo <= 600
ORDER BY AccountDescription DESC , AccountNo DESC;

*/