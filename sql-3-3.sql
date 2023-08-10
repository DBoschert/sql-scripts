--Ch 3.3

SELECT VendorContactFName + ',' + VendorContactLName AS 'Full Name'
from Vendors
ORDER BY VendorContactLName, VendorContactFName;