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
