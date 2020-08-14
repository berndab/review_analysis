-- Query to return total Vine and non-Vine review counts

CREATE TEMP TABLE review_count (
	review_type VARCHAR(10) NOT NULL,
	review_count INT
);

WITH review_count_cte AS (
SELECT 	CASE
			WHEN vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		COUNT(*) AS ratings_count
FROM 	public.vine
GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END
)
INSERT INTO review_count SELECT * FROM review_count_cte;

SELECT * FROM review_count ORDER BY review_type;


-- Query to return review counts with each
-- star score for Vine and non-Vine reviews

CREATE TEMP TABLE review_star_count (
	review_type VARCHAR(10) NOT NULL,
	star_rating INT NOT NULL,
	star_rating_count INT NOT NULL
);

WITH review_star_count_cte AS (
SELECT 	CASE
			WHEN vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		star_rating,
		COUNT(*) AS star_rating_count
FROM 	public.vine
GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END,
star_rating
)
INSERT INTO review_star_count SELECT * FROM review_star_count_cte;

SELECT * FROM review_star_count ORDER BY review_type, star_rating;


-- Query to return % of total reviews with each star
-- score for Vine and non-Vine reviews

SELECT  A.review_type,
		A.star_rating,
		(A.star_rating_count::decimal / B.review_count::decimal) AS percent_total
FROM 	review_star_count A
INNER JOIN 
		review_count B
USING   (review_type)
ORDER BY
A.review_type,
A.star_rating

-- Query to return the average star 
-- rating for Vine and non-Vine reviews

SELECT 	CASE
			WHEN vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		AVG(star_rating) AS average_rating
FROM 	public.vine
GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END
ORDER BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END


-- Query to return the % of total votes that were 
-- helpful votes for Vine and non-Vine reviews

SELECT 	CASE
			WHEN vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		CAST(SUM(helpful_votes) AS decimal)/ CAST(SUM(total_votes)  AS decimal) AS percent_helpful
FROM 	public.vine
GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END
ORDER BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END;



-- Query to return product ids that have 
-- 15 or more Vine and non-Vine reviews

CREATE TEMPORARY TABLE product_ids_gt_15 (
	product_id TEXT NOT NULL
);

WITH product_ids_gt_15_cte AS (
SELECT  AA.product_id
FROM (
SELECT 	B.product_id,
		COUNT(*) AS review_count
FROM 	public.vine AS A
INNER JOIN
		public.review_id AS B
USING 	(review_id)
WHERE   A.vine = 'N'
GROUP BY
B.product_id
HAVING COUNT(*) >= 15
) AA
INNER JOIN (
SELECT 	B.product_id,
		COUNT(*) AS review_count
FROM 	public.vine AS A
INNER JOIN
		public.review_id AS B
USING 	(review_id)
WHERE   A.vine = 'Y'
GROUP BY
B.product_id
HAVING COUNT(*) >= 15
) BB
USING	(product_id)
)
INSERT INTO product_ids_gt_15 SELECT * FROM product_ids_gt_15_cte;

SELECT COUNT(*) FROM product_ids_gt_15; -- 379



-- Query to return total Vine and non-Vine review counts
-- for product ids with 15 or more Vine and non-Vine reviews

CREATE TEMP TABLE review_count_gt_15 (
	review_type VARCHAR(10) NOT NULL,
	review_count INT
);

WITH review_count_gt_15_cte AS (
SELECT 	CASE
			WHEN A.vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		COUNT(*) AS ratings_count
FROM 	public.vine A
INNER JOIN
		public.review_id B
USING 	(review_id)
INNER JOIN
		product_ids_gt_15 C
USING 	(product_id)
GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END
)
INSERT INTO review_count_gt_15 SELECT * FROM review_count_gt_15_cte;

SELECT * FROM review_count_gt_15 ORDER BY review_type;


-- Query to return the number of reviews with each
-- star score for Vine and non-Vine reviews
-- for product ids with 15 or more Vine and non-Vine reviews

CREATE TEMP TABLE review_star_count_gt_15 (
	review_type VARCHAR(10) NOT NULL,
	star_rating INT NOT NULL,
	star_rating_count INT NOT NULL
);

WITH review_star_count_gt_15_cte AS (
SELECT 	CASE
			WHEN A.vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		A.star_rating,
		COUNT(*) AS star_rating_count
FROM 	public.vine A
INNER JOIN
		public.review_id B
USING 	(review_id)
INNER JOIN
		product_ids_gt_15 C
USING 	(product_id)
GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END,
star_rating
)
INSERT INTO review_star_count_gt_15 SELECT * FROM review_star_count_gt_15_cte;

SELECT * FROM review_star_count_gt_15 ORDER BY review_type, star_rating;

-- Query to return % of total reviews with each star
-- score for Vine and non-Vine reviews
-- for product ids with 15 or more Vine and non-Vine reviews

SELECT  A.review_type,
		A.star_rating,
		(A.star_rating_count::decimal / B.review_count::decimal) AS percent_total
FROM 	review_star_count_gt_15 A
INNER JOIN 
		review_count_gt_15 B
USING   (review_type)
ORDER BY
A.review_type,
A.star_rating;


-- Query to return the average star 
-- rating for Vine and non-Vine reviews
-- for product ids with 15 or more Vine and non-Vine reviews

SELECT 	CASE
			WHEN A.vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		AVG(star_rating) AS average_rating
FROM 	public.vine A
INNER JOIN
		public.review_id B
USING 	(review_id)
INNER JOIN
		product_ids_gt_15 C
USING 	(product_id)
GROUP BY  
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END
ORDER BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END;


-- Query to return the % of total votes that were helpful
-- votes for Vine and non-Vine reviews for product ids
-- with 15 or more Vine and non-Vine reviews

SELECT 	CASE
			WHEN A.vine = 'Y' THEN 'Vine'
			ELSE 'Non-Vine'
		END AS review_type,
		CAST(SUM(helpful_votes) AS decimal)/ CAST(SUM(total_votes)  AS decimal) AS percent_helpful
FROM 	public.vine A
INNER JOIN
		public.review_id B
USING 	(review_id)
INNER JOIN
		product_ids_gt_15 C
USING 	(product_id)GROUP BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END
ORDER BY 
CASE
	WHEN vine = 'Y' THEN 'Vine'
	ELSE 'Non-Vine'
END;