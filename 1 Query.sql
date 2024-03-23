WITH count_per_psg AS (
   SELECT trip_no, COUNT(pass_cnt.ID_psg) AS count_per_psg FROM Pass_in_trip AS pass_cnt GROUP BY pass_cnt.trip_no 
   )

SELECT
    Tr.trip_no as 'ID trip',
	CONCAT(airport_from, ' ', City_from.name) AS 'Airport and departure city',
	CONCAT(airport_to, ' ', City_to.name) AS 'Airport and arrival city',
	Country_from.name AS 'Country of departure',
	Country_to.name AS 'Country of arrival',
	Company_all.name AS 'Airline name',
	Plane_all.name AS 'Model of plane',
	CONVERT(nvarchar, time_out, 104) AS 'Departure date',
	CONVERT(nvarchar, time_in, 104) AS 'Arrival date',
	CONVERT(nvarchar, time_out, 108) AS 'Departure time',
	CONVERT(nvarchar, time_in, 108) AS 'Arrival time',
	COALESCE(count_per_psg, 0) AS 'Number of passengers',
	

    CASE
	WHEN Country_from.ID_country = Country_to.ID_country THEN 'Internal flight'
	ELSE 'International flight'
	END AS 'Flight type'
	 	
FROM Trip AS tr
inner join Airport AS Airport_from ON Tr.airport_from = Airport_from.ID_airport
inner join City AS City_from ON Airport_from.ID_city = City_from.ID_city
inner join Country AS Country_from ON City_from.ID_country = Country_from.ID_country
inner join Plane AS Plane_all ON Tr.ID_plane = Plane_all.ID_plane
inner join Company AS Company_all ON Tr.ID_comp = Company_all.ID_comp

inner join Airport AS Airport_to ON Tr.airport_to = Airport_to.ID_airport
inner join City AS City_to ON Airport_to.ID_city = City_to.ID_city
inner join Country AS Country_to ON City_to.ID_country = Country_to.ID_country

left join count_per_psg ON tr.trip_no = count_per_psg.trip_no

