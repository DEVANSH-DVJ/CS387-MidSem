SELECT games,
  count(DISTINCT noc)
FROM athlete_events,
  athletes
WHERE athletes.id = athlete_events.id
  AND sex = 'F'
GROUP BY games;
