WITH count_holidays AS (
   SELECT ID_rent, COUNT(date) AS count_holidays FROM Rent left join Holiday ON holiday.date between booking_date_start and booking_date_finish GROUP BY ID_rent
   )
      	 
SELECT DISTINCT
    Re.ID_rent AS 'ID rent',
	Re.ID_room,
	RC.name AS 'Class room',
    COALESCE(Serv.cost, 0) AS 'Add. services ordered, rub.',
	DATEDIFF(day, booking_date_start, booking_date_finish) AS 'Days spent',
	count_holidays AS 'Including during holidays',
	((DATEDIFF(day, booking_date_start, booking_date_finish) - count_holidays) * COALESCE(Serv.cost, 0)) + 
	(count_holidays * COALESCE(Serv.surcharge_cost, 0)) as 'Total value, rub.',

	CASE
	WHEN count_holidays >= 3 THEN 'Significant profit from the holidays'
	ELSE 'Insignificant profit from the holidays'
	END AS 'Profit'

FROM Rent AS re
left join Service AS Serv ON Re.ID_serv = Serv.ID_serv
left join Room_cleaning AS RC ON Re.ID_room = RC.ID_room
left join count_holidays ON re.ID_rent = count_holidays.ID_rent
WHERE RC.name = 'Премиум'
