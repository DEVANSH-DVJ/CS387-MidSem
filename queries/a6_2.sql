SELECT noc,
  count(DISTINCT games) AS gold_games
FROM athlete_events
WHERE games LIKE '% Summer'
  AND medal = 'Gold'
GROUP BY noc
ORDER BY gold_games DESC;
