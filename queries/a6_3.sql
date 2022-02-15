WITH nocs
AS (
  WITH noc_gold AS (
      SELECT noc,
        count(DISTINCT games) AS gold_games
      FROM athlete_events
      WHERE games LIKE '% Summer'
        AND medal = 'Gold'
      GROUP BY noc
      ),
    noc_summer AS (
      SELECT noc,
        count(DISTINCT games) AS summer_games
      FROM athlete_events
      WHERE games LIKE '% Summer'
      GROUP BY noc
      )
  SELECT noc_summer.noc
  FROM noc_gold,
    noc_summer
  WHERE noc_summer.noc = noc_gold.noc
    AND gold_games = summer_games
  )
SELECT region
FROM nocs,
  regions
WHERE nocs.noc = regions.noc
ORDER BY region ASC;
