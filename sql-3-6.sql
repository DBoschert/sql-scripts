--Ch 3.6

SELECT VendorContactFName + ',' + VendorContactLName AS 'Full Name'
FROM Vendors
WHERE VendorContactLName LIKE '[a-c, e]%'
ORDER BY VendorContactLName, VendorContactFName;