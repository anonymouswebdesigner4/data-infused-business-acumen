# we need to create  a report of infdividual product sales (aggregated on monthly basis at product code level) for FY=2021 for croma store
#Report should consist of 
-- Month
-- Product Name
-- variant
-- Sold Quantity
-- Gross Price per item
-- Gross price total
select * from dim_customer where customer like "%croma%" and market="India";
select s.date,s.product_code,p.product,p.variant,s.sold_quantity,g.gross_price,round((gross_price* sold_quantity),2) as gross_price_total
 from fact_sales_monthly s 
join dim_product p  
on s.product_code=p.product_code
join fact_gross_price g
on s.product_code=g.product_code and
g.fiscal_year=get_fiscal_year(date)
where customer_code=90002002 and get_fiscal_year(date)=2021
order by date asc;