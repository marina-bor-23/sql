SELECT 
       vis.ID_book_vis,
       vis.lastname,
       np.vis_count AS 'persons',
    CASE 
	WHEN np.vis_count >= 1 THEN 'give a bonus on the promotion'
         ELSE 'not give a bonus on the promotion'
       END AS 'Promotion'

FROM Visitor AS vis
    INNER JOIN (SELECT num_persons, COUNT(ID_book_vis) AS vis_count
        FROM Rent AS re
        GROUP BY num_persons
        HAVING SUM(num_persons) >=1) np
       ON vis.ID_book_vis=np.num_persons
ORDER BY 1 ASC
