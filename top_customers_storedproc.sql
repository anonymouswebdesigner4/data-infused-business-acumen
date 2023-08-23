CREATE DEFINER=`root`@`localhost` PROCEDURE `top_customers_proc`(
in_fy int,
in_market varchar(45),
toplimit int)
BEGIN
select customer, round(sum(net_sales)/1000000,2) as net_sales_mln
 from net_sales n
 join
 dim_customer c
 on c.customer_code=n.customer_code
 where fiscal_year=in_fy and n.market=in_market
 group by c.customer
 order by net_sales_mln
 limit toplimit;
END