

-- public.dim_calendar definition

CREATE TABLE dim_calendar (
	date_id int4 NULL,
	full_date date NOT NULL,
	CONSTRAINT dim_calendar_full_date_not_null NOT NULL full_date,
	CONSTRAINT dim_calendar_pk PRIMARY KEY (full_date)
);

=================================================================================================


-- public.dim_campaign definition

CREATE TABLE dim_campaign (
	campaign_id varchar(50) NOT NULL,
	campaign_name varchar(50) NULL,
	campaign_type varchar(50) NULL,
	channel_id varchar(50) NULL,
	start_date date NULL,
	end_date date NULL,
	budget float4 NULL,
	objective varchar(50) NULL,
	CONSTRAINT dim_campaign_campaign_id_not_null NOT NULL campaign_id,
	CONSTRAINT dim_campaign_pk PRIMARY KEY (campaign_id),
	CONSTRAINT dim_campaign_dim_channel_fk FOREIGN KEY (channel_id) REFERENCES dim_channel(channel_id)
);
CREATE INDEX dim_campaign_channel_id_idx ON public.dim_campaign USING btree (channel_id);


=================================================================================================

-- public.dim_channel definition

CREATE TABLE dim_channel (
	channel_id varchar(50) NOT NULL,
	channel_name varchar(50) NULL,
	channel_type varchar(50) NULL,
	description varchar(50) NULL,
	CONSTRAINT dim_channel_channel_id_not_null NOT NULL channel_id,
	CONSTRAINT dim_channel_pk PRIMARY KEY (channel_id)
);


=================================================================================================


-- public.dim_customer definition

CREATE TABLE dim_customer (
	customer_id varchar(50) NOT NULL,
	first_name varchar(50) NULL,
	last_name varchar(50) NULL,
	gender varchar(50) NULL,
	registration_date date NULL,
	income_bracket varchar(50) NULL,
	marital_status varchar(50) NULL,
	location_id varchar(50) NULL,
	CONSTRAINT dim_customer_customer_id_not_null NOT NULL customer_id,
	CONSTRAINT dim_customer_pk PRIMARY KEY (customer_id)
);


=================================================================================================


-- public.dim_delivery_person definition

CREATE TABLE dim_delivery_person (
	delivery_person_id varchar(50) NOT NULL,
	delivery_person_name varchar(50) NULL,
	gender varchar(50) NULL,
	date_of_joining date NULL,
	employment_type varchar(50) NULL,
	vehicle_type varchar(50) NULL,
	location_id varchar(50) NULL,
	CONSTRAINT dim_delivery_person_delivery_person_id_not_null NOT NULL delivery_person_id,
	CONSTRAINT dim_delivery_person_pk PRIMARY KEY (delivery_person_id)
);



=================================================================================================


-- public.dim_fulfillment definition

CREATE TABLE dim_fulfillment (
	fulfillment_id varchar(50) NOT NULL,
	shipping_method varchar(50) NULL,
	service_level varchar(50) NULL,
	delivery_sla_days int4 NULL,
	base_shipping_cost float4 NULL,
	CONSTRAINT dim_fulfillment_fulfillment_id_not_null NOT NULL fulfillment_id,
	CONSTRAINT dim_fulfillment_pk PRIMARY KEY (fulfillment_id)
);


=================================================================================================


-- public.dim_location definition

CREATE TABLE dim_location (
	location_id varchar(50) NOT NULL,
	state varchar(50) NULL,
	city varchar(50) NULL,
	postal_code int4 NULL,
	region varchar(50) NULL,
	latitude float4 NULL,
	longitude float4 NULL,
	area_type varchar(50) NULL,
	location_category varchar(50) NULL,
	CONSTRAINT dim_location_location_id_not_null NOT NULL location_id,
	CONSTRAINT dim_location_pk PRIMARY KEY (location_id)
);


=================================================================================================


-- public.dim_payment definition

CREATE TABLE dim_payment (
	payment_id varchar(50) NOT NULL,
	payment_method varchar(50) NULL,
	payment_provider varchar(50) NULL,
	CONSTRAINT dim_payment_payment_id_not_null NOT NULL payment_id,
	CONSTRAINT dim_payment_pk PRIMARY KEY (payment_id)
);


=================================================================================================


-- public.dim_product definition

CREATE TABLE dim_product (
	product_id varchar(50) NOT NULL,
	product_name varchar(50) NULL,
	brand varchar(50) NULL,
	category varchar(50) NULL,
	sub_category varchar(50) NULL,
	list_price int4 NULL,
	CONSTRAINT dim_product_pk PRIMARY KEY (product_id),
	CONSTRAINT dim_product_product_id_not_null NOT NULL product_id
);


=================================================================================================


-- public.dim_seller definition

CREATE TABLE dim_seller (
	seller_id varchar(50) NOT NULL,
	seller_name varchar(50) NULL,
	join_date date NULL,
	location_id varchar(50) NULL,
	rating float4 NULL,
	category_focus varchar(50) NULL,
	CONSTRAINT dim_seller_pk PRIMARY KEY (seller_id),
	CONSTRAINT dim_seller_seller_id_not_null NOT NULL seller_id
);


=================================================================================================


-- public.fact_customer_rfm definition

CREATE TABLE fact_customer_rfm (
	customer_id varchar(50) NOT NULL,
	recency_days int4 NULL,
	frequency_orders int4 NULL,
	monetary_value float4 NULL,
	avg_order_value float4 NULL,
	first_purchase_date date NULL,
	last_purchase_date date NULL,
	customer_lifetime_days int4 NULL,
	rfm_score int4 NULL,
	customer_segment varchar(50) NULL,
	CONSTRAINT fact_customer_rfm_customer_id_not_null NOT NULL customer_id,
	CONSTRAINT fact_customer_rfm_pk PRIMARY KEY (customer_id)
);
CREATE INDEX fact_customer_rfm_customer_id_idx ON public.fact_customer_rfm USING btree (customer_id);


-- public.fact_customer_rfm foreign keys

ALTER TABLE fact_customer_rfm ADD CONSTRAINT fact_customer_rfm_dim_customer_fk FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id);


=================================================================================================


-- public.fact_fulfillment_performance definition

CREATE TABLE fact_fulfillment_performance (
	date_id int4 NULL,
	fulfillment_id varchar(50) NULL,
	location_id varchar(50) NULL,
	delivery_person_id varchar(50) NULL,
	total_deliveries int4 NULL,
	completed_deliveries int4 NULL,
	returned_deliveries int4 NULL,
	avg_delivery_delay_days float4 NULL,
	avg_delivery_rating float4 NULL,
	total_shipping_cost float4 NULL,
	on_time_deliveries int4 NULL,
	late_deliveries int4 NULL,
	sla_breach_rate float4 NULL,
	return_rate float4 NULL
);
CREATE INDEX fact_fulfillment_performance_fulfillment_id_idx ON public.fact_fulfillment_performance USING btree (fulfillment_id);


-- public.fact_fulfillment_performance foreign keys

ALTER TABLE fact_fulfillment_performance ADD CONSTRAINT fact_fulfillment_performance_dim_fulfillment_fk FOREIGN KEY (fulfillment_id) REFERENCES dim_fulfillment(fulfillment_id);


=================================================================================================


-- public.fact_marketing_spend definition

CREATE TABLE fact_marketing_spend (
	marketing_id varchar(50) NOT NULL,
	date_id int4 NULL,
	campaign_id varchar(50) NULL,
	channel_id varchar(50) NULL,
	spend_amount float4 NULL,
	impressions int4 NULL,
	clicks int4 NULL,
	conversions int4 NULL,
	revenue_generated float4 NULL,
	CONSTRAINT fact_marketing_spend_marketing_id_not_null NOT NULL marketing_id,
	CONSTRAINT fact_marketing_spend_pk PRIMARY KEY (marketing_id)
);
CREATE INDEX fact_marketing_spend_campaign_id_idx ON public.fact_marketing_spend USING btree (campaign_id);


-- public.fact_marketing_spend foreign keys

ALTER TABLE fact_marketing_spend ADD CONSTRAINT fact_marketing_spend_dim_campaign_fk FOREIGN KEY (campaign_id) REFERENCES dim_campaign(campaign_id);




=================================================================================================



-- public.fact_orders definition

CREATE TABLE fact_orders (
	order_line_id varchar(50) NOT NULL,
	order_id varchar(50) NULL,
	date_id int4 NULL,
	order_date date NULL,
	customer_id varchar(50) NULL,
	product_id varchar(50) NULL,
	category varchar(50) NULL,
	seller_id varchar(50) NULL,
	seller_rating float4 NULL,
	location_id varchar(50) NULL,
	delivery_person_id varchar(50) NULL,
	payment_id varchar(50) NULL,
	campaign_id varchar(50) NULL,
	fulfillment_id varchar(50) NULL,
	quantity int4 NULL,
	unit_price int4 NULL,
	discount_percentage float4 NULL,
	tax_percentage int4 NULL,
	shipping_fee float4 NULL,
	expected_delivery_date date NULL,
	actual_delivery_date date NULL,
	delivery_rating float4 NULL,
	order_status varchar(50) NULL,
	return_flag bool NULL,
	refund_amount float4 NULL,
	return_date varchar(50) NULL,
	customer_rating float4 NULL,
	sentiment_score float4 NULL,
	delivery_delay_days int4 NULL,
	delivery_sla_days int4 NULL,
	gross_amount int4 NULL,
	discount_amount float4 NULL,
	tax_amount float4 NULL,
	net_amount float4 NULL,
	CONSTRAINT fact_orders_order_line_id_not_null NOT NULL order_line_id,
	CONSTRAINT fact_orders_pk PRIMARY KEY (order_line_id)
);
CREATE INDEX fact_orders_campaign_id_idx ON public.fact_orders USING btree (campaign_id);
CREATE INDEX fact_orders_customer_id_idx ON public.fact_orders USING btree (customer_id);
CREATE INDEX fact_orders_delivery_person_id_idx ON public.fact_orders USING btree (delivery_person_id);
CREATE INDEX fact_orders_fulfillment_id_idx ON public.fact_orders USING btree (fulfillment_id);
CREATE INDEX fact_orders_location_id_idx ON public.fact_orders USING btree (location_id);
CREATE INDEX fact_orders_order_date_idx ON public.fact_orders USING btree (order_date);
CREATE INDEX fact_orders_payment_id_idx ON public.fact_orders USING btree (payment_id);
CREATE INDEX fact_orders_product_id_idx ON public.fact_orders USING btree (product_id);
CREATE INDEX fact_orders_seller_id_idx ON public.fact_orders USING btree (seller_id);


-- public.fact_orders foreign keys

ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_calendar_fk FOREIGN KEY (order_date) REFERENCES dim_calendar(full_date);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_campaign_fk FOREIGN KEY (campaign_id) REFERENCES dim_campaign(campaign_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_customer_fk FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_delivery_person_fk FOREIGN KEY (delivery_person_id) REFERENCES dim_delivery_person(delivery_person_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_fulfillment_fk FOREIGN KEY (fulfillment_id) REFERENCES dim_fulfillment(fulfillment_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_location_fk FOREIGN KEY (location_id) REFERENCES dim_location(location_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_payment_fk FOREIGN KEY (payment_id) REFERENCES dim_payment(payment_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_product_fk FOREIGN KEY (product_id) REFERENCES dim_product(product_id);
ALTER TABLE fact_orders ADD CONSTRAINT fact_orders_dim_seller_fk FOREIGN KEY (seller_id) REFERENCES dim_seller(seller_id);


=================================================================================================


-- public.fact_returns definition

CREATE TABLE fact_returns (
	order_line_id varchar(50) NOT NULL,
	order_id varchar(50) NULL,
	date_id int4 NULL,
	customer_id varchar(50) NULL,
	product_id varchar(50) NULL,
	location_id varchar(50) NULL,
	payment_id varchar(50) NULL,
	fulfillment_id varchar(50) NULL,
	quantity int4 NULL,
	unit_price int4 NULL,
	refund_amount float4 NULL,
	days_to_return int4 NULL,
	restocking_fee float4 NULL,
	customer_rating float4 NULL,
	sentiment_score float4 NULL,
	CONSTRAINT fact_returns_order_line_id_not_null NOT NULL order_line_id,
	CONSTRAINT fact_returns_pk PRIMARY KEY (order_line_id)
);


-- public.fact_returns foreign keys

ALTER TABLE fact_returns ADD CONSTRAINT fact_returns_fact_orders_fk FOREIGN KEY (order_line_id) REFERENCES fact_orders(order_line_id);



=================================================================================================

