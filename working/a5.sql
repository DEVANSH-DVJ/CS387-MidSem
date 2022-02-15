SELECT X_athletes.id,
  name,
  games_asia
FROM (
  SELECT id,
    name
  FROM athletes
  WHERE name LIKE 'X%'
  ) AS X_athletes,
  (
    SELECT id,
      count(games) AS games_asia
    FROM athlete_events
    WHERE games IN ('1964 Summer', '1988 Summer', '2008 Summer')
    GROUP BY id
    ) AS id_games_asia
WHERE X_athletes.id = id_games_asia.id
ORDER BY X_athletes.id ASC;
