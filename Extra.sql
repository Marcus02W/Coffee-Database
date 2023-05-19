CREATE MATERIALIZED VIEW public.average_rating_mat AS
SELECT 
    cs.name AS shop_name, 
    AVG(r.score) AS average_score
FROM 
    public.coffee_shops cs
JOIN 
    public.ratings r ON cs.shop_id = r.shop_id
GROUP BY 
    cs.name;

CREATE UNIQUE INDEX idx_average_rating_mat ON public.average_rating_mat (shop_name);

CREATE OR REPLACE FUNCTION refresh_average_rating_mat()
RETURNS TRIGGER AS $$
BEGIN
    REFRESH MATERIALIZED VIEW public.average_rating_mat;
    RETURN NULL;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER refresh_average_rating_mat
AFTER INSERT OR UPDATE OR DELETE ON public.ratings
FOR EACH STATEMENT
EXECUTE PROCEDURE refresh_average_rating_mat();

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