CREATE DEFINER=`root`@`localhost` PROCEDURE `top_markets_proc`(
in_fiscal_year int,
toplimit int)
BEGIN
select market, round(sum(net_sales)/1000000,2) as net_sales_mln
 from net_sales
 where fiscal_year=in_fiscal_year 
 group by market
 order by net_sales_mln
 limit toplimit;
END