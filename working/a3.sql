SELECT host_cities.games,
  city,
  athlete_count
FROM (
  SELECT games,
    count(DISTINCT id) AS athlete_count
  FROM athlete_events
  GROUP BY games
  ) AS games_counts,
  host_cities
WHERE games_counts.games = host_cities.games
ORDER BY host_cities.games ASC;
