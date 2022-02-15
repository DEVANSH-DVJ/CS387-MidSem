SELECT DISTINCT (games)
FROM athlete_events,
  athletes
WHERE athlete_events.id = athletes.id
  AND games LIKE '% Summer'
  AND sex = 'F'
ORDER BY games LIMIT 1;
