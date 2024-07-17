SELECT TOP (1000) [Poster_Link]
      ,[Series_Title]
      ,[Released_Year]
      ,[Certificate]
      ,[Runtime]
      ,[Genre]
      ,[IMDB_Rating]
      ,[Overview]
      ,[Meta_score]
      ,[Director]
      ,[Star1]
      ,[Star2]
      ,[Star3]
      ,[Star4]
      ,[No_of_Votes]
      ,[Gross]
  FROM [PortfolioProjects].[dbo].[imdb_top_1000]


    select* into Movie_imdb
  from PortfolioProjects..imdb_top_1000

  select count(*)
  from PortfolioProjects..
 
  1000

  -- //Data Cleaning //
  select *
  from PortfolioProjects..Movie_imdb

  select distinct ([Poster_Link])
  from PortfolioProjects..Movie_imdb

   select*
 from PortfolioProjects..Movie_imdb
 where [Meta_score] is  null

 update PortfolioProjects..Movie_imdb
 set[Meta_score] = 0
 where [Meta_score] is  null

  --standarizing data 

  select round ([IMDB_Rating], 2) as round_num
  from PortfolioProjects..Movie_imdb

  update PortfolioProjects..Movie_imdb
  set [IMDB_Rating] = round ([IMDB_Rating], 2) 

  select Ltrim(Rtrim([Gross])) as TRM_one
  from PortfolioProjects..Movie_imdb

  update PortfolioProjects..Movie_imdb
  set [Gross] = Ltrim(Rtrim([Gross]))

   select *
  from PortfolioProjects..Movie_imdb
  -- null values 

select *
from PortfolioProjects..Movie_imdb
where [Released_Year] is null

update PortfolioProjects..Movie_imdb
 set [Released_Year]  =
 where [Released_Year] is null



 alter table PortfolioProjects..Movie_imdb
 alter column [Gross] bigint

 -- //Consulation//


 -- max gross 

 select max([Gross]) as ave_gross
 from PortfolioProjects..Movie_imdb

 936662225

 -- avg 

  select AVG([Gross]) as ave_gross
 from PortfolioProjects..Movie_imdb

56536877

 -- min gross

  select min([Gross]) as ave_gross
 from PortfolioProjects..Movie_imdb


 --0 = unknown value




 -- the highest Groos 
 --released year:  2015, gross: 936662225,  serie title: Star Wars: Episode VII - The Force Awakens,  raiting: 7.9

 SELECT Series_Title, Released_Year, [IMDB_Rating],[No_of_Votes],Gross
FROM     Movie_imdb
where [Gross] in ( select max([Gross]) 
 from PortfolioProjects..Movie_imdb)


-- the lowest gross
--released year:  2005, gross:1305 ,  serie title: Adams �bler, raiting:7.8
--the 0 and known 

 SELECT Released_Year, Gross, Series_Title, [IMDB_Rating]
FROM     Movie_imdb
where [Gross] in ( select min([Gross]) 
 from PortfolioProjects..Movie_imdb)

-- rating 
 select AVG([IMDB_Rating]) as ave_rating
 from PortfolioProjects..Movie_imdb
 7.9%


 --max

  select Max([IMDB_Rating]) as max_rating
 from PortfolioProjects..Movie_imdb
9.3

 select *
 from PortfolioProjects..Movie_imdb
 where [IMDB_Rating] in( select Max([IMDB_Rating]) from PortfolioProjects..Movie_imdb)

 --min 

   select Min([IMDB_Rating]) as min_rating
 from PortfolioProjects..Movie_imdb

  7.6

select *
from PortfolioProjects..Movie_imdb
where [IMDB_Rating] in ( select Min([IMDB_Rating])  from PortfolioProjects..Movie_imdb)

 

 --top 5 movies based on [Series_Title], [IMDB_Rating], [Gross]

--[Series_Title], [IMDB_Rating], [Gross]
--Star Wars: Episode VII - The Force Awakens -	7.9 -	936662225
--Avengers: Endgame	- 8.4	- 858373000
--Avatar:	7.8 - 	760507625
--Avengers: Infinity War	- 8.4 - 	678815482
--Titanic: 7.8 - 	659325379

select top 5 [Series_Title], [IMDB_Rating], [Gross] as gross
from PortfolioProjects..Movie_imdb
group by [Series_Title],[IMDB_Rating],[Gross]
order by gross desc;


-- Correlation  between released year and gross--

--Series_Title	Released_Year	Gross
--Star Wars: Episode VII - The Force Awakens	2015	936662225
--Avengers: Endgame	2019	858373000
--Avatar	2009	760507625
--Avengers: Infinity War	2018	678815482
--Titanic	1997	659325379

 select top 5 [Series_Title],[Released_Year] , [Gross]
from PortfolioProjects..Movie_imdb
order by [Gross] desc;

-- The correlation between the audience votes and the gross from the movie--

--Series_Title	No_of_Votes	Gross
--The Shawshank Redemption	2343110	28341469
--The Dark Knight	2303232	534858444
--Inception	2067042	292576195
--Fight Club	1854740	37030102
--Pulp Fiction	1826188	107928762

select top 5 [Series_Title], [No_of_Votes], [Gross]
from PortfolioProjects..Movie_imdb
order by [No_of_Votes] desc;


select top 5 [Series_Title], [No_of_Votes], [Gross]
from PortfolioProjects..Movie_imdb
order by [Gross] desc;


select *
from PortfolioProjects..Movie_imdb

--2.Who directed the highest-grossing film of all time, and what was the film--

--Series_Title	Director	Gross
--Star Wars: Episode VII - The Force Awakens	J.J. Abrams	936662225

 SELECT Series_Title, [Director],Gross
FROM PortfolioProjects..Movie_imdb
where [Gross] in ( select max([Gross]) 
 from PortfolioProjects..Movie_imdb)


 --how does runtime affect a movie groos?--

 
 select top 10 [Series_Title],[Runtime] , [Gross]
from PortfolioProjects..Movie_imdb
order by [Gross] desc;
 


-- do certain genre consistently perform better in terms of gross  

 select [Genre],count(*) as ocurrent
 from PortfolioProjects..Movie_imdb
 group by [Genre] 
 order by ocurrent desc;



 select top 10 [Series_Title],[Genre] , [Gross]
from PortfolioProjects..Movie_imdb
order by [Gross] desc;

 --  how does the movie length and rating affects the gross--
 9.3

 select max([IMDB_Rating]) as max_rating
 from PortfolioProjects..Movie_imdb
 
 select top 10 [Series_Title],[Runtime], [IMDB_Rating], [Gross]
from PortfolioProjects..Movie_imdb
order by [IMDB_Rating] desc;

-- meta raiting 

 select max([Meta_score]) as max_meta
 from PortfolioProjects..Movie_imdb

 select* 
 from PortfolioProjects..Movie_imdb
 where [Meta_score] in ( select max([Meta_score])
 from PortfolioProjects..Movie_imdb)

  select min([Meta_score]) as min_meta
 from PortfolioProjects..Movie_imdb

 select *
 from PortfolioProjects..Movie_imdb
 where [Meta_score] in (select min([Meta_score])
 from PortfolioProjects..Movie_imdb)

 
 select *
 from PortfolioProjects..Movie_imdb
 where [Meta_score] in (select max([Meta_score])
 from PortfolioProjects..Movie_imdb)

--Series_Title	Meta_score	Gross
--Star Wars: Episode VII - The Force Awakens	80	936662225
  select top 1  [Series_Title],[Meta_score] , [Gross]
from PortfolioProjects..Movie_imdb
order by [Gross] desc;

-- certificate based on gross

 select[Certificate] ,count(*) as ocurrent
 from PortfolioProjects..Movie_imdb
 group by  [Certificate]
 order by ocurrent desc;

 select top 5 [Series_Title],[Certificate] , [Gross]
from PortfolioProjects..Movie_imdb
order by [Gross] desc;


