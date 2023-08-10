-- Ch 3.2

SELECT InvoiceNumber AS 'Number', InvoiceTotal AS 'Total', PaymentTotal + CreditTotal AS 'Credits', InvoiceTotal - (PaymentTotal + CreditTotal) AS 'Balance'
From Invoices
