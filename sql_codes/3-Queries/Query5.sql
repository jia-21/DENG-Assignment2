-- Query 5 - Sales/Products/brands/categories/inventory
Select
	sf.productKey,
	count(sf.ProductKey) as 'Total Sold',
	b.BrandName,
	c.CategoryName,
	sum(sf.ListPrice) as 'Amount Earned'
from
	ProductDim p
left join
	SalesFacts sf on sf.ProductKey = p.ProductKey
right join
	BrandDIM b ON b.BrandKey = p.BrandId
left join
	CategoryDIM c ON c.CategoryKey = p.CategoryId
where
	sf.productKey is not null
group by
	sf.ProductKey,
	b.BrandName,
	c.CategoryName
order by
	BrandName desc,
	CategoryName desc,
	[Amount Earned] asc