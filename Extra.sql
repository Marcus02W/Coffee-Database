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
