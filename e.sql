SELECT 
   re.ID_rent,
   serv.ID_serv,
   serv.name AS 'name of service',
SUM(serv.cost) OVER(Partition by re.ID_rent) AS profit_per_rent,
SUM(serv.cost) OVER(Partition by serv.name ORDER BY serv.cost) AS profit_per_each_service,
COUNT(serv.ID_serv) OVER(Partition by serv.name ORDER BY serv.name) AS cnt_used_services_in_total

FROM Service AS serv
    left join Rent AS re ON serv.ID_serv=re.ID_serv
ORDER BY serv.name, serv.cost
