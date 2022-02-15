SELECT DISTINCT (games)
FROM athlete_events
LEFT OUTER JOIN athletes ON athlete_events.id = athletes.id
WHERE games LIKE '% Summer'
  AND sex = 'F'
ORDER BY games LIMIT 1;
