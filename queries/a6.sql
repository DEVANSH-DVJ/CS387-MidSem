WITH final
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
  SELECT region,
    sum(gold_games) AS gold_games,
    sum(summer_games) AS summer_games
  FROM noc_gold,
    noc_summer,
    regions
  WHERE noc_gold.noc = regions.noc
    AND noc_summer.noc = regions.noc
  GROUP BY region
  )
SELECT region
FROM final
WHERE gold_games = summer_games
ORDER BY region ASC;
