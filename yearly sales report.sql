#Yearly Sales Report
#Monthly Sales Report
select get_fiscal_year(date) as fiscal_year,round((gross_price*sold_quantity),2) as yearly_sales from fact_sales_monthly s
join fact_gross_price g
on 
g.product_code=s.product_code and
g.fiscal_year=get_fiscal_year(s.date)
where customer_code=90002002
group by s.date
order by s.date asc;