--#1795. 每个产品在不同商店的价格
/*
Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). 
If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
*/

select product_id,'store1' store,store1 price
from Products where store1 is not null
group by 1
union all
select product_id,'store2' store,store2 price
from Products where store2 is not null
group by 1
union all
select product_id,'store3' store,store3 price
from Products where store3 is not null
group by 1

