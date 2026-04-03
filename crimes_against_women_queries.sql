USE Crimes_India;

SELECT * FROM Crime_against_women;
SELECT COUNT(*) FROM Crime_against_women;


SELECT TOP 10 State, SUM(Total_Crimes) as Total_Crimes
FROM Crime_against_women
GROUP BY State
Order By Total_Crimes DESC;

SELECT 
    SUM(Rape) AS Total_Rape,
    SUM(K_A) AS Total_Kidnapping,
    SUM(DD) AS Total_Dowry_Deaths,
    SUM(AoW) AS Total_Assault_Women,
    SUM(AoM) AS Total_Assault_Modesty,
    SUM(DV) AS Total_Domestic_Violence,
    SUM(WT) AS Total_Trafficking
FROM Crime_against_women;

SELECT Year, SUM(Total_Crimes) AS Total_Crimes
FROM Crime_against_women
GROUP BY Year
ORDER BY Year ASC;


SELECT 
    a.State,
    a.Total_Crimes AS Crimes_2001,
    b.Total_Crimes AS Crimes_2021,
    (b.Total_Crimes - a.Total_Crimes) AS Change,
    CASE 
        WHEN (b.Total_Crimes - a.Total_Crimes) > 0 THEN 'Deteriorated'
        ELSE 'Improved'
    END AS Status
FROM Crime_against_women a
JOIN Crime_against_women b ON a.State = b.State
WHERE a.Year = 2001 AND b.Year = 2021
ORDER BY Change DESC;

SELECT 
    SUM(CASE WHEN Year = 2001 THEN Rape ELSE 0 END) AS Rape_2001,
    SUM(CASE WHEN Year = 2021 THEN Rape ELSE 0 END) AS Rape_2021,
    SUM(CASE WHEN Year = 2001 THEN K_A ELSE 0 END) AS KA_2001,
    SUM(CASE WHEN Year = 2021 THEN K_A ELSE 0 END) AS KA_2021,
    SUM(CASE WHEN Year = 2001 THEN DD ELSE 0 END) AS DD_2001,
    SUM(CASE WHEN Year = 2021 THEN DD ELSE 0 END) AS DD_2021,
    SUM(CASE WHEN Year = 2001 THEN AoW ELSE 0 END) AS AoW_2001,
    SUM(CASE WHEN Year = 2021 THEN AoW ELSE 0 END) AS AoW_2021,
    SUM(CASE WHEN Year = 2001 THEN DV ELSE 0 END) AS DV_2001,
    SUM(CASE WHEN Year = 2021 THEN DV ELSE 0 END) AS DV_2021,
    SUM(CASE WHEN Year = 2001 THEN WT ELSE 0 END) AS WT_2001,
    SUM(CASE WHEN Year = 2021 THEN WT ELSE 0 END) AS WT_2021
FROM Crime_against_women;

SELECT State,
       SUM(Rape) AS Rape,
       SUM(K_A) AS Kidnapping,
       SUM(DD) AS Dowry_Deaths,
       SUM(AoW) AS Assault_Women,
       SUM(DV) AS Domestic_Violence,
       SUM(WT) AS Trafficking
FROM Crime_against_women
GROUP BY State
ORDER BY State ASC;