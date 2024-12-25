    select count(*)
  from PortfolioProjects..[Online Retail]
 -- 541,909


  select * into  Oniline_worsheet from PortfolioProjects..[Online Retail]


  select *
  from PortfolioProjects..Oniline_worsheet

  -- Cleaning 

  select distinct [StockCode],[InvoiceNo] 
from PortfolioProjects..Oniline_worsheet

select [InvoiceNo],
[InvoiceDate],
[InvoiceTime],
[StockCode],
[Description],
[UnitPrice],
[Totalsale],
[CustomerID],
[Country]
 from PortfolioProjects..Oniline_worsheet
 where ([Description]is null)

 -- duplicates

 select min ([StockCode]) as [InvoiceNo],[InvoiceDate],[InvoiceTime],[StockCode],[Description],[Quantity],[UnitPrice],[Totalsale],[CustomerID],[Country]
 from PortfolioProjects..Oniline_worsheet
 group by [InvoiceNo],[InvoiceDate],[InvoiceTime],[StockCode],[Description],[Quantity],[UnitPrice],[Totalsale],[CustomerID],[Country]
 order by [StockCode]


 delete from PortfolioProjects..Oniline_worsheet
 where [StockCode] not in (select min ([StockCode]) 

 from PortfolioProjects..Oniline_worsheet
 group by [InvoiceNo],[InvoiceDate],[InvoiceTime],[StockCode],[Description],[Quantity],[UnitPrice],[Totalsale],[CustomerID],[Country]
 having (count([StockCode]) >1))
 
 select*
 from PortfolioProjects..Oniline_worsheet

  -- blank spaces 


 --description 

  select * 
 from PortfolioProjects..Oniline_worsheet
 where datalength([CustomerID]) = 0;



--standarizing data 
-- Upper case 

 select
 [Description], upper(left([Description],1)) + lower(substring([Description] ,2, len([Description]))) as description_proper
 from PortfolioProjects..Oniline_worsheet

 update PortfolioProjects..Oniline_worsheet
 set Description =  upper(left([Description],1)) + lower(substring([Description] ,2, len([Description])))

-- Trimming
 
  select Ltrim(Rtrim([Description])) as TRM_one
  from PortfolioProjects..Oniline_worsheet

  update PortfolioProjects..Oniline_worsheet
  set [Description] = Ltrim(Rtrim([Description]))
--
    select [Country],
SUBSTRING([Country],1, PATINDEX('%[a-z]%',[Country])-1) 

 CustomerId,
 
 case 
	when [Country] not like '%[a-z]%' then 'default_value'
		else substring([Country],PATINDEX('%[a-z]%',[Country]), len ([Country]))
end  as Country_name
from PortfolioProjects..Oniline_worsheet

update PortfolioProjects..Oniline_worsheet
set CustomerId  = SUBSTRING([Country],1, PATINDEX('%[a-z]%',[Country])-1) 
 
  update PortfolioProjects..Oniline_worsheet
set CustomerId  = [CustomerID]
where CustomerId = ' '

select [Country],
SUBSTRING([Country],1, PATINDEX('%[a-z]%',[Country])-1) 

CustomerId,
 
 case 
	when [Country] not like '%[a-z]%' then 'default_value'
		else substring([Country],PATINDEX('%[a-z]%',[Country]), len ([Country]))
end  as CustomerId 
from PortfolioProjects..Oniline_worsheet


update PortfolioProjects..Oniline_worsheet
set [Country]= 
 
 case 
	when [Country] not like '%[a-z]%' then 'default_value'
		else substring([Country],PATINDEX('%[a-z]%',[Country]), len ([Country]))
end 

alter table PPortfolioProjects..Oniline_worsheet
drop column [CustomerID]

  select *
  from PortfolioProjects..Oniline_worsheet 
  where [Description] = 'Nan'

  update PortfolioProjects..Oniline_worsheet 
set [Description] = 'Nan'
where [Description] = '?'

 select *
 from PortfolioProjects..Oniline_worsheet
 where [InvoiceNo]  = '562460' and [StockCode] = '51014C'


   update PortfolioProjects..Oniline_worsheet
   set Totalsale = CustomerID,
 UnitPrice = Totalsale,
 Quantity = UnitPrice
   where  [Description]  =  'Fancy font birthday card'



--FORMATING DATA --
-- creating a column for a data that was misplaced 
-- deleting the the column that was created 
-- concatanating some columns

alter table PortfolioProjects..Oniline_worsheet
add concat_st varchar(50)

alter table PortfolioProjects..Oniline_worsheet
alter column [InvoiceDate] date

alter table PortfolioProjects..Oniline_worsheet
alter column[Totalsale]  float
  
  select replace(rtrim([InvoiceTime]), ':00.0000000', ' ' ) as TRM_one
  from PortfolioProjects..Oniline_worsheet 

  update PortfolioProjects..Oniline_worsheet
  set [InvoiceTime] = replace(rtrim([InvoiceTime]), ':00.0000000', ' ' )

 select *
from PortfolioProjects..Oniline_worsheet
where [InvoiceDate] = '2011-08-06 00:00:00.000' and concat_st like '%[a-z]%'

 select *
from PortfolioProjects..Oniline_worsheet
where concat_st like '%[a-z]%'

select concat ([Description],' ',concat_st) as concatenated_st
from PortfolioProjects..Oniline_worsheet
where [Quantity] like '%[a-z]%'


update PortfolioProjects..Oniline_worsheet
set [CustomerID] = '15974'
where [InvoiceNo] = '556071'

update PortfolioProjects..Oniline_worsheet
set[Description]  = concat ([Description],' ',concat_st) 
where  [Quantity] like '%[a-z]%'

alter table PortfolioProjects..Oniline_worsheet
drop column [concat_st]


-- filling nulls

select *
from PortfolioProjects..Oniline_worsheet
where [Description] = ' '

  select (replace([Description], '', 'Nan ' ))
  from PortfolioProjects..Oniline_worsheet 
  where [Description] = ' '


--deleting symbols from description 

update PortfolioProjects..Oniline_worsheet
   set [Quantity] = [Totalsale], 
[UnitPrice] = [CustomerID]
where [Quantity] like '%[a-z]%'

  select replace([Description], '"', ' ') as TRM_one
  from PortfolioProjects..Oniline_worsheet
  where [Description] like '%["]%'

update PortfolioProjects..Oniline_worsheet
  set[Description] = replace ([Description], '"', ' ')
where [Description] like '%["]%'

-- Consultaion --

select *
from PortfolioProjects..Oniline_worsheet
where [UnitPrice] = 38970



select max([Quantity]) as max_quantity
from PortfolioProjects..Oniline_worsheet
--12540

select min([Quantity]) as min_quantity
from PortfolioProjects..Oniline_worsheet
-- -9600

select avg([Quantity]) as avg_quantity
from PortfolioProjects..Oniline_worsheet
-- 9%
-- 
select max([UnitPrice]) as unit_price
from PortfolioProjects..Oniline_worsheet
-- 38970

select min([UnitPrice]) as unit_price
from PortfolioProjects..Oniline_worsheet

-- 0
select avg([UnitPrice]) as unit_price
from PortfolioProjects..Oniline_worsheet

--3.60%
--
select max([Totalsale]) as total_sale
from PortfolioProjects..Oniline_worsheet

-- 38970

select min([Totalsale]) as total_sale
from PortfolioProjects..Oniline_worsheet
-- -38970

select avg([Totalsale]) as total_sale
from PortfolioProjects..Oniline_worsheet
-- 18.69%

--what is the top selling product by quantity?

   --stock: 84826,  asstd design 3d paper stickers, UK, 12540

select top 1 [StockCode],[Description],[Country], [Quantity] as most_common
from PortfolioProjects..Oniline_worsheet
group by [StockCode],[Description],[Country],  [Quantity]
order by most_common desc ;

-- most purchased product per country 

 select top 10 [Country],[Description],
 sum([Quantity] * [UnitPrice]) as product_country
 from PortfolioProjects..Oniline_worsheet
 group by [Country], [Description]
 order by product_country desc;

 -- best selling product per quantity

  select top 10 [StockCode],[Description],[Country], max ([Quantity]) as revenue_country
 from PortfolioProjects..Oniline_worsheet
 group by [StockCode],[Description],[Country]
 order by revenue_country desc;


--which country has the highest sales revenue

-- UK 

 select *
 from PortfolioProjects..Oniline_worsheet
 where [Totalsale] in (select max([Totalsale])
 from PortfolioProjects..Oniline_worsheet)

 --  purchased per cutomer, country  based on quantity

 select top 10 [Country],[CustomerID],
 sum ([Quantity] * [UnitPrice]) as revenue_country
 from PortfolioProjects..Oniline_worsheet
 group by [Country], [CustomerID]
 order by revenue_country desc; 
 
 -- revenue per country 

 select top 10 [Country], sum ([Totalsale]) as revenue_country
 from PortfolioProjects..Oniline_worsheet
 group by [Country] 
 order by revenue_country desc;

 --how does trends vary across different monthds or seasons

 select [InvoiceDate], [Totalsale]
 from PortfolioProjects..Oniline_worsheet
 where year([InvoiceDate]) in (2010, 2011)


select year([InvoiceDate]), month([InvoiceDate]), sum([Totalsale])
from PortfolioProjects..Oniline_worsheet
where year([InvoiceDate]) in (2010, 2011)
group by year([InvoiceDate]), month([InvoiceDate]) 

select year([InvoiceDate]), sum([Totalsale])
from PortfolioProjects..Oniline_worsheet
where year([InvoiceDate]) in (2010, 2011)
group by year([InvoiceDate])


-- who is the most valuable customer based on total sales
-- 15098 38970
select top 1 [CustomerID], max ([Totalsale]) as revenue_country
 from PortfolioProjects..Oniline_worsheet
 group by [CustomerID]
 order by revenue_country desc;


-- what does customer behavior differ between known and unknown customer ids

 select[CustomerID], count(*) as customer_null
 from PortfolioProjects..Oniline_worsheet
 where [CustomerID] = ' ' 
 group by [CustomerID]


-- is there a correlation between quantity purchased and the unit price 

 select top 10 [StockCode],[Country],[Totalsale], [UnitPrice]
from PortfolioProjects..Oniline_worsheet
order by [UnitPrice] desc;


 select top 10 [StockCode],[Country],[Totalsale],[Quantity] 
from PortfolioProjects..Oniline_worsheet
order by [Quantity] desc;


