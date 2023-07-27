CREATE TABLE IF NOT EXISTS coffee_shops
(
    shop_id integer NOT NULL,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    owner_firstname VARCHAR(255) NOT NULL,
    owner_lastname VARCHAR(255) NOT NULL,
    CONSTRAINT coffee_shops_pkey PRIMARY KEY (shop_id)
);

CREATE TABLE IF NOT EXISTS coffee_shops_coffee_types
(
    shop_id integer NOT NULL,
    coffee_type VARCHAR(255) NOT NULL,
    size VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS coffee_types
(
    coffee_type VARCHAR(255) NOT NULL,
    size VARCHAR(255) NOT NULL,
    CONSTRAINT coffee_types_pkey PRIMARY KEY (coffee_type, size)
);

CREATE TABLE IF NOT EXISTS customer_login
(
    customer_id integer NOT NULL,
    customer_password VARCHAR(255) NOT NULL,
    CONSTRAINT customer_login_pkey PRIMARY KEY (customer_id, customer_password)
);

CREATE TABLE IF NOT EXISTS customers
(
    customer_id integer NOT NULL,
    customer_firstname VARCHAR(255),
    customer_lastname VARCHAR(255),
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS orderitem
(
    coffee_type VARCHAR(255) NOT NULL,
    size VARCHAR(255) NOT NULL,
    nummer integer,
    order_id integer NOT NULL,
    CONSTRAINT orderitem_pkey PRIMARY KEY (coffee_type, size, order_id)
);

CREATE TABLE IF NOT EXISTS orders
(
    order_id integer NOT NULL,
    shop_id integer,
    customer_id integer,
    order_date integer,
    CONSTRAINT order_pkey PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS ratings
(
    customer_id integer NOT NULL,
    shop_id integer NOT NULL,
    score integer,
    CONSTRAINT ratings_pkey PRIMARY KEY (customer_id, shop_id)
);

CREATE TABLE IF NOT EXISTS shop_login
(
    shop_password VARCHAR(255) NOT NULL,
    shop_id integer NOT NULL,
    CONSTRAINT shop_login_pkey PRIMARY KEY (shop_password, shop_id)
);

ALTER TABLE IF EXISTS coffee_shops_coffee_types
    ADD CONSTRAINT shop_connector_mn FOREIGN KEY (shop_id)
    REFERENCES coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS coffee_shops_coffee_types
    ADD CONSTRAINT type_connector_mn FOREIGN KEY (coffee_type, size)
    REFERENCES coffee_types (coffee_type, size) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS customer_login
    ADD CONSTRAINT customer_connector_p FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS orderitem
    ADD CONSTRAINT order_connector FOREIGN KEY (order_id)
    REFERENCES orders (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS orderitem
    ADD CONSTRAINT type_connector FOREIGN KEY (coffee_type, size)
    REFERENCES coffee_types (coffee_type, size) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS orders
    ADD CONSTRAINT customer_connector2 FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS orders
    ADD CONSTRAINT shop_connector2 FOREIGN KEY (shop_id)
    REFERENCES coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS ratings
    ADD CONSTRAINT customer_connector FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS ratings
    ADD CONSTRAINT shop_connector FOREIGN KEY (shop_id)
    REFERENCES coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS shop_login
    ADD CONSTRAINT shop_connector_p FOREIGN KEY (shop_id)
    REFERENCES coffee_shops (shop_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

CREATE TABLE big_data (
    coffee_type VARCHAR(255),
    size VARCHAR(255),
    score INT,
    batch_time INT,
    PRIMARY KEY (coffee_type, size, batch_time)
);

