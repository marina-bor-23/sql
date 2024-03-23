SELECT
ID_rent,
booking_date_start,
ID_book
FROM Rent
WHERE ID_book NOT IN ('2')
AND YEAR(booking_date_start) LIKE 2021
ORDER BY ID_book, booking_date_start   
