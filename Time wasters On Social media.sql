select * from `time-wasters on social media`;

-- Total time spent by Time wasters on social media by Gender
select Gender,sum(TotalTimeSpent) as Timespent_in_hrs from `time-wasters on social media` group by Gender ;

select * from `time-wasters on social media`;

-- Add continent for each location

select distinct Location from `time-wasters on social media`; -- shows distinct locations

with TimeWasters_by_Continent as (SELECT * ,  -- creating a cte showing continents for each location
CASE when Location='Pakistan' then 'Middle East'
	 when Location='Mexico' then 'North America'
	 when Location='India' then 'Asia'
	 when Location='Brazil' then 'South America'
	 when Location='United States' then 'North America'
	 when Location='Indonesia' then 'Asia'
	 when Location='Philippines' then 'Asia'
	 when Location='Japan' then 'Asia'
	 when Location='Vietnam' then 'Asia'
	 else 'Europe'
end as 'Continent' FROM `time-wasters on social media`)
-- number of time wasters by Continent 
select Continent , count(UserID) as Number_of_TimeWasters from TimeWasters_by_Continent group by Continent; 

select * from `time-wasters on social media`;

with TimeWasters_by_Continent as (SELECT * ,  
CASE when Location='Pakistan' then 'Middle East'
	 when Location='Mexico' then 'North America'
	 when Location='India' then 'Asia'
	 when Location='Brazil' then 'South America'
	 when Location='United States' then 'North America'
	 when Location='Indonesia' then 'Asia'
	 when Location='Philippines' then 'Asia'
	 when Location='Japan' then 'Asia'
	 when Location='Vietnam' then 'Asia'
	 else 'Europe'
end as 'Continent' FROM `time-wasters on social media`)
select * from  TimeWasters_by_Continent where Age>18 and Age<=30; -- Time wasters Aged 18-30

--  Number of Time wasters Aged 18-30

select count(UserID) AS TimeWasters_Aged_18_to_30 FROM(
with TimeWasters_by_Continent as (SELECT * ,  
CASE when Location='Pakistan' then 'Middle East'
	 when Location='Mexico' then 'North America'
	 when Location='India' then 'Asia'
	 when Location='Brazil' then 'South America'
	 when Location='United States' then 'North America'
	 when Location='Indonesia' then 'Asia'
	 when Location='Philippines' then 'Asia'
	 when Location='Japan' then 'Asia'
	 when Location='Vietnam' then 'Asia'
	 else 'Europe'
end as 'Continent' FROM `time-wasters on social media`)
select * from  TimeWasters_by_Continent where Age>18 and Age<=30)as TimewastersAged18to30; 


-- Percentage of time wasters between age 18-30

select round( (select count(UserID)  from `time-wasters on social media`where Age >18 and Age <= 30) * 100/
(select count(UserID) FROM `time-wasters on social media` ),1)AS percentage_of_Time_wasters_Aged_18to30;

-- Average productivity loss for time wasters in various profession
select Profession , ROUND(avg(ProductivityLoss),0) as AverageProductivityloss 
from`time-wasters on social media` group by(Profession);

-- Time wasters in Continents by platform
with TimeWasters_by_Continent as (SELECT * ,  
CASE when Location='Pakistan' then 'Middle East'
	 when Location='Mexico' then 'North America'
	 when Location='India' then 'Asia'
	 when Location='Brazil' then 'South America'
	 when Location='United States' then 'North America'
	 when Location='Indonesia' then 'Asia'
	 when Location='Philippines' then 'Asia'
	 when Location='Japan' then 'Asia'
	 when Location='Vietnam' then 'Asia'
	 else 'Europe'
end as 'Continent' FROM `time-wasters on social media`)
select Platform,Continent,sum(TotalTimeSpent) from TimeWasters_by_Continent group by Continent,Platform;

-- video category and time spent on video by all time wasters
select VideoCategory,sum(TimeSpentOnVideo) as Time_spent_on_videos
 from `time-wasters on social media` group by(VideoCategory) order by Time_spent_on_videos;
 
 -- time wasters in debt
 select COUNT(Debt) from `time-wasters on social media` where Debt='TRUE';
 
 -- time wasters not in debt
 select COUNT(Debt) from `time-wasters on social media` where Debt='FALSE';
 
 -- number of Time wasters by watch reason
 Select WatchReason , count(WatchReason) as Number_of_Time_Wasters 
 from `time-wasters on social media` group by WatchReason order by Number_of_Time_Wasters ;
 
 -- Number of time wasters and when they are likely to spend time on social media
 select distinct Frequency,count(Frequency) as NumberOfTimeWasters
 from `time-wasters on social media` group by Frequency order by NumberOfTimeWasters;
 
 -- Number of time wasters by Addiction level
 select distinct AddictionLevel, count(UserID) as NumberOfTimeWasters from `time-wasters on social media`  
 group by AddictionLevel
 order by AddictionLevel;
 
 -- Average Addiction level
 select round(avg( AddictionLevel),0) as average_Addiction_level from `time-wasters on social media`;
 
 -- number of users by connection
 select distinct ConnectionType , count(UserID) as NumberOfUsers from `time-wasters on social media`
 group by ConnectionType;
 