-- Creating a materialized view named "average_rating_mat" in the "public" schema.
-- This view calculates the average rating (average_score) for each coffee shop (shop_name).
CREATE MATERIALIZED VIEW public.average_rating_mat AS
SELECT 
    cs.shop_id AS shop_id,
    cs.name AS shop_name, 
    AVG(r.score) AS average_score
FROM 
    public.coffee_shops cs
JOIN 
    public.ratings r ON cs.shop_id = r.shop_id
GROUP BY 
    cs.shop_id;

-- Creating a unique index on the "shop_name" column of the "average_rating_mat" materialized view.
-- This can improve the performance of queries that filter or sort results based on the shop's name.
CREATE UNIQUE INDEX idx_average_rating_mat ON public.average_rating_mat (shop_id);

-- Creating or replacing a function named "refresh_average_rating_mat".
-- This function refreshes the materialized view "average_rating_mat".
-- It is defined as a trigger, which is a procedure that is automatically executed in response to certain events.
CREATE OR REPLACE FUNCTION refresh_average_rating_mat()
RETURNS TRIGGER AS $$
BEGIN
    REFRESH MATERIALIZED VIEW public.average_rating_mat;
    RETURN NULL;
END $$ LANGUAGE plpgsql;

-- Creating a trigger named "refresh_average_rating_mat".
-- This trigger executes the "refresh_average_rating_mat" function after any INSERT, UPDATE, or DELETE operation on the "ratings" table.
-- This ensures that the "average_rating_mat" materialized view is always up to date with the latest ratings data.
CREATE TRIGGER refresh_average_rating_mat
AFTER INSERT OR UPDATE OR DELETE ON public.ratings
FOR EACH STATEMENT
EXECUTE PROCEDURE refresh_average_rating_mat();

-- Creating or replacing a view named "worst_shop_ratings" in the "public" schema.
-- This view shows the minimum rating (rating) given by each customer (customer_firstname, customer_lastname) to each coffee shop (shop_name).
-- It uses a common table expression (CTE) named "min_ratings" to first calculate the minimum rating for each shop.
CREATE OR REPLACE VIEW public.worst_shop_ratings AS
WITH min_ratings AS (
    SELECT 
        shop_id,
        MIN(score) AS min_score
    FROM 
        public.ratings
    GROUP BY 
        shop_id
)
SELECT 
    cs.name AS shop_name,
    c.customer_firstname,
    c.customer_lastname,
    mr.min_score AS rating
FROM 
    public.ratings r
JOIN 
    min_ratings mr ON r.shop_id = mr.shop_id AND r.score = mr.min_score
JOIN 
    public.customers c ON r.customer_id = c.customer_id
JOIN 
    public.coffee_shops cs ON r.shop_id = cs.shop_id;
