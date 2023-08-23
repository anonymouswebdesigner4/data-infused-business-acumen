CREATE DEFINER=`root`@`localhost` PROCEDURE `top_prod_proc`(
in_fy int,
toplimit int)
BEGIN
select product, round(sum(net_sales)/1000000,2) as net_sales_mln
 from net_sales
 where fiscal_year=in_fy
 group by product
 order by net_sales_mln
 limit toplimit;
END