WITH games_fem_noc
AS (
  SELECT games,
    count(DISTINCT noc)
  FROM athlete_events,
    athletes
  WHERE athletes.id = athlete_events.id
    AND sex = 'F'
  GROUP BY games
  ),
games_total_noc
AS (
  SELECT games,
    count(DISTINCT noc)
  FROM athlete_events,
    athletes
  WHERE athletes.id = athlete_events.id
  GROUP BY games
  )
SELECT count(games_fem_noc.games)
FROM games_fem_noc,
  games_total_noc
WHERE games_fem_noc.games = games_total_noc.games
  AND games_fem_noc.count = games_total_noc.count;
