SELECT
    c.algorithm,
    SUM(CASE WHEN QUARTER(t.dt) = 1 THEN volume ELSE 0 END) AS Q1,
    SUM(CASE WHEN QUARTER(t.dt) = 2 THEN volume ELSE 0 END) AS Q2,
    SUM(CASE WHEN QUARTER(t.dt) = 3 THEN volume ELSE 0 END) AS Q3,
    SUM(CASE WHEN QUARTER(t.dt) = 4 THEN volume ELSE 0 END) AS Q4
FROM coins c
JOIN transactions t ON c.code = t.coin_code
WHERE YEAR(t.dt) = 2020
GROUP BY c.algorithm 
ORDER BY c.algorithm ASC;
