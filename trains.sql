CREATE TABLE Stations(
	Station_ID	char(2),
	Name			varchar(20),
	City			varchar(20),
	Latitude		float,
	Longitude		float,
	PRIMARY KEY(Station_ID));
CREATE TABLE Trains(
	Train_ID		char(2),
	Train_Number	char(4),
	Name			varchar(20),
	PRIMARY KEY(Train_ID, Train_Number));	

CREATE TABLE Schedules(
    Train_ID        char(2) NOT NULL,
    Station_ID      char(2) NOT NULL,
    Schedule_ID		char(2) NOT NULL,
    Arrival_Time    TIME,
    Departure_Time  TIME,
    PRIMARY KEY(Schedule_ID),
    FOREIGN KEY (Train_ID) REFERENCES Trains (Train_ID),
    FOREIGN KEY (Station_ID) REFERENCES Stations (Station_ID)
);
CREATE TABLE Customers(
	C_id			varchar(20),
	Name			varchar(20),
	Address			varchar(20),
	PRIMARY KEY(C_id)
);
CREATE TABLE Credit_Cards(
	Card_id			varchar(20),
	card_num		varchar(16),
	PRIMARY KEY(Card_id),
	FOREIGN KEY (Card_id) REFERENCES Customer(C_id)
);
CREATE TABLE Travel_Routes(
	Schedule_ID		char(2) NOT NULL,
	FOREIGN KEY (Schedule_ID) REFERENCES Schedules (Schedule_ID)	
);
CREATE TABLE Reservations(
	R_ID			char(2) NOT NULL,
	Customer_id		varchar(20) NOT NULL,
	Total_Cost		int,
	FOREIGN KEY (Customer_id) REFERENCES Customers (C_id),	
	PRIMARY KEY	(R_ID) REFERENCES Travel_Routes (Schedule_ID)
);
CREATE TABLE Payments(
	C_id 			varchar(20) NOT NULL,
	Reservation 	char(2) NOT NULL,
	FOREIGN KEY (C_id) REFERENCES Customers (C_id),
	FOREIGN KEY (R_ID) REFERENCES Reservations (R_ID)
);

INSERT INTO Stations VALUES ("1", "Alexandria Station", 	"Alexandria", 		31.298495, -92.445684);
INSERT INTO Stations VALUES ("2", "Park Station", 			"Denham Springs", 	30.484210, -90.955864);
INSERT INTO Stations VALUES ("3", "Lake Charles Station", 	"Lake Charles", 	30.238162, -93.217134);
INSERT INTO Stations VALUES ("4", "New Orleans Station", 	"New Orleans", 		29.946207, -90.078658);
INSERT INTO Stations VALUES ("5", "Slidell Station", 		"Slidell", 			30.278457, -89.782555);
INSERT INTO Stations VALUES ("6", "Hodge Station", 			"Hodge", 			32.273116, -92.724340);
INSERT INTO Stations VALUES ("7", "West Station", 			"Ruston", 			32.528538, -92.640441);
INSERT INTO Stations VALUES ("8", "Hammond Station", 		"Hammond", 			30.507178, -90.462146);
INSERT INTO Stations VALUES ("9", "Lafayette Station", 		"Lafayette", 		30.226698, -92.014269);
INSERT INTO Stations VALUES ("10", "Leesville Station", 	"Leesville", 		31.131456, -93.263991);
INSERT INTO Stations VALUES ("11", "Jonesboro Station", 	"Jonesboro", 		32.241121, -92.712776);
INSERT INTO Stations VALUES ("12", "Shreveport Station", 	"Shreveport", 		32.450048, -93.797881);

INSERT INTO Trains VALUES 	("11", "2111", "Sunset Limited");
INSERT INTO Trains VALUES 	("20", "2256", "Crescent");
INSERT INTO Trains VALUES 	("2", "1335", "Cardinal");
INSERT INTO Trains VALUES 	("5", "3314", "Delta");
INSERT INTO Trains VALUES 	("35", "2322", "Palmetto");
INSERT INTO Trains VALUES 	("10", "1333", "Carolinian");
INSERT INTO Trains VALUES 	("12", "2334", "Silver Meteor");
INSERT INTO Trains VALUES 	("1", "3422", "Liberty Limited");
INSERT INTO Trains VALUES 	("3", "3422", "Kentucky Cardinal");
INSERT INTO Trains VALUES 	("19", "3422", "Mainstreeter");
INSERT INTO Trains VALUES 	("13", "3422", "Acadian");
INSERT INTO Trains VALUES 	("17", "3422", "Cajun Express");
INSERT INTO Trains VALUES 	("30", "3422", "Azalean");
INSERT INTO Trains VALUES 	("50", "3422", "Liberty Express");
INSERT INTO Trains VALUES 	("48", "3422", "Blue Ridge");
INSERT INTO Trains VALUES 	("42", "3422", "Buckeye");
INSERT INTO Trains VALUES 	("27", "3422", "Denali Star");

/*Shreveport 12, Ruston 7, Hodge 6, Jonesboro 11, Alexandria 1, Lafayette 9*/
INSERT INTO Schedules VALUES("1","12","01","08:00:00","08:15:00");
INSERT INTO Schedules VALUES("1","7","02","09:15:00","09:20:00");
INSERT INTO Schedules VALUES("1","6","03","09:40:00","09:45:00");
INSERT INTO Schedules VALUES("1","11","04","09:50:00","09:55:00");
INSERT INTO Schedules VALUES("1","1","05","11:45:00","12:00:00");
INSERT INTO Schedules VALUES("1","9","06","13:30:00","15:00:00");

INSERT INTO Schedules VALUES("1","1","07","17:00:00","17:15:00");
INSERT INTO Schedules VALUES("1","11","08","19:00:00","19:05:00");
INSERT INTO Schedules VALUES("1","6","09","19:10:00","19:15:00");
INSERT INTO Schedules VALUES("1","7","10","20:00:00","20:15:00");
INSERT INTO Schedules VALUES("1","12","11","21:00:00",NULL);

/*Lake Charles 3, Lafayette 9, Denham Springs 2, Hammond 8, Slidell 5, New Orleans 4*/
INSERT INTO Schedules VALUES("12","3","12","08:00:00","08:15:00");
INSERT INTO Schedules VALUES("12","9","13","10:00:00","10:15:00");
INSERT INTO Schedules VALUES("12","2","14","11:30:00","11:45:00");
INSERT INTO Schedules VALUES("12","8","15","12:15:00","12:20:00");
INSERT INTO Schedules VALUES("12","5","16","13:30:00","13:35:00");
INSERT INTO Schedules VALUES("12","4","17","15:00:00","15:30:00");

INSERT INTO Schedules VALUES("12","5","18","17:00:00","17:05:00");
INSERT INTO Schedules VALUES("12","8","19","17:55:00","18:00:00");
INSERT INTO Schedules VALUES("12","2","20","18:30:00","18:35:00");
INSERT INTO Schedules VALUES("12","9","21","20:00:00","20:15:00");
INSERT INTO Schedules VALUES("12","3","22","22:00:00",NULL);

/*Lake Charles 3, Leesville 10, Alexandria 1*/
INSERT INTO Schedules VALUES("2","3","23","08:00:00","08:15:00");
INSERT INTO Schedules VALUES("2","10","24","9:30:00","9:45:00");
INSERT INTO Schedules VALUES("2","1","25","10:30:00","11:00:00");

INSERT INTO Schedules VALUES("2","10","26","11:45:00","12:00:00");
INSERT INTO Schedules VALUES("2","3","27","13:15:00","14:30:00");

INSERT INTO Schedules VALUES("2","10","28","15:45:00","16:00:00");
INSERT INTO Schedules VALUES("2","1","29","16:45:00","18:00:00");

INSERT INTO Schedules VALUES("2","10","30","18:45:00","19:00:00");
INSERT INTO Schedules VALUES("2","3","31","20:30:00",NULL);
/*Filling Customer*/
INSERT INTO Customer VALUES 	("000001", "John Cena", "54532 Burbank Drive");
INSERT INTO Customer VALUES 	("000002", "Ceba Jane", "64433 Lake Drive");
INSERT INTO Customer VALUES 	("000003", "Jack Hoffmen", "54732 Pond CT");
INSERT INTO Customer VALUES 	("000004", "Michael Scott", "64232 Sea Road");
INSERT INTO Customer VALUES 	("000005", "April Ludgate", "84132 Ryan Avenue");
INSERT INTO Customer VALUES 	("000006", "Brent Riecke", "74332 Alaska Street");
INSERT INTO Customer VALUES 	("000007", "Sam Win", "65432 Mcdonald Farm");
INSERT INTO Customer VALUES 	("000008", "Tobia Joe", "57537 Lakeview Ct");
INSERT INTO Customer VALUES 	("000009", "Hannah Smith", "58638 Ritz Drive");
INSERT INTO Customer VALUES 	("000010", "Jane Doe", "59739 Mall Road");
/*Filling Credit_Cards*/
INSERT INTO Credit_Cards VALUES 	("000001", "4556792661470783");
INSERT INTO Credit_Cards VALUES 	("000002", "6011014908275717");
INSERT INTO Credit_Cards VALUES 	("000003", "4005179445412066");
INSERT INTO Credit_Cards VALUES 	("000004", "4929377297464937");
INSERT INTO Credit_Cards VALUES 	("000005", "4916920212280154");
INSERT INTO Credit_Cards VALUES 	("000006", "5485466084858592");
INSERT INTO Credit_Cards VALUES 	("000007", "5264803530345336");
INSERT INTO Credit_Cards VALUES 	("000008", "5136052756249527");
INSERT INTO Credit_Cards VALUES 	("000009", "5277450585193990");
INSERT INTO Credit_Cards VALUES 	("000010", "5137428474205224");

/*Filling Travel Routes*/
INSERT INTO Travel_Routes VALUES	("01");
INSERT INTO Travel_Routes VALUES	("02");
INSERT INTO Travel_Routes VALUES	("03");
INSERT INTO Travel_Routes VALUES	("04");
INSERT INTO Travel_Routes VALUES	("05");
INSERT INTO Travel_Routes VALUES	("06");
INSERT INTO Travel_Routes VALUES	("07");
INSERT INTO Travel_Routes VALUES	("08");
INSERT INTO Travel_Routes VALUES	("09");
INSERT INTO Travel_Routes VALUES	("10");

/*Filling Reservations*/

INSERT INTO Reservations VALUES	("01", "000001", "015");
INSERT INTO Reservations VALUES	("02", "000002", "033");
INSERT INTO Reservations VALUES	("03", "000003", "059");
INSERT INTO Reservations VALUES	("04", "000004", "075");
INSERT INTO Reservations VALUES	("05", "000005", "095");
INSERT INTO Reservations VALUES	("06", "000006", "113");
INSERT INTO Reservations VALUES	("07", "000007", "136");
INSERT INTO Reservations VALUES	("08", "000008", "154");
INSERT INTO Reservations VALUES	("09", "000009", "172");
INSERT INTO Reservations VALUES	("10", "000010", "195");

/*Filling Payments*/

INSERT INTO Payments VALUES	("00001", "01");
INSERT INTO Payments VALUES	("00002", "02");
INSERT INTO Payments VALUES	("00003", "03");
INSERT INTO Payments VALUES	("00004", "04");
INSERT INTO Payments VALUES	("00005", "05");
INSERT INTO Payments VALUES	("00006", "06");
INSERT INTO Payments VALUES	("00007", "07");
INSERT INTO Payments VALUES	("00008", "08");
INSERT INTO Payments VALUES	("00009", "09");
INSERT INTO Payments VALUES	("00010", "10");




