BEGIN;


CREATE TABLE IF NOT EXISTS public.coffee_shops
(
    shop_id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    city character varying COLLATE pg_catalog."default" NOT NULL,
    adress character varying COLLATE pg_catalog."default" NOT NULL,
    owner_firstname character varying COLLATE pg_catalog."default" NOT NULL,
    owner_lastname character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT coffee_shops_pkey PRIMARY KEY (shop_id)
);

CREATE TABLE IF NOT EXISTS public.coffee_shops_coffee_types
(
    shop_id integer NOT NULL,
    type_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.coffee_types
(
    type_id integer NOT NULL,
    coffee_type character varying COLLATE pg_catalog."default",
    size character varying COLLATE pg_catalog."default",
    CONSTRAINT coffee_types_pkey PRIMARY KEY (type_id)
);

CREATE TABLE IF NOT EXISTS public.customer_login
(
    customer_id integer,
    customer_password character varying COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.customers
(
    customer_id integer NOT NULL,
    customer_firstname character varying COLLATE pg_catalog."default",
    customer_lastname character varying COLLATE pg_catalog."default",
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS public."order"
(
    order_id integer NOT NULL,
    shop_id integer,
    customer_id integer,
    "time" time without time zone,
    CONSTRAINT order_pkey PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS public.orderitem
(
    type_id integer,
    "number" integer,
    order_id integer
);

CREATE TABLE IF NOT EXISTS public.ratings
(
    rating_id integer NOT NULL,
    customer_id integer,
    shop_id integer,
    score integer,
    CONSTRAINT ratings_pkey PRIMARY KEY (rating_id)
);

CREATE TABLE IF NOT EXISTS public.shop_login
(
    shop_password character varying COLLATE pg_catalog."default",
    shop_id integer
);

ALTER TABLE IF EXISTS public.coffee_shops_coffee_types
    ADD CONSTRAINT shop_connector_mn FOREIGN KEY (shop_id)
    REFERENCES public.coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.coffee_shops_coffee_types
    ADD CONSTRAINT type_connector_mn FOREIGN KEY (type_id)
    REFERENCES public.coffee_types (type_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.customer_login
    ADD CONSTRAINT customer_connector_p FOREIGN KEY (customer_id)
    REFERENCES public.customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT customer_connector2 FOREIGN KEY (customer_id)
    REFERENCES public.customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT shop_connector2 FOREIGN KEY (shop_id)
    REFERENCES public.coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.orderitem
    ADD CONSTRAINT order_connector FOREIGN KEY (order_id)
    REFERENCES public."order" (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orderitem
    ADD CONSTRAINT type_connector FOREIGN KEY (type_id)
    REFERENCES public.coffee_types (type_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.ratings
    ADD CONSTRAINT customer_connector FOREIGN KEY (customer_id)
    REFERENCES public.customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.ratings
    ADD CONSTRAINT shop_connector FOREIGN KEY (shop_id)
    REFERENCES public.coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.shop_login
    ADD CONSTRAINT shop_connector_p FOREIGN KEY (shop_id)
    REFERENCES public.coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;