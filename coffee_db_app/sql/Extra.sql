-- Creating a materialized view named "average_rating_mat" in the "public" schema.
-- This view calculates the average rating (average_score) for each coffee shop (shop_name).
CREATE OR REPLACE VIEW average_rating_mat AS
SELECT 
    cs.shop_id AS shop_id,
    cs.name AS shop_name, 
    AVG(r.score) AS average_score
FROM 
    coffee_shops cs
JOIN 
    ratings r ON cs.shop_id = r.shop_id
GROUP BY 
    cs.shop_id;

-- Creating or replacing a view named "worst_shop_ratings" in the "public" schema.
-- This view shows the minimum rating (rating) given by each customer (customer_firstname, customer_lastname) to each coffee shop (shop_name).
-- It uses a common table expression (CTE) named "min_ratings" to first calculate the minimum rating for each shop.
CREATE OR REPLACE VIEW worst_shop_ratings AS
WITH min_ratings AS (
    SELECT 
        shop_id,
        MIN(score) AS min_score
    FROM 
        ratings
    GROUP BY 
        shop_id
)
SELECT 
    cs.name AS shop_name,
    c.customer_firstname,
    c.customer_lastname,
    mr.min_score AS rating
FROM 
    ratings r
JOIN 
    min_ratings mr ON r.shop_id = mr.shop_id AND r.score = mr.min_score
JOIN 
    customers c ON r.customer_id = c.customer_id
JOIN 
    coffee_shops cs ON r.shop_id = cs.shop_id;


DELIMITER //

CREATE PROCEDURE add_rating_on_new_customer(IN new_customer_id INT)
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE shopId INT;
  DECLARE cur CURSOR FOR SELECT shop_id FROM coffee_shops;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO shopId;
    
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    INSERT INTO ratings (customer_id, shop_id, score) 
    VALUES (new_customer_id, shopId, NULL);
  END LOOP;

  CLOSE cur;
END //

DELIMITER ;

CREATE TRIGGER new_customer_trigger
AFTER INSERT ON customers
FOR EACH ROW
CALL add_rating_on_new_customer(NEW.customer_id);



DELIMITER //

CREATE PROCEDURE add_rating_on_new_shop(IN new_shop_id INT)
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE customerId INT;
  DECLARE cur CURSOR FOR SELECT customer_id FROM customers;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO customerId;
    
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    INSERT INTO ratings (customer_id, shop_id, score) 
    VALUES (customerId, new_shop_id, NULL);
  END LOOP;

  CLOSE cur;
END //

DELIMITER ;

CREATE TRIGGER new_shop_trigger
AFTER INSERT ON coffee_shops
FOR EACH ROW
CALL add_rating_on_new_shop(NEW.shop_id);

