-- Query 2 - Sales/Staff/stores
select
	StaffKey,
	StoreKey,
	sum(ListPrice) as 'Amount Earned'
from
	SalesFacts
Group by
	StaffKey,
	StoreKey
Order by
	'Amount Earned' asc

-- Amt earned by each staff in each store