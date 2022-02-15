SELECT noc,
  count(CASE 
      WHEN medal = 'Gold'
        THEN 1
      ELSE NULL
      END) AS gold,
  count(CASE 
      WHEN medal = 'Silver'
        THEN 1
      ELSE NULL
      END) AS silver,
  count(CASE 
      WHEN medal = 'Bronze'
        THEN 1
      ELSE NULL
      END) AS bronze,
  count(CASE 
      WHEN medal IN ('Gold', 'Silver', 'Bronze')
        THEN 1
      ELSE NULL
      END) AS total
FROM athlete_events
WHERE games = '2016 Summer'
GROUP BY noc
ORDER BY gold DESC,
  silver DESC,
  bronze DESC,
  noc ASC;
