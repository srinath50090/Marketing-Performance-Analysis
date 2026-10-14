

=================================== Data Cleaning & Quality checks =================================================


create view vw_campaign as
select
    trim(campaign_id) as campaign_id ,
    trim(campaign_name) as campaign_name,
    initcap(trim(campaign_type)) as campaign_type ,
    trim(channel_id) as channel_id ,
    start_date,
    end_date,
    round(budget::numeric,2) as budget_per_day,
    initcap(trim(objective)) as objective
from dim_campaign


=============================================================================================================


create view vw_channel as
select
    trim(channel_id) as channel_id ,
    trim(channel_name) as channel_name ,
    trim(channel_type) as channel_type 
from
    dim_channel;


=============================================================================================================


create view vw_customer as
select
    trim(customer_id) as customer_id ,
    case 
    	when trim(gender) = 'M' then 'Male'
    	when trim(gender) = 'F' then 'Female'
    	else 'Others'
    end gender,
    registration_date,
    trim(income_bracket) as income_bracket ,
    trim(marital_status) as marital_status ,
    trim(location_id) as location_id 
from
    dim_customer;


=============================================================================================================


create view vw_delivery_person as 
select
    trim(delivery_person_id) as delivery_person_id ,
    initcap(trim(gender)) as gender,
    initcap(trim(employment_type)) as employment_type ,
    initcap(trim(vehicle_type)) as vehicle_type,
    trim(location_id) as location_id
from
    dim_delivery_person;


=============================================================================================================


create view vw_fulfillment as
select
    trim(fulfillment_id) as fulfillment_id,
    trim(shipping_method) as shipping_method,
    trim(service_level) as service_level ,
    delivery_sla_days ,
    round(base_shipping_cost ::numeric,2) as base_shipping_cost 
from
    dim_fulfillment;


=============================================================================================================


create view vw_location as
select
    trim(location_id) as location_id ,
    initcap(trim(state)) as state ,
    initcap(trim(city)) as city,
    initcap(trim(region)) as region 
from
    dim_location;



=============================================================================================================


create view vw_payment as 
select
    trim(payment_id) as payment_id ,
    trim(payment_method) as payment_method,
    trim(payment_provider) as payment_provider
from
    dim_payment;


=============================================================================================================


create view vw_product as
select
    trim(product_id) as product_id ,
    trim(product_name) as product_name ,
    trim(brand) as brand ,
    trim(category) as category ,
    trim(sub_category) as subcategory,
    list_price,
    round(estimated_product_cost::numeric,2) as estimated_product_cost
from
    dim_product;



=============================================================================================================


create view vw_seller as
select
    trim(seller_id) as seller_id,
    trim(location_id) as location_id,
    trim(category_focus) as category_focus
from
    dim_seller;


=============================================================================================================


create view vw_fact_customer_rfm as
select
    trim(customer_id) as customer_id ,
    recency_days,
    frequency_orders,
    round(monetary_value::numeric,2) as monetary_value,
    round(avg_order_value ::numeric,2) as avg_order_value,
    first_purchase_date,
    last_purchase_date,
    customer_lifetime_days,
    rfm_score,
    initcap(trim(customer_segment)) as customer_segment
from
    fact_customer_rfm;

=============================================================================================================



create view vw_fact_fulfillment_performance as 
select
    trim(fulfillment_id) as fulfillment_id ,
    trim(location_id) as location_id,
    trim(delivery_person_id) as delivery_person_id ,
    total_deliveries,
    completed_deliveries,
    returned_deliveries,
    avg_delivery_delay_days,
    round(total_shipping_cost::numeric,2) as total_shipping_cost,
    on_time_deliveries,
    late_deliveries,
    sla_breach_rate,
    return_rate
from
    fact_fulfillment_performance;


=============================================================================================================



-- Marketing Spend: 
			-- Marketing spend should fall within the campaign duration. 
			-- Since some records were outside the campaign period, 
			-- impressions, clicks, conversions and marketing spend were extracted using only records within the campaign start and end date



create view vw_fact_marketing_spend as
with cte as (
select
    trim(marketing_id) as marketing_id,
    to_date(date_id ::text,'YYYYMMDD') as date,
    trim(campaign_id) as campaign_id ,
    trim(channel_id) as channel_id ,
    round(spend_amount::numeric,2) as spend_amount,
    impressions,
    clicks,
    conversions
from
    fact_marketing_spend
where to_date(date_id ::text,'YYYYMMDD') < '01-04-2026'
)
select *
from cte 
where "date" >= (select vc.start_date from vw_campaign vc  where cte.campaign_id =vc.campaign_id )


=============================================================================================================



create view vw_number_of_campaigned_days_in_campaign_duration as
select 
vc.campaign_id ,
count(distinct vfms."date") as number_of_campaigned_days
from vw_campaign vc 
join vw_fact_marketing_spend vfms 
on vc.campaign_id =vfms.campaign_id 
group by vc.campaign_id 


=============================================================================================================



-- Orders attributed to a campaign should occur on or after the campaign start date and on or before the campaign end date. 
-- However, some records were found outside the campaign period and require further investigation to determine why this occurred. 
-- For this analysis, only records that fall within the campaign start and end dates were included


create materialized view m_vw_fact_orders as
select
    trim(order_line_id) as order_line_id ,
    trim(order_id) as order_id ,
    order_date,
    trim(customer_id) as customer_id ,
    trim(fo.product_id) as product_id ,
    trim(seller_id) as seller_id ,
    trim(fo.location_id) as location_id,
    trim(fo.delivery_person_id) as delivery_person_id,
    trim(payment_id) as payment_id ,
    trim(campaign_id) as campaign_id ,
    trim(fo.fulfillment_id) as fulfillment_id ,
    quantity,
    unit_price,
    round(discount_percentage ::numeric, 2) as discount_percentage,
    tax_percentage,
    round(shipping_fee ::numeric, 2) as shipping_fee,
    expected_delivery_date,
    actual_delivery_date,
    trim(order_status) as order_status,
    return_flag,
    sentiment_score,
    delivery_delay_days,
    delivery_sla_days,
    gross_amount,
    round((dp.estimated_product_cost * fo.quantity)::numeric,2) as COGS,
    round(discount_amount::numeric, 2) as discount_amount,
    round(tax_amount::numeric, 2) as tax_amount,
    round(net_amount::numeric, 2) as net_amount
from fact_orders fo
left join dim_product dp 
on fo.product_id = dp.product_id
where 
		fo.order_date >= ( select vc.start_date from vw_campaign vc  where vc.campaign_id = fo.campaign_id  ) and 
		fo.order_date <= '31-03-2026'




create view vw_fact_orders as  
select * from m_vw_fact_orders


=============================================================================================================



create view vw_fact_returns as
select
    trim(order_line_id) as order_line_id ,
    trim(order_id) as order_id ,
    trim(customer_id) as customer_id ,
    trim(product_id) as product_id ,
    trim(location_id) as location_id ,
    trim(payment_id) as payment_id ,
    trim(fulfillment_id) as fulfillment_id ,
    quantity,
    unit_price,
    refund_amount,
    days_to_return,
    restocking_fee,
    sentiment_score
from
    fact_returns;




=============================================================================================================


-- Checking that sigle order contains multiple items or not by order date and customer

select 
vfo.order_id,
vfo.order_date ,
vfo.customer_id ,
count(vfo.order_id)
from vw_fact_orders vfo 
group by vfo.order_id ,vfo.order_date ,vfo.customer_id 
having count(vfo.order_id) > 1

-- There is no records



=============================================================================================================

=============================================================================================================





======================================= Finding Duplicates =================================================



with cte as (
select 
*,
row_number() over( partition by date_id, full_date) as rn
from dim_calendar
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by campaign_id, campaign_name, campaign_type, channel_id, start_date, end_date, budget, objective) as rn
from dim_campaign
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by channel_id, channel_name, channel_type, description) as rn
from dim_channel
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by  customer_id, first_name, last_name, gender, registration_date, income_bracket, marital_status, location_id ) as rn
from dim_customer
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



with cte as (
select 
*,
row_number() over( partition by  delivery_person_id, delivery_person_name, gender, date_of_joining, employment_type, vehicle_type, location_id ) as rn
from dim_delivery_person
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



with cte as (
select 
*,
row_number() over( partition by  fulfillment_id, shipping_method, service_level, delivery_sla_days, base_shipping_cost ) as rn
from dim_fulfillment
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by  location_id, state, city, postal_code, region, latitude, longitude, area_type, location_category ) as rn
from dim_location
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by payment_id, payment_method, payment_provider ) as rn
from dim_payment
)
select *
from cte
where rn > 1

-- There are No Duplicates



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by product_id, product_name, brand, category, sub_category, list_price ) as rn
from dim_product
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by seller_id, seller_name, join_date, location_id, rating, category_focus ) as rn
from dim_seller
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by customer_id, recency_days, frequency_orders, monetary_value, avg_order_value, first_purchase_date, last_purchase_date, customer_lifetime_days, rfm_score, customer_segment ) as rn
from fact_customer_rfm
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by date_id, fulfillment_id, location_id, delivery_person_id, total_deliveries, completed_deliveries, returned_deliveries, avg_delivery_delay_days, avg_delivery_rating, total_shipping_cost, on_time_deliveries, late_deliveries, sla_breach_rate, return_rate ) as rn
from fact_fulfillment_performance
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by marketing_id, date_id, campaign_id, channel_id, spend_amount, impressions, clicks, conversions, revenue_generated ) as rn
from fact_marketing_spend
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by order_line_id, order_id, date_id, order_date, customer_id, product_id, category, seller_id, seller_rating, location_id, delivery_person_id, payment_id, campaign_id, fulfillment_id, quantity, unit_price, discount_percentage, tax_percentage, shipping_fee, expected_delivery_date, actual_delivery_date, delivery_rating, order_status, return_flag, refund_amount, return_date, customer_rating, sentiment_score, delivery_delay_days, delivery_sla_days, gross_amount, discount_amount, tax_amount, net_amount ) as rn
from fact_orders
)
select *
from cte
where rn > 1

-- There are No Duplicates


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


with cte as (
select 
*,
row_number() over( partition by order_line_id, order_id, date_id, customer_id, product_id, location_id, payment_id, fulfillment_id, quantity, unit_price, refund_amount, days_to_return, restocking_fee, customer_rating, sentiment_score ) as rn
from fact_returns
)
select *
from cte
where rn > 1


-- There are No Duplicates



=============================================================================================================

=============================================================================================================

