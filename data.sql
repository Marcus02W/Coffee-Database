INSERT INTO coffee_types (type_id, coffee_type, size)
VALUES
    (1, 'Espresso', 'S'),
    (2, 'Espresso', 'M'),
    (3, 'Espresso', 'L'),
    (4, 'Americano', 'S'),
    (5, 'Americano', 'M'),
    (6, 'Americano', 'L'),
    (7, 'Latte', 'S'),
    (8, 'Latte', 'M'),
    (9, 'Latte', 'L'),
    (10, 'Cappuccino', 'S'),
    (11, 'Cappuccino', 'M'),
    (12, 'Cappuccino', 'L'),
    (13, 'Macchiato', 'S'),
    (14, 'Macchiato', 'M'),
    (15, 'Macchiato', 'L'),
    (16, 'Mocha', 'S'),
    (17, 'Mocha', 'M'),
    (18, 'Mocha', 'L'),
    (19, 'Flat White', 'S'),
    (20, 'Flat White', 'M'),
    (21, 'Flat White', 'L'),
    (22, 'Filterkaffee', 'S'),
    (23, 'Filterkaffee', 'M'),
    (24, 'Filterkaffee', 'L'),
    (25, 'Frappé', 'S'),
    (26, 'Frappé', 'M'),
    (27, 'Frappé', 'L'),
    (28, 'Affogato', 'S'),
    (29, 'Affogato', 'M'),
    (30, 'Affogato', 'L');

INSERT INTO coffee_shops (shop_id, name, country, city, street, owner_firstname, owner_lastname)
VALUES
    (1, 'Blue Bottle Coffee', 'USA', 'Oakland', '300 Webster St', 'James', 'Freeman'),
    (2, 'Starbucks', 'USA', 'Seattle', '2401 Utah Ave S', 'Howard', 'Schultz'),
    (3, 'Café de Flore', 'Frankreich', 'Paris', '172 Boulevard Saint-Germain', 'Fernand', 'Petiot'),
    (4, 'The Coffee Academics', 'Hongkong', 'Hongkong', '38 Yiu Wa St', 'Jennifer', 'Liu'),
    (5, 'Stumptown Coffee Roasters', 'USA', 'Portland', '128 SW 3rd Ave', 'Duane', 'Sorenson'),
    (6, 'Tim Wendelboe', 'Norwegen', 'Oslo', 'Grüners gate 1', 'Tim', 'Wendelboe'),
    (7, 'Intelligentsia Coffee', 'USA', 'Chicago', '53 W Jackson Blvd', 'Doug', 'Zell'),
    (8, 'Coffee Collective', 'Dänemark', 'Kopenhagen', 'Jægersborggade 57', 'Casper', 'Engel'),
    (9, 'Toby''s Estate', 'USA', 'Brooklyn', '125 N 6th St', 'Toby', 'Smith'),
    (10, 'Philz Coffee', 'USA', 'San Francisco', '748 Van Ness Ave', 'Phil', 'Jaber');

INSERT INTO shop_login (shop_id, shop_password)
VALUES
    (1, 'abc123'),
    (2, 'def456'),
    (3, 'ghi789'),
    (4, 'jkl012'),
    (5, 'mno345'),
    (6, 'pqr678'),
    (7, 'stu901'),
    (8, 'vwx234'),
    (9, 'yza567'),
    (10, 'bcd890');

INSERT INTO customers (customer_id, customer_firstname, customer_lastname)
VALUES
    (1, 'Jeff', 'Bezos'),
    (2, 'Elon', 'Musk'),
    (3, 'Bernard', 'Arnault'),
    (4, 'Bill', 'Gates'),
    (5, 'Mark', 'Zuckerberg'),
    (6, 'Françoise', 'Bettencourt Meyers'),
    (7, 'Alice', 'Walton'),
    (8, 'MacKenzie', 'Scott'),
    (9, 'Julia', 'Koch'),
    (10, 'Jacqueline', 'Mars');

INSERT INTO customer_login (customer_id, customer_password)
VALUES
    (1, '123456'),
    (2, 'password'),
    (3, '123456789'),
    (4, 'qwerty'),
    (5, '1234567'),
    (6, '12345678'),
    (7, '12345'),
    (8, 'admin'),
    (9, '123123'),
    (10, 'letmein');

INSERT INTO orders (order_id, shop_id, customer_id, time)
VALUES
    (1, 7, 2, TIMESTAMP '2022-02-01 08:00:00'),
    (2, 4, 6, TIMESTAMP '2022-02-02 09:15:00'),
    (3, 9, 3, TIMESTAMP '2022-02-03 10:30:00'),
    (4, 3, 8, TIMESTAMP '2022-02-04 11:45:00'),
    (5, 5, 9, TIMESTAMP '2022-02-05 12:30:00'),
    (6, 8, 7, TIMESTAMP '2022-02-06 13:45:00'),
    (7, 2, 10, TIMESTAMP '2022-02-07 14:30:00'),
    (8, 1, 1, TIMESTAMP '2022-02-08 15:45:00'),
    (9, 10, 4, TIMESTAMP '2022-02-09 16:30:00'),
    (10, 6, 5, TIMESTAMP '2022-02-10 17:45:00'),
    (11, 4, 1, TIMESTAMP '2022-02-11 18:30:00'),
    (12, 3, 6, TIMESTAMP '2022-02-12 19:45:00'),
    (13, 8, 3, TIMESTAMP '2022-02-13 20:30:00'),
    (14, 7, 8, TIMESTAMP '2022-02-14 21:45:00'),
    (15, 5, 9, TIMESTAMP '2022-02-15 08:30:00'),
    (16, 2, 7, TIMESTAMP '2022-02-16 09:45:00'),
    (17, 1, 10, TIMESTAMP '2022-02-17 10:30:00'),
    (18, 9, 2, TIMESTAMP '2022-02-18 11:45:00'),
    (19, 10, 5, TIMESTAMP '2022-02-19 12:30:00'),
    (20, 6, 4, TIMESTAMP '2022-02-20 13:45:00'),
    (21, 5, 2, TIMESTAMP '2022-02-21 14:30:00'),
    (22, 8, 7, TIMESTAMP '2022-02-22 15:45:00'),
    (23, 7, 1, TIMESTAMP '2022-02-23 16:30:00'),
    (24, 4, 6, TIMESTAMP '2022-02-24 17:45:00'),
    (25, 9, 8, TIMESTAMP '2022-02-25 18:30:00'),
    (26, 3, 10, TIMESTAMP '2022-02-26 19:45:00'),
    (27, 5, 3, TIMESTAMP '2022-02-27 20:30:00'),
    (28, 2, 9, TIMESTAMP '2022-02-28 21:45:00'),
    (29, 1, 4, TIMESTAMP '2022-03-01 08:30:00');

INSERT INTO orders (order_id, shop_id, customer_id, time)
VALUES
    (30, 10, 5, TIMESTAMP '2022-03-02 09:45:00'),
	(31, 6, 1, TIMESTAMP '2022-03-03 10:30:00'),
	(32, 4, 3, TIMESTAMP '2022-03-04 11:45:00'),
	(33, 8, 7, TIMESTAMP '2022-03-05 12:30:00'),
	(34, 7, 8, TIMESTAMP '2022-03-06 13:45:00'),
	(35, 5, 10, TIMESTAMP '2022-03-07 14:30:00'),
	(36, 2, 2, TIMESTAMP '2022-03-08 15:45:00'),
	(37, 1, 6, TIMESTAMP '2022-03-09 16:30:00'),
	(38, 9, 4, TIMESTAMP '2022-03-10 17:45:00'),
	(39, 10, 9, TIMESTAMP '2022-03-11 18:30:00'),
	(40, 6, 7, TIMESTAMP '2022-03-12 19:45:00'),
	(41, 4, 8, TIMESTAMP '2022-03-13 20:30:00'),
	(42, 3, 1, TIMESTAMP '2022-03-14 21:45:00'),
	(43, 8, 3, TIMESTAMP '2022-03-15 08:30:00'),
	(44, 7, 10, TIMESTAMP '2022-03-16 09:45:00'),
	(45, 5, 2, TIMESTAMP '2022-03-17 10:30:00'),
	(46, 2, 5, TIMESTAMP '2022-03-18 11:45:00'),
	(47, 1, 6, TIMESTAMP '2022-03-19 12:30:00'),
	(48, 9, 4, TIMESTAMP '2022-03-20 13:45:00'),
	(49, 10, 7, TIMESTAMP '2022-03-21 14:30:00'),
	(50, 6, 9, TIMESTAMP '2022-03-22 15:45:00'),
	(51, 4, 10, TIMESTAMP '2022-03-23 16:30:00'),
	(52, 3, 2, TIMESTAMP '2022-03-24 17:45:00'),
	(53, 8, 1, TIMESTAMP '2022-03-25 18:30:00'),
	(54, 7, 5, TIMESTAMP '2022-03-26 19:45:00'),
	(55, 5, 8, TIMESTAMP '2022-03-27 20:30:00'),
	(56, 2, 6, TIMESTAMP '2022-03-28 21:45:00'),
	(57, 1, 3, TIMESTAMP '2022-03-29 08:30:00'),
	(58, 9, 7, TIMESTAMP '2022-03-30 09:45:00'),
	(59, 10, 4, TIMESTAMP '2022-03-31 10:30:00'),
	(60, 6, 9, TIMESTAMP '2022-04-01 11:45:00'),
	(61, 4, 7, TIMESTAMP '2022-04-02 12:30:00'),
	(62, 3, 5, TIMESTAMP '2022-04-03 13:45:00'),
	(63, 8, 2, TIMESTAMP '2022-04-04 14:30:00'),
	(64, 7, 6, TIMESTAMP '2022-04-05 15:45:00'),
	(65, 5, 1, TIMESTAMP '2022-04-06 16:30:00'),
	(66, 2, 10, TIMESTAMP '2022-04-07 17:45:00'),
	(67, 1, 4, TIMESTAMP '2022-04-08 18:30:00'),
	(68, 9, 8, TIMESTAMP '2022-04-09 19:45:00'),
	(69, 10, 3, TIMESTAMP '2022-04-10 20:30:00'),
	(70, 6, 5, TIMESTAMP '2022-04-11 21:45:00'),
	(71, 4, 2, TIMESTAMP '2022-04-12 08:30:00'),
	(72, 3, 7, TIMESTAMP '2022-04-13 09:45:00'),
	(73, 8, 1, TIMESTAMP '2022-04-14 10:30:00'),
	(74, 7, 9, TIMESTAMP '2022-04-15 11:45:00'),
	(75, 5, 6, TIMESTAMP '2022-04-16 12:30:00'),
	(76, 2, 4, TIMESTAMP '2022-04-17 13:45:00'),
	(77, 1, 10, TIMESTAMP '2022-04-18 14:30:00'),
	(78, 9, 3, TIMESTAMP '2022-04-19 15:45:00'),
	(79, 10, 7, TIMESTAMP '2022-04-20 16:30:00'),
	(80, 6, 1, TIMESTAMP '2022-04-21 17:45:00'),
	(81, 4, 6, TIMESTAMP '2022-04-22 18:30:00'),
	(82, 3, 8, TIMESTAMP '2022-04-23 19:45:00'),
	(83, 8, 2, TIMESTAMP '2022-04-24 20:30:00'),
	(84, 7, 10, TIMESTAMP '2022-04-25 21:45:00'),
	(85, 5, 5, TIMESTAMP '2022-04-26 08:30:00'),
	(86, 2, 9, TIMESTAMP '2022-04-27 09:45:00'),
	(87, 1, 3, TIMESTAMP '2022-04-28 10:30:00'),
	(88, 9, 7, TIMESTAMP '2022-04-29 11:45:00'),
	(89, 10, 4, TIMESTAMP '2022-04-30 12:30:00'),
	(90, 6, 9, TIMESTAMP '2022-05-01 13:45:00'),
	(91, 4, 7, TIMESTAMP '2022-05-02 14:30:00'),
	(92, 3, 5, TIMESTAMP '2022-05-03 15:45:00'),
	(93, 8, 2, TIMESTAMP '2022-05-04 16:30:00'),
	(94, 7, 6, TIMESTAMP '2022-05-05 17:45:00'),
	(95, 5, 1, TIMESTAMP '2022-05-06 18:30:00'),
	(96, 2, 10, TIMESTAMP '2022-05-07 19:45:00'),
	(97, 1, 4, TIMESTAMP '2022-05-08 20:30:00'),
	(98, 9, 8, TIMESTAMP '2022-05-09 21:45:00'),
	(99, 10, 3, TIMESTAMP '2022-05-10 08:30:00'),
	(100, 6, 5, TIMESTAMP '2022-05-11 09:45:00');

INSERT INTO orderitem (order_id, number, type_id)
VALUES
    (1, 3, 15),
    (2, 2, 10),
    (3, 5, 27),
    (4, 4, 4),
    (5, 1, 20),
    (6, 3, 1),
    (7, 2, 12),
    (8, 5, 19),
    (9, 4, 7),
    (10, 1, 28),
    (11, 3, 3),
    (12, 2, 26),
    (13, 5, 6),
    (14, 4, 23),
    (15, 1, 9),
    (16, 3, 29),
    (17, 2, 16),
    (18, 5, 2),
    (19, 4, 25),
    (20, 1, 8),
    (21, 3, 30),
    (22, 2, 13),
    (23, 5, 21),
    (24, 4, 5),
    (25, 1, 17),
    (26, 3, 24),
    (27, 2, 11),
    (28, 5, 18),
    (29, 4, 22),
    (30, 1, 14),
    (31, 3, 15),
    (32, 2, 10),
    (33, 5, 27),
    (34, 4, 4),
    (35, 1, 20),
    (36, 3, 1),
    (37, 2, 12),
    (38, 5, 19),
    (39, 4, 7),
    (40, 1, 28),
    (41, 3, 3),
    (42, 2, 26),
    (43, 5, 6),
    (44, 4, 23),
    (45, 1, 9),
    (46, 3, 29),
    (47, 2, 16),
    (48, 5, 2),
    (49, 4, 25),
    (50, 1, 8),
    (51, 3, 30),
    (52, 2, 13),
    (53, 5, 21),
    (54, 4, 5),
    (55, 1, 17),
    (56, 3, 24),
    (57, 2, 11),
    (58, 5, 18),
    (59, 4, 22),
    (60, 1, 14),
    (61, 3, 15),
    (62, 2, 10),
    (63, 5, 27),
    (64, 4, 4),
    (65, 1, 20),
    (66, 3, 1),
    (67, 2, 12),
    (68, 5, 19),
    (69, 4, 7),
    (70, 1, 28),
    (71, 3, 3),
    (72, 2, 26),
	(73, 5, 6),
	(74, 4, 23),
	(75, 1, 9),
	(76, 3, 29),
	(77, 2, 16),
	(78, 5, 2),
	(79, 4, 25),
	(80, 1, 8),
	(81, 3, 30),
	(82, 2, 13),
	(83, 5, 21),
	(84, 4, 5),
	(85, 1, 17),
	(86, 3, 24),
	(87, 2, 11),
	(88, 5, 18),
	(89, 4, 22),
	(90, 1, 14),
	(91, 3, 15),
	(92, 2, 10),
	(93, 5, 27),
	(94, 4, 4),
	(95, 1, 20),
	(96, 3, 1),
	(97, 2, 12),
	(98, 5, 19),
	(99, 4, 7),
	(100, 1, 28);

INSERT INTO ratings (rating_id, customer_id, shop_id, score)
VALUES
    (1, 1, 1, 4),
    (2, 1, 2, 5),
    (3, 1, 3, 3),
    (4, 1, 4, 4),
    (5, 1, 5, 5),
    (6, 1, 6, 2),
    (7, 1, 7, 4),
    (8, 1, 8, 5),
    (9, 1, 9, 3),
    (10, 1, 10, 4),
    (11, 2, 1, 5),
    (12, 2, 2, 4),
    (13, 2, 3, 5),
    (14, 2, 4, 3),
    (15, 2, 5, 4),
    (16, 2, 6, 5),
    (17, 2, 7, 2),
    (18, 2, 8, 4),
    (19, 2, 9, 5),
    (20, 2, 10, 3),
    (21, 3, 1, 4),
    (22, 3, 2, 5),
    (23, 3, 3, 3),
    (24, 3, 4, 2),
    (25, 3, 5, 5),
    (26, 3, 6, 3),
    (27, 3, 7, 4),
    (28, 3, 8, 5),
    (29, 3, 9, 3),
    (30, 3, 10, 4),
    (31, 4, 1, 5),
    (32, 4, 2, 4),
    (33, 4, 3, 5),
    (34, 4, 4, 3),
    (35, 4, 5, 4),
    (36, 4, 6, 5),
    (37, 4, 7, 4),
    (38, 4, 8, 3),
    (39, 4, 9, 4),
    (40, 4, 10, 5),
    (41, 5, 1, 4),
    (42, 5, 2, 5),
    (43, 5, 3, 3),
    (44, 5, 4, 4),
    (45, 5, 5, 5),
    (46, 5, 6, 2),
    (47, 5, 7, 4),
    (48, 5, 8, 5),
    (49, 5, 9, 3),
    (50, 5, 10, 4),
    (51, 6, 1, 5),
    (52, 6, 2, 4),
    (53, 6, 3, 5),
    (54, 6, 4, 3),
    (55, 6, 5, 4),
    (56,6, 6, 5),
	(57, 6, 7, 2),
	(58, 6, 8, 4),
	(59, 6, 9, 5),
	(60, 6, 10, 3),
	(61, 7, 1, 4),
	(62, 7, 2, 5),
	(63, 7, 3, 3),
	(64, 7, 4, 2),
	(65, 7, 5, 5),
	(66, 7, 6, 3),
	(67, 7, 7, 4),
	(68, 7, 8, 5),
	(69, 7, 9, 3),
	(70, 7, 10, 4),
	(71, 8, 1, 5),
	(72, 8, 2, 4),
	(73, 8, 3, 5),
	(74, 8, 4, 3),
	(75, 8, 5, 4),
	(76, 8, 6, 5),
	(77, 8, 7, 2),
	(78, 8, 8, 4),
	(79, 8, 9, 5),
	(80, 8, 10, 3),
	(81, 9, 1, 4),
	(82, 9, 2, 5),
	(83, 9, 3, 3),
	(84, 9, 4, 4),
	(85, 9, 5, 5),
	(86, 9, 6, 2),
	(87, 9, 7, 4),
	(88, 9, 8, 5),
	(89, 9, 9, 3),
	(90, 9, 10, 4),
	(91, 10, 1, 5),
	(92, 10, 2, 4),
	(93, 10, 3, 5),
	(94, 10, 4, 3),
	(95, 10, 5, 4),
	(96, 10, 6, 5),
	(97, 10, 7, 2),
	(98, 10, 8, 4),
	(99, 10, 9, 5),
	(100, 10, 10, 3);

INSERT INTO coffee_shops_coffee_types (shop_id, type_id)
VALUES
  (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
  (1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20),
  (1, 21), (1, 22), (1, 23), (1, 24), (1, 25), (1, 26), (1, 27), (1, 28), (1, 29), (1, 30),
  (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
  (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20),
  (2, 21), (2, 22), (2, 23), (2, 24), (2, 25), (2, 26), (2, 27), (2, 28), (2, 29), (2, 30),
  (3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10),
  (3, 11), (3, 12), (3, 13), (3, 14), (3, 15), (3, 16), (3, 17), (3, 18), (3, 19), (3, 20),
  (3, 21), (3, 22), (3, 23), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28), (3, 29), (3, 30),
  (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10),
  (4, 11), (4, 12), (4, 13), (4, 14), (4, 15), (4, 16), (4, 17), (4, 18), (4, 19), (4, 20),
  (4, 21), (4, 22), (4, 23), (4, 24), (4, 25), (4, 26), (4, 27), (4, 28), (4, 29), (4, 30),
  (5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10),
  (5, 11), (5, 12), (5, 13), (5, 14), (5, 15), (5, 16), (5, 17), (5, 18), (5, 19), (5, 20),
  (5, 21), (5, 22), (5, 23), (5, 24), (5, 25), (5, 26), (5, 27), (5, 28), (5, 29), (5, 30),
  (6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 8), (6, 9), (6, 10),
  (6, 11), (6, 12), (6, 13), (6, 14), (6, 15), (6, 16), (6, 17), (6, 18), (6, 19), (6, 20),
  (6, 21), (6, 22), (6, 23), (6, 24), (6, 25), (6, 26), (6, 27), (6, 28), (6, 29), (6, 30),
  (7, 1), (7, 2), (7, 3), (7, 4), (7, 5), (7, 6), (7, 7), (7, 8), (7, 9), (7, 10),
  (7, 11), (7, 12), (7, 13), (7, 14), (7, 15), (7, 16), (7, 17), (7, 18), (7, 19), (7, 20),
  (7, 21), (7, 22), (7, 23), (7, 24), (7, 25), (7, 26), (7, 27), (7, 28), (7, 29), (7, 30),
  (8, 1), (8, 2), (8, 3), (8, 4), (8, 5), (8, 6), (8, 7), (8, 8), (8, 9), (8, 10),
  (8, 11), (8, 12), (8, 13), (8, 14), (8, 15), (8, 16), (8, 17), (8, 18), (8, 19), (8, 20),
  (8, 21), (8, 22), (8, 23), (8, 24), (8, 25), (8, 26), (8, 27), (8, 28), (8, 29), (8, 30),
  (9, 1), (9, 2), (9, 3), (9, 4), (9, 5), (9, 6), (9, 7), (9, 8), (9, 9), (9, 10),
  (9, 11), (9, 12), (9, 13), (9, 14), (9, 15), (9, 16), (9, 17), (9, 18), (9, 19), (9, 20),
  (9, 21), (9, 22), (9, 23), (9, 24), (9, 25), (9, 26), (9, 27), (9, 28), (9, 29), (9, 30),
  (10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8), (10, 9), (10, 10),
  (10, 11), (10, 12), (10, 13), (10, 14), (10, 15), (10, 16), (10, 17), (10, 18), (10, 19), (10, 20),
  (10, 21), (10, 22), (10, 23), (10, 24), (10, 25), (10, 26), (10, 27), (10, 28), (10, 29), (10, 30);
