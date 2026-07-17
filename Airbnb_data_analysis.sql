
-- Which neighbourhood group has the highest average listing price?
select round(avg(price),2) as Average_price,
neighbourhood_group
from airbnb
group by neighbourhood_group
order by Average_price desc
limit 1;

-- Which room type is the most expensive?

select room_type,
round(avg(price),2) as Average_price
from airbnb
group by room_type
order by Average_price desc;

-- Which neighbourhood has the highest number of listings 

select count(*) as Total_number_of_listings,
neighbourhood_group
from airbnb
group by neighbourhood_group
order by Total_number_of_listings desc;

-- Top 10 most expensive properties

SELECT host_name,
       MAX(price) AS highest_price
FROM airbnb
GROUP BY host_name
ORDER BY highest_price DESC
LIMIT 10;


-- Which hosts own the most listings?
select
host_name, 
count(*) as total_listings
from airbnb
group by host_name
order by total_listings desc
limit 5;

-- Instant booking adoption rate
select
instant_bookable,
count(*) as total_listings,
round(count(*)*100/(select count(*) from airbnb),2)as percentage
from airbnb
group by instant_bookable;

-- Average service fee by room type
select round(avg(service_fee),1)as average_service_fees,
room_type
from airbnb
group by room_type
order by average_service_fees desc;

-- Which cancellation policy is most common?
select count(*),
cancellation_policy
from airbnb
group by cancellation_policy;

-- Which neighbourhood has the highest average reviews?
select count(*),
round(avg(number_of_reviews),2) as average_review, 
neighbourhood_group
from airbnb
group by neighbourhood_group
order by average_review desc;

-- Price difference between verified and non-verified hosts

select 
host_identity_verified,
round(avg(price),2) as average_price
from airbnb
group by host_identity_verified
order by average_price desc;


-- Average minimum stay by room type
select room_type,
round(avg(minimum_nights),3) as average_nights
from airbnb
group by room_type
order by average_nights desc;

-- Top neighbourhoods by total revenue potential

select 
neighbourhood_group,
sum(price) as total_revenue
from airbnb
group by neighbourhood_group
order by total_revenue desc;

-- Which room type gets the most reviews?
select room_type,
round(avg(number_of_reviews),3) as total_reviews 
from airbnb
group by room_type
order by total_reviews desc;


-- Most expensive neighbourhood for each room type

select neighbourhood_group,
room_type,
round(avg(price),3) as average_price
from airbnb
group by room_type, neighbourhood_group
order by room_type, average_price desc;

-- Properties charging above overall average price
select name,
price,
neighbourhood_group,
room_type
from airbnb
where price > 
(select avg(price) from airbnb)
order by price desc;


-- Top 10 hosts earning the highest potential revenue

select host_name,
count(*) as total_listings,
sum(price) as total_price
from airbnb
group by host_name
order by total_price desc
limit 10;

-- Average property price by construction year
select
round(avg(price),3) as average_price,
construction_year
from airbnb
group by construction_year
order by construction_year;

-- Premium locations with high customer engagement
select neighbourhood_group,
round(avg(price),3) as average_price,
round(avg(number_of_reviews),3) as average_reviews
from airbnb
group by neighbourhood_group
order by average_price desc, average_reviews desc;

-- Average service fee percentage
select 
round(avg(service_fee/price)*100,2) as average_percentage
from airbnb;


-- Top 10 highest-rated (most reviewed) premium listings
select 
name,host_name,
price,
number_of_reviews
from airbnb
order by price desc,number_of_reviews desc
limit 10;

-- Rank neighbourhoods by average price
select 
neighbourhood_group,
round(avg(price),3) as average_price,
RANK() OVER(ORDER BY AVG(price) DESC) AS price_rank
FROM airbnb
GROUP BY neighbourhood_group;




















