SELECT athletes.id,
  name,
  total
FROM (
  SELECT id,
    count(CASE 
        WHEN medal IN ('Gold', 'Silver', 'Bronze')
          THEN 1
        ELSE NULL
        END) AS total
  FROM athlete_events
  GROUP BY id
  ) AS id_total
LEFT OUTER JOIN athletes ON id_total.id = athletes.id
ORDER BY total DESC,
  athletes.id ASC;
