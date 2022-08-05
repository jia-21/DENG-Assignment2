-- Query 2 - Sales/Staff/stores
select
	StaffKey,
	StoreKey,
	sum(ListPrice) as 'Amt Earned'
from
	SalesFacts
Group by
	StaffKey,
	StoreKey
Order by
	'Amt Earned' asc

-- Amt earned by each staff in each store