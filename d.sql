WITH count_holidays AS (
   SELECT ID_rent, COUNT(date) AS count_holidays FROM Rent left join Holiday ON holiday.date between booking_date_start and booking_date_finish GROUP BY ID_rent
   )
      	 
SELECT DISTINCT
    Re.ID_rent AS 'ID rent',
	CONVERT(varchar, Re.transaction_date, 104) AS 'Date of the transaction',
	CONVERT(varchar, Re.transaction_time, 108) AS 'Time of the transaction',
	Vis.lastname AS 'Last name of the booking person',
	CONVERT(varchar, Re.booking_date_start, 104) AS 'Check-in date',
	CONVERT(varchar, Re.booking_date_finish, 104) AS 'Check-out date',
	BM.name AS 'Booking method',
	PM.name AS 'Payment method',
	RC.name AS 'Class room',
    COALESCE(Serv.cost, 0) AS 'Add. services ordered, rub.',
	datediff(day, booking_date_start, booking_date_finish) AS 'Days spent',
	count_holidays AS 'Including during holidays',
    ((datediff(day, booking_date_start, booking_date_finish) - count_holidays) * RC.cost) + (count_holidays * RC.surcharge_cost) AS 'Total cost of the room, rub.',
	((datediff(day, booking_date_start, booking_date_finish) - count_holidays) * COALESCE(Serv.cost, 0)) + (count_holidays * COALESCE(Serv.surcharge_cost, 0)) AS 'Total cost of the services.',
	((datediff(day, booking_date_start, booking_date_finish) - count_holidays) * RC.cost) + (count_holidays * RC.surcharge_cost) + 
	((datediff(day, booking_date_start, booking_date_finish) - count_holidays) * COALESCE(Serv.cost, 0)) + (count_holidays * COALESCE(Serv.surcharge_cost, 0)) AS 'Total value, rub.'


FROM Rent AS re
LEFT JOIN Service AS Serv ON Re.ID_serv = Serv.ID_serv
LEFT JOIN Booking_method AS BM ON Re.ID_book = BM.ID_book
LEFT JOIN Payment_method AS PM ON Re.ID_pay = PM.ID_pay
LEFT JOIN Room_cleaning AS RC ON Re.ID_room = RC.ID_room
LEFT JOIN Visitor AS Vis ON Re.ID_book_vis = Vis.ID_book_vis

LEFT JOIN count_holidays on re.ID_rent = count_holidays.ID_rent
ORDER BY RC.name
