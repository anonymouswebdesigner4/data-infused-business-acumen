CREATE DEFINER=`root`@`localhost` PROCEDURE `market_badge`(
in in_market varchar(45),
in i_fiscal_year year,
out out_badge varchar(45))
BEGIN
declare qty int ;
if in_market="" then
set in_market="India";
end if;
select sum(s.sold_quantity) into qty from fact_sales_monthly s
join dim_customer c
on
s.customer_code=c.customer_code
where get_fiscal_year(s.date)=i_fiscal_year and c.market=in_market
group by c.market;
if qty>5000000 then 
set out_badge="gold";
else 
set out_badge="silver";
end if;
END