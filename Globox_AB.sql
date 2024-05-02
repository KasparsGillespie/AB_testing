/*
TASK:
Write a SQL query that returns: 
the user ID, the user’s country, the user’s gender,
 the user’s device type, the user’s test group,
  whether or not they converted (spent > $0), 
  and how much they spent in total ($0+). 
*/

SELECT
  u.id AS user_id,
  COALESCE(u.country, 'N/A') AS country,
  COALESCE(u.gender, 'N/A') AS gender,
  COALESCE(g.device, 'N/A') AS device,
  COALESCE(g.group, 'N/A') AS test_group,
  CASE WHEN a.spent > 0 THEN 'Yes' ELSE 'No' END AS converted,
  COALESCE(SUM(a.spent), 0) AS total_spent
FROM
  users u
LEFT JOIN
  groups g ON u.id = g.uid
LEFT JOIN
  activity a ON u.id = a.uid
GROUP BY
  u.id, u.country, u.gender, g.device, g.group, converted









