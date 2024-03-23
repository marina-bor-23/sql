CREATE TABLE [dbo].[Company] (
	[ID_comp] [int] NOT NULL ,
	[name] [char] (10) NOT NULL 
)
GO

CREATE TABLE [dbo].[Pass_in_trip] (
	[trip_no] [int] NOT NULL ,
	[date] [datetime] NOT NULL ,
	[ID_psg] [int] NOT NULL ,
	[place] [char] (10) NOT NULL 
)
GO

CREATE TABLE [dbo].[Passenger] (
	[ID_psg] [int] NOT NULL ,
	[name] [char] (20) NOT NULL ,
	[passportNumber] [char] (20) NOT NULL
)
GO

CREATE TABLE [dbo].[Plane] (
	[ID_plane] [int] NOT NULL ,
	[name] [char] (20) NOT NULL,
	[capacity] [int] NULL
)
GO

CREATE TABLE [dbo].[Airport] (
	[ID_airport] [char] (3) NOT NULL ,
	[name] [char] (225) NOT NULL,
	[ID_city] [int] NULL
)
GO

CREATE TABLE [dbo].[City] (
	[ID_city] [int] NOT NULL ,
	[name] [char] (25) NOT NULL,
	[ID_country] [int] NOT NULL
)
GO

CREATE TABLE [dbo].[Country] (
	[ID_country] [int] NOT NULL,
	[name] [char] (25) NOT NULL,
)
GO

CREATE TABLE [dbo].[Trip] (
	[trip_no] [int] NOT NULL ,
	[ID_comp] [int] NOT NULL ,
	[ID_plane] [int] NOT NULL ,
	[airport_from] [char] (3) NOT NULL ,
	[airport_to] [char] (3) NOT NULL ,
	[time_out] [datetime] NOT NULL ,
	[time_in] [datetime] NOT NULL 
)
GO

ALTER TABLE [dbo].[Company] WITH NOCHECK ADD 
	CONSTRAINT [PK2] PRIMARY KEY  CLUSTERED 
	(
		[ID_comp]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[City] WITH NOCHECK ADD 
	CONSTRAINT [PK3] PRIMARY KEY  CLUSTERED 
	(
		[ID_city]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Country] WITH NOCHECK ADD 
	CONSTRAINT [PK4] PRIMARY KEY  CLUSTERED 
	(
		[ID_country]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Plane] WITH NOCHECK ADD 
	CONSTRAINT [PK5] PRIMARY KEY  CLUSTERED 
	(
		[ID_plane]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Airport] WITH NOCHECK ADD 
	CONSTRAINT [PK6] PRIMARY KEY  CLUSTERED 
	(
		[ID_airport]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Pass_in_trip] WITH NOCHECK ADD 
	CONSTRAINT [PK_pt] PRIMARY KEY  CLUSTERED 
	(
		[trip_no],
		[date],
		[ID_psg]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Passenger] WITH NOCHECK ADD 
	CONSTRAINT [PK_psg] PRIMARY KEY  CLUSTERED 
	(
		[ID_psg]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Trip] WITH NOCHECK ADD 
	CONSTRAINT [PK_t] PRIMARY KEY  CLUSTERED 
	(
		[trip_no]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Pass_in_trip] ADD 
	CONSTRAINT [FK_Pass_in_trip_Passenger] FOREIGN KEY 
	(
		[ID_psg]
	) REFERENCES [dbo].[Passenger] (
		[ID_psg]
	),
	CONSTRAINT [FK_Pass_in_trip_Trip] FOREIGN KEY 
	(
		[trip_no]
	) REFERENCES [dbo].[Trip] (
		[trip_no]
	)
GO

ALTER TABLE [dbo].[Trip] ADD 
	CONSTRAINT [FK_Trip_Company] FOREIGN KEY 
	(
		[ID_comp]
	) REFERENCES [dbo].[Company] (
		[ID_comp]
	),
	CONSTRAINT [FK_Trip_Plane] FOREIGN KEY 
	(
		[ID_plane]
	) REFERENCES [dbo].[Plane] (
		[ID_plane]
	),
	CONSTRAINT [FK_Trip_Airport_from] FOREIGN KEY 
	(
		[airport_from]
	) REFERENCES [dbo].[Airport] (
		[ID_airport]
	),
	CONSTRAINT [FK_Trip_Airport_to] FOREIGN KEY 
	(
		[airport_to]
	) REFERENCES [dbo].[Airport] (
		[ID_airport]
	)
GO

ALTER TABLE [dbo].[Airport] ADD 
	CONSTRAINT [FK_Airport_City] FOREIGN KEY 
	(
		[ID_city]
	) REFERENCES [dbo].[City] (
		[ID_city]
	)
GO

ALTER TABLE [dbo].[City] ADD 
	CONSTRAINT [FK_City_Country] FOREIGN KEY 
	(
		[ID_country]
	) REFERENCES [dbo].[Country] (
		[ID_country]
	)
GO

----Страны------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Country values(1,'Spain')
insert into Country values(2,'Turkey')
insert into Country values(3,'France')
insert into Country values(4,'China')
insert into Country values(5,'Russia')
GO

----Города------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into City values(1, 'Barcelona',1)
insert into City values(2,'Antalya',2)
insert into City values(3,'Istambul',2)
insert into City values(4,'Paris',3)
insert into City values(5,'Beigngin',4)
insert into City values(6,'Moscow',5)
insert into City values(7,'Saint-Petersburg',5)
insert into City values(8,'Ekaterinburg',5)
insert into City values(9,'Sochi',5)
GO
                                                                                                                                                                                                                                                                 
----Компании------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Company values(1,'Don_Avia  ')
insert into Company values(2,'Aeroflot  ')
insert into Company values(3,'Dale_Avia ')
insert into Company values(4,'Air_France')
insert into Company values(5,'British_AW')
GO

----Самолеты------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Plane values(1,'Boeing 737', 180)
insert into Plane values(2,'TU-154', 110)
insert into Plane values(3,'IL-86', 70)
insert into Plane values(4,'TU-134', 120)
insert into Plane values(5,'Airbus A330', 220)
insert into Plane values(6,'Airbus A320', 180)
insert into Plane values(7,'Airbus A310', 150)
insert into Plane values(8,'SuhoiSuperJet', NULL)
GO

----Аэропорты------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Airport values('BCN','Aeropuerto Transoceanico de Barcelona', 1)
insert into Airport values('AYT','Antalya Airport', 2)
insert into Airport values('IST','Ataturk International Airport', 3)
insert into Airport values('CDG','Charles de Gaulle', 4)
insert into Airport values('PEK','Capital', 5)
insert into Airport values('SVO','Sheremetevo', 6)
insert into Airport values('DME','Domodedovo', 6)
insert into Airport values('LED','Pulkovo', 7)
insert into Airport values('SVX','Koltsovo', 8)
insert into Airport values('AER','Adler', 9)
GO
                                                                                                                                                                                                                                                        
----Пассажиры------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Passenger values(1,'Bruce Willis','50698452')
insert into Passenger values(2,'George Clooney','50698452')
insert into Passenger values(3,'Kevin Costner','50698452')
insert into Passenger values(4,'Donald Sutherland','50698452')
insert into Passenger values(5,'Jennifer Lopez','50698452')
insert into Passenger values(6,'Ray Liotta','50698452')
insert into Passenger values(7,'Samuel L. Jackson','50698452')
insert into Passenger values(8,'Nikole Kidman','50698452')
insert into Passenger values(9,'Alan Rickman','50698452')
insert into Passenger values(10,'Kurt Russell','50698452')
insert into Passenger values(11,'Harrison Ford','50698452')
insert into Passenger values(12,'Russell Crowe','50698452')
insert into Passenger values(13,'Steve Martin','50698452')
insert into Passenger values(14,'Michael Caine','50698452')
insert into Passenger values(15,'Angelina Jolie','50698452')
insert into Passenger values(16,'Mel Gibson','50698452')
insert into Passenger values(17,'Michael Douglas','50698452')
insert into Passenger values(18,'John Travolta','50698452')
insert into Passenger values(19,'Sylvester Stallone','50698452')
insert into Passenger values(20,'Tommy Lee Jones','50698452')
insert into Passenger values(21,'Catherine Zeta-Jones','50698452')
insert into Passenger values(22,'Antonio Banderas','50698452')
insert into Passenger values(23,'Kim Basinger','50698452')
insert into Passenger values(24,'Sam Neill','50698452')
insert into Passenger values(25,'Gary Oldman','50698452')
insert into Passenger values(26,'Clint Eastwood','50698452')
insert into Passenger values(27,'Brad Pitt','50698452')
insert into Passenger values(28,'Johnny Depp','50698452')
insert into Passenger values(29,'Pierce Brosnan','50698452')
insert into Passenger values(30,'Sean Connery','50698452')
insert into Passenger values(31,'Bruce Willis','50698452')
insert into Passenger values(37,'Mullah Omar','50698452')

GO

                                                                                                                                                                                                                                                             
----Рейсы------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Trip values(1100,4,1,'AER','CDG','20230212 14:30:00.000','20230212 17:50:00.000')
insert into Trip values(1101,4,1,'CDG','AER','20230214 08:12:00.000','20230214 11:45:00.000')
insert into Trip values(1123,3,2,'AER','DME','20230212 16:20:00.000','20230213 03:40:00.000')
insert into Trip values(1124,3,2,'DME','AER','20230212 09:00:00.000','20230212 19:50:00.000')
insert into Trip values(1145,2,3,'SVO','LED','20230213 09:35:00.000','20230213 11:23:00.000')
insert into Trip values(1146,2,3,'LED','SVO','20230214 17:55:00.000','20230214 20:01:00.000')
insert into Trip values(1181,1,4,'LED','SVO','20230212 06:12:00.000','20230212 08:01:00.000')
insert into Trip values(1182,1,4,'SVO','LED','20230213 12:35:00.000','20230213 14:30:00.000')
insert into Trip values(1187,1,4,'SVO','SVX','20230212 15:42:00.000','20230212 17:39:00.000')
insert into Trip values(1188,1,4,'SVX','SVO','20230214 22:50:00.000','20230215 00:48:00.000')
insert into Trip values(1195,1,4,'SVX','DME','20230213 23:30:00.000','20230214 01:11:00.000')
insert into Trip values(1196,1,4,'DME','SVX','20230212 04:00:00.000','20230212 05:45:00.000')
insert into Trip values(7771,5,5,'AYT','PEK','20230214 01:00:00.000','20230214 11:00:00.000')
insert into Trip values(7772,5,5,'PEK','AYT','20230212 12:00:00.000','20230213 02:00:00.000')
insert into Trip values(7773,5,5,'IST','DME','20230213 03:00:00.000','20230213 13:00:00.000')
insert into Trip values(7774,5,5,'DME','IST','20230212 14:00:00.000','20230213 06:00:00.000')
insert into Trip values(7775,5,7,'PEK','SVO','20230214 09:00:00.000','20230214 20:00:00.000')
insert into Trip values(7776,5,7,'SVO','PEK','20230214 18:00:00.000','20230215 08:00:00.000')
insert into Trip values(7777,5,7,'IST','BCN','20230212 18:00:00.000','20230213 06:00:00.000')
insert into Trip values(7778,5,6,'BCN','IST','20230214 22:00:00.000','20230215 12:00:00.000')
insert into Trip values(8881,5,6,'LED','AER','20230212 03:00:00.000','20230212 04:00:00.000')
insert into Trip values(8882,5,6,'AER','LED','20230213 22:00:00.000','20230213 23:00:00.000')

GO
                                                                                                                                                                                                                                                           
----Пассажиры х Рейсы------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Pass_in_trip values(1100,'20030429 00:00:00.000',1,'1a')
insert into Pass_in_trip values(1123,'20030405 00:00:00.000',3,'2a')
insert into Pass_in_trip values(1123,'20030408 00:00:00.000',1,'4c')
insert into Pass_in_trip values(1123,'20030408 00:00:00.000',6,'4b')
insert into Pass_in_trip values(1124,'20030402 00:00:00.000',2,'2d')
insert into Pass_in_trip values(1145,'20030405 00:00:00.000',3,'2c')
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',1,'1a')
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',6,'1b')
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',8,'3c')
insert into Pass_in_trip values(1181,'20030413 00:00:00.000',5,'1b')
insert into Pass_in_trip values(1182,'20030413 00:00:00.000',5,'4b')
insert into Pass_in_trip values(1187,'20030414 00:00:00.000',8,'3a')
insert into Pass_in_trip values(1188,'20030401 00:00:00.000',8,'3a')
insert into Pass_in_trip values(1182,'20030413 00:00:00.000',9,'6d')
insert into Pass_in_trip values(1145,'20030425 00:00:00.000',5,'1d')
insert into Pass_in_trip values(1187,'20030414 00:00:00.000',10,'3d')
insert into Pass_in_trip values(8882,'20051106 00:00:00.000',37,'1a') 
insert into Pass_in_trip values(7771,'20051107 00:00:00.000',37,'1c') 
insert into Pass_in_trip values(7772,'20051107 00:00:00.000',37,'1a') 
insert into Pass_in_trip values(8881,'20051108 00:00:00.000',37,'1d') 
insert into Pass_in_trip values(7778,'20051105 00:00:00.000',10,'2a') 
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',10,'3a')
insert into Pass_in_trip values(7771,'20051104 00:00:00.000',11,'4a')
insert into Pass_in_trip values(7771,'20051107 00:00:00.000',11,'1b')
insert into Pass_in_trip values(7771,'20051109 00:00:00.000',11,'5a')
insert into Pass_in_trip values(7772,'20051107 00:00:00.000',12,'1d')
insert into Pass_in_trip values(7773,'20051107 00:00:00.000',13,'2d')
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',13,'1b')
insert into Pass_in_trip values(8882,'20051113 00:00:00.000',14,'3d')
insert into Pass_in_trip values(7771,'20051114 00:00:00.000',14,'4d')
insert into Pass_in_trip values(7771,'20051116 00:00:00.000',14,'5d')
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',14,'1c')

GO