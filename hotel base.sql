CREATE TABLE [dbo].[Service] (
	[ID_serv] [int] NOT NULL ,
	[name] [char] (100) NOT NULL ,
    [cost] [int] NOT NULL ,
    [surcharge_cost] [int] NOT NULL
)
GO


CREATE TABLE [dbo].[Booking_method] (
	[ID_book] [int] NOT NULL ,
	[name] [char] (100) NOT NULL
)
GO


CREATE TABLE [dbo].[Payment_method] (
	[ID_pay] [int] NOT NULL ,
	[name] [char] (100) NOT NULL
)
GO


CREATE TABLE [dbo].[Country] (
	[ID_country] [int] NOT NULL ,
	[name] [char] (100) NOT NULL
)
GO

CREATE TABLE [dbo].[City] (
	[ID_city_birth] [int] NOT NULL ,
	[name] [char] (100) NOT NULL ,
	[ID_country] [int] NOT NULL
)
GO


CREATE TABLE [dbo].[Visitor] (
	[ID_book_vis] [int] NOT NULL ,
	[lastname] [char] (30) NOT NULL ,
	[name] [char] (30) NOT NULL ,
	[patronymic] [char] (30) NOT NULL ,
	[passport_number] [int] NOT NULL ,
	[date_birth] [date] NOT NULL  ,
	[ID_city_birth] [int] NOT NULL  ,
	[register_date] [date] NULL 
)
GO


CREATE TABLE [dbo].[Maid] (
	[ID_maid] [int] NOT NULL ,
	[lastname] [char] (30) NOT NULL ,
	[name] [char] (30) NOT NULL ,
	[patronymic] [char] (30) NOT NULL ,
	[passport_number] [int] NOT NULL ,
	[work_start_date] [date] NOT NULL  ,
	[wage] [int] NOT NULL 
)
GO


CREATE TABLE [dbo].[Room_cleaning] (
	[ID_room] [int] NOT NULL ,
	[class_room] [int] NOT NULL ,
	[name] [char] (50) NOT NULL ,
	[num_clean_day] [int] NOT NULL ,
	[maids_needed] [int] NOT NULL ,
	[ID_maid_1] [int] NOT NULL ,
	[ID_maid_2] [int] NULL ,
    [cost] [int] NOT NULL ,
    [surcharge_cost] [int] NOT NULL
)
GO


CREATE TABLE [dbo].[Holiday] (
	[ID_date] [int] NOT NULL ,
	[date] [date] NOT NULL
)
GO


CREATE TABLE [dbo].[Rent] (
	[ID_rent] [int] NOT NULL ,
	[transaction_date] [date] NOT NULL ,
	[transaction_time] [time] NOT NULL ,
	[ID_room] [int] NOT NULL ,
	[booking_date_start] [date] NOT NULL ,
	[booking_date_finish] [date] NOT NULL ,
    [ID_book] [int] NOT NULL ,
	[ID_pay] [int] NOT NULL ,
	[ID_book_vis] [int] NOT NULL ,
	[num_persons] [int] NOT NULL ,
	[ID_serv] [int] NULL
)
GO

-------------------------------------------
-------------------------------------------
-------------------------------------------


ALTER TABLE [dbo].[Service] WITH NOCHECK ADD 
	CONSTRAINT [PK_s] PRIMARY KEY  CLUSTERED 
	(
		[ID_serv]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Booking_method] WITH NOCHECK ADD 
	CONSTRAINT [PK_bm] PRIMARY KEY  CLUSTERED 
	(
		[ID_book]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Payment_method] WITH NOCHECK ADD 
	CONSTRAINT [PK_pm] PRIMARY KEY  CLUSTERED 
	(
		[ID_pay]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Country] WITH NOCHECK ADD 
	CONSTRAINT [PK_co] PRIMARY KEY  CLUSTERED 
	(
		[ID_country]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[City] WITH NOCHECK ADD 
	CONSTRAINT [PK_ci] PRIMARY KEY  CLUSTERED 
	(
		[ID_city_birth]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Visitor] WITH NOCHECK ADD 
	CONSTRAINT [PK_v] PRIMARY KEY  CLUSTERED 
	(
		[ID_book_vis]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Maid] WITH NOCHECK ADD 
	CONSTRAINT [PK_m] PRIMARY KEY  CLUSTERED 
	(
		[ID_maid]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Room_cleaning] WITH NOCHECK ADD 
	CONSTRAINT [PK_rc] PRIMARY KEY  CLUSTERED 
	(
		[ID_room]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[Rent] WITH NOCHECK ADD 
	CONSTRAINT [PK_r] PRIMARY KEY  CLUSTERED 
	(
		[ID_rent]
	)  ON [PRIMARY] 
GO



ALTER TABLE [dbo].[Holiday] WITH NOCHECK ADD 
	CONSTRAINT [PK_h] PRIMARY KEY  CLUSTERED 
	(
		[ID_date]
	)  ON [PRIMARY] 
GO

-------------------------------------------
-------------------------------------------
-------------------------------------------


ALTER TABLE [dbo].[City] ADD 
	CONSTRAINT [FK_City_Country] FOREIGN KEY 
	(
		[ID_country]
	) REFERENCES [dbo].[Country] (
		[ID_country]
	)
GO

ALTER TABLE [dbo].[Visitor] ADD 
	CONSTRAINT [FK_Visitor_City] FOREIGN KEY 
	(
		[ID_city_birth]
	) REFERENCES [dbo].[City] (
		[ID_city_birth]
	)
GO

ALTER TABLE [dbo].[Room_cleaning] ADD 
	CONSTRAINT [FK_Room_cleaning_Maid] FOREIGN KEY 
	(
		[ID_maid_1]
	) REFERENCES [dbo].[Maid] (
		[ID_maid]
	)
GO

ALTER TABLE [dbo].[Rent] ADD 
	CONSTRAINT [FK_Rent_Visitor] FOREIGN KEY 
	(
		[ID_book_vis]
	) REFERENCES [dbo].[Visitor] (
		[ID_book_vis]
	),
CONSTRAINT [FK_Rent_Room_cleaning] FOREIGN KEY 
	(
		[ID_room]
	) REFERENCES [dbo].[Room_cleaning] (
		[ID_room]
	),
CONSTRAINT [FK_Rent_Booking_method] FOREIGN KEY 
	(
		[ID_book]
	) REFERENCES [dbo].[Booking_method] (
		[ID_book]
	),
CONSTRAINT [FK_Rent_Payment_method] FOREIGN KEY 
	(
		[ID_pay]
	) REFERENCES [dbo].[Payment_method] (
		[ID_pay]
	),
CONSTRAINT [FK_Rent_Service] FOREIGN KEY 
	(
		[ID_serv]
	) REFERENCES [dbo].[Service] (
		[ID_serv]
	)
GO


-------------------------------------------
-------------------------------------------
-------------------------------------------

insert into Service values(1,'ordering dinner in the room', 1000, 1150)
insert into Service values(2,'laundry service', 300, 345)
insert into Service values(3,'sauna visit', 2000, 2300)
GO


insert into Booking_method values(1,'hotel website')
insert into Booking_method values(2,'Ostrovok.ru')
insert into Booking_method values(3,'Booking.com')
GO


insert into Payment_method values(1,'cash')
insert into Payment_method values(2,'card')
GO

insert into Country values(1,'Россия')
insert into Country values(2,'Латвия')
insert into Country values(3,'Эстония')
insert into Country values(4,'Украина')
insert into Country values(5,'Чехия')
insert into Country values(6,'Беларусь')
GO


insert into City values(1,'Москва',1)
insert into City values(2,'Санкт-Петербург',1)
insert into City values(3,'Волгоград',1)
insert into City values(4,'Сочи',1)
insert into City values(5,'Нижний Новгород',1)
insert into City values(6,'Рига',2)
insert into City values(7,'Таллин',3)
insert into City values(8,'Киев',4)
insert into City values(9,'Прага',5)
insert into City values(10,'Минск',6)
GO


insert into Maid values(1,'Галкин','Глеб','Альвианович',87654128,'20100110',15000)
insert into Maid values(2,'Беляков','Витольд','Тимофеевич',19191919,'20120706',17000)
insert into Maid values(3,'Исаков','Глеб','Георгиевич',19191918,'20200918',18500)
insert into Maid values(4,'Мельников','Андрей','Петрович',19191818,'20221129',33000)
insert into Maid values(5,'Красильников','Клемент','Иванович',18181818,'20220103',10000)
insert into Maid values(6,'Поповенко','Евгений','Романович',18181817,'20110104',12000)
insert into Maid values(7,'Герасимов','Станислав','Романович',18181717,'20100527',12200)
insert into Maid values(8,'Захаров','Станислав','Борисович',18171717,'20221114',14500)
insert into Maid values(9,'Шилов','Глеб','Витальевич',17171717,'20181030',13300)
insert into Maid values(10,'Муравьев','Геннадий','Павлович',17171717,'20120504',30000)
insert into Maid values(11,'Дементьев','Арсений','Павлович',17171716,'20101018',30000)
insert into Maid values(12,'Андропов','Борис','Васильеич',17171816,'20180917',29000)
insert into Maid values(13,'Васильев','Василий','Владимирович',17171819,'20100903',28000)
insert into Maid values(14,'Зиновьев','Владислав','Васильевич',17171515,'20121003',24000)
GO



insert into Visitor values(1,'Любимова','Алина','Эмировна',35707701,'19701126',1,'20201215')
insert into Visitor values(2,'Яковлева','Ярослава','Алексеевна',47893487,'19870811',1,'20201215')
insert into Visitor values(3,'Павлова','Ева','Дмитриевна',85451247,'19700410',1,'20201210')
insert into Visitor values(4,'Пономарева', 'Анна','Эмильевна',32569784,'20030217',2,'20201210')
insert into Visitor values(5,'Кузнецова', 'Вероника', 'Павловна',25369874,'19690310',2,'20210412')
insert into Visitor values(6,'Зимина','Виктория','Глебовна',85963625,'19880424',3,'20201129')
insert into Visitor values(7,'Агеева','Ангелина','Дмитриевна',28399878,'20030310',3,'20201129')
insert into Visitor values(8,'Петрова','Вероника','Тимофеевна',45896574,'19650801',4,'20210301')
insert into Visitor values(9,'Морозова','Ксения','Андреевна',45855458,'19971025',4,'20210301')
insert into Visitor values(10,'Сухарева','Милана','Ивановна',19847852,'20200724',5,'20210601')
insert into Visitor values(11,'Матвеев','Иван','Даниярович',28172817,'19760803',6,'20210130')
insert into Visitor values(12,'Филатов','Андрей','Андреевич',79461346,'1984-08-05',7,'20210420')
insert into Visitor values(13,'Овсянников','Вячеслав','Билалович',79461379,'19951102',8,'20211025')
insert into Visitor values(14,'Попов','Семён','Саввич',79465858,'19870512',9,'20210420')
insert into Visitor values(15,'Андрианов','Артём','Русланович',24352658,'19750122',10,'20211014')
GO

insert into Room_cleaning values(1,1,'Премиум',2,2,1,2,8000,9200)
insert into Room_cleaning values(2,1,'Премиум',2,2,3,4,8000,9200)
insert into Room_cleaning values(3,1,'Премиум',2,2,5,6,8000,9200)
insert into Room_cleaning values(4,2,'Комфорт',1,1,7,null,5000,5750)
insert into Room_cleaning values(5,2,'Комфорт',1,1,8,null,5000,5750)
insert into Room_cleaning values(6,2,'Комфорт',1,1,9,null,5000,5750)
insert into Room_cleaning values(7,3,'Стандарт',1,1,10,null,3000,3450)
insert into Room_cleaning values(8,3,'Стандарт',1,1,11,null,3000,3450)
insert into Room_cleaning values(9,3,'Стандарт',1,1,12,null,3000,3450)
insert into Room_cleaning values(10,3,'Стандарт',1,1,13,null,3000,3450)
insert into Room_cleaning values(11,3,'Стандарт',1,1,14,null,3000,3450)
GO


insert into Rent values(1,'20201210','12:30:00',1,'20201229','20210108',1,2,3,2,1)
insert into Rent values(2,'20201129','23:33:00',2,'20201231','20210105',2,2,6,2,2)
insert into Rent values(3,'20201215','07:03:00',3,'20201230','20210103',3,2,1,2,3)
insert into Rent values(4,'20210220','17:15:00',7,'20210223','20210224',1,1,12,2,null)
insert into Rent values(5,'20210301','14:13:00',2,'20210307','20210309',1,2,8,2,1)
insert into Rent values(6,'20211025','04:03:00',11,'20211104','20211105',3,2,13,1,null)
insert into Rent values(7,'20210412','14:11:00',1,'20210413','20210414',1,2,5,1,2)
insert into Rent values(8,'20210601','21:11:00',9,'20210603','20210610',2,2,10,1,2)
insert into Rent values(9,'20210130','01:59:00',10,'20210201','20210203',3,2,11,1,null)
insert into Rent values(10,'20211014','21:00:00',11,'20211015','20211018',1,1,15,1,3)
GO



insert into Holiday values(1,'20200101')
insert into Holiday values(2,'20200102')
insert into Holiday values(3,'20200103')
insert into Holiday values(4,'20200104')
insert into Holiday values(5,'20200105')
insert into Holiday values(6,'20200106')
insert into Holiday values(7,'20200107')
insert into Holiday values(8,'20200108')
insert into Holiday values(9,'20200223')
insert into Holiday values(10,'20200308')
insert into Holiday values(11,'20200501')
insert into Holiday values(12,'20200509')
insert into Holiday values(13,'20200612')
insert into Holiday values(14,'20201104')
insert into Holiday values(15,'20201231')
insert into Holiday values(16,'20210102')
insert into Holiday values(17,'20210103')
insert into Holiday values(18,'20210104')
insert into Holiday values(19,'20210105')
insert into Holiday values(20,'20210106')
insert into Holiday values(21,'20210107')
insert into Holiday values(22,'20210108')
insert into Holiday values(23,'20210223')
insert into Holiday values(24,'20210308')
insert into Holiday values(25,'20210501')
insert into Holiday values(26,'20210509')
insert into Holiday values(27,'20210612')
insert into Holiday values(28,'20211104')
insert into Holiday values(29,'20211231')
GO
