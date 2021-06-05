
---Utilizando los comandos CREATE DATABASE, CREATE TABLE e INSERT INTO, 
--crea una base de datos llamada "Ferretería" que contenga dos tablas, una llamada "Inventario" y 
---otra llamada "Proveedores".
--Cada tabla debe contener al menos con cinco filas
--Para la tabla "Inventario" crea un campo cuyos valores comiencen en 1 y 
--vayan incrementando de uno en uno automáticamente y utiliza este campo como llave primaria. 
--Agrega además los campos "Descripción", "Inventario_Minimo" y "Proveedor"
--La tabla "Proveedores" deberá contener los campos "Proveedor" 
--(el cual contendrá la misma información que el campo "Proveedor" de la tabla "Inventario"),
--"Teléfono" y "Tiempo_de_Entrega", que será la cantidad de días hábiles que el proveedor tarda en 
--entregar el material a la Ferretería. 

CREATE DATABASE Ferreteria;
USE Ferreteria;
CREATE TABLE Inventario (
       Id_Num  INTEGER IDENTITY(1,1), 
	   Descripcion VARCHAR(255) NOT NULL, 
	   Inventario_Minimo INT, 
	   Proveedor VARCHAR(255), 
	   PRIMARY KEY (Id_Num)
);

CREATE TABLE Proveedores ( 
       Proveedor VARCHAR(255) NOT NULL, 
	   Teléfono VARCHAR(10), 
	   Tiempo_de_Entrega INT, 
	   PRIMARY KEY (Proveedor)
);

INSERT INTO Inventario VALUES ('Foco 10W', 14, 'Servi_Luz');
INSERT INTO Inventario VALUES ('Taladros de Punta Larga', 27, 'Truper');
INSERT INTO Inventario VALUES ('Tornillos', 3, 'Sayer');
INSERT INTO Inventario VALUES ('Cepillos de Expansion', 43, 'Fischer');
INSERT INTO Inventario VALUES ('Desarmadores', 98, 'Black & Decker');

INSERT INTO Proveedores VALUES ('Decker', 3310203457, 10);
INSERT INTO Proveedores VALUES('Fischer',3304283472, 7);
INSERT INTO Proveedores VALUES('Sayer',3312364578, 3);
INSERT INTO Proveedores VALUES('Servi_Luz',3335769553, 5);
INSERT INTO Proveedores VALUES('Truper',3323458719, 7);



---CONSULTAS BASICAS 


CREATE DATABASE Alumnos
USE Alumnos;
CREATE TABLE Datos_Personales (
    Id_num INTEGER IDENTITY(1, 1),
    Nombre VARCHAR(255) NOT NULL,
    Correo VARCHAR(255),
    Direccion VARCHAR(255),
    Ciudad VARCHAR(255) NOT NULL,
    Telefono VARCHAR(15),
    Genero CHAR(1),
    Estado_Civil VARCHAR(12),
    PRIMARY KEY (Id_num)
);


 ALTER TABLE Datos_Personales DROP COLUMN Correo; /**Eliminar Columna de una tabla**/
 ALTER TABLE Datos_Personales ADD Correo VARCHAR(255); /**Agregar una Columna a una tabla**/
 DROP TABLE Datos_Personales; /**Eliminar tabla**/
/** Para poner datos en tabla **/



INSERT INTO Datos_Personales VALUES ('Letha Bolt', 'AbrahamAcevedo@gmail.com', '2628 Riverview', 'Wabash', '(564) 517-5025', 'M', 'Divorced')
INSERT INTO Datos_Personales VALUES ('Vanita Kelleher', 'Jude_High169@gmail.com', NULL, 'Concord', '(684) 186-0087', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Marcos Abraham', 'Bauer@gmail.com', '80 White Woodfort Ln', 'Clayton', '(260) 313-6443', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Miyoko Mckinney', 'Alarcon@gmail.com', '925 Hope St', 'Scottdale', '(868) 864-8718', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Adolph Francisco', 'gndd9978@gmail.com', '3755 Red Burwood Way', 'Mount Horeb', '(451) 929-8321', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Oma Lawler', NULL, NULL, 'Kings Point', '(133) 683-0582', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Felix Alba', 'Palmer_Lofton@gmail.com', '3813 Hope St', 'Hoopeston', '(765) 713-9006', 'F', 'Widow');
INSERT INTO Datos_Personales VALUES ('Eusebia Noland', 'Abernathy@gmail.com', '1168 Lake Circle', 'Concord', '(447) 838-0332', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Denisha Mcginnis', 'Adaline_Abbott@gmail.com', '74 Burwood Way', 'Brookings', '(730) 273-6683', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Stanford Sullivan', 'Shayne_Britton589@gmail.com', '3836 Hunting Hill Pkwy', 'Beavercreek', '(812) 252-0427', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Nathan Salisbury', 'mxwygtmf_ahjpwboxdy@gmail.com', '3603 Stonewood Ct', 'Dublin', '(977) 813-8110', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Burton Bunnell', 'Steve.A.Pape@outlook.com', '3490 Quailwood Street', 'Breese', '(826) 366-1014', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Adah Jameson', 'Ivan.Southern98@gmail.com', NULL, 'Bedford Heights', '(914) 159-1651', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Adam Geer', 'Darell_Centeno27@gmail.com', '402 Bayview Avenue', 'Aberdeen', '(961) 069-2786', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Freeman Selby', 'Shanta.Beaver89@outlook.com', '647 Hidden Front Blvd', 'Pleasant Prairie', '(768) 048-0640', 'F', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Laura Barger', 'GregoryMurrell@gmail.com', '3744 Woodhurst Pkwy', 'Chickasaw', '(790) 495-8216', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Ariel Hermann', 'rfgxqoso9811@gmail.com', '683 SW Stonewood Way', 'Brigantine', '(552) 037-7186', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Adam Maddox', 'Violette_Maxey368@gmail.com', '2254 W Riverview Lane', 'Merrill', '(247) 811-3933', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Winnifred Brantley', 'Sanderson@gmail.com', '1314 New Glenwood Hwy', 'Lincoln Park', '(594) 490-9628', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Gayle Baugh', 'Dennis@gmail.com', '781 North Hunting Hill Ln', 'Lompoc', '(438) 866-0472', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Delcie Abney', 'Shifflett@gmail.com', '502 New Highland Highway', 'Madisonville', '(227) 049-9918', 'M', NULL);
INSERT INTO Datos_Personales VALUES ('Kasey Furr', 'Abbie.Watts@gmail.com', '2961 Deepwood Dr', 'Arlington', '(768) 693-9345', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Gertie Abel', 'AlessandraNMckenzie72@gmail.com', '1156 Town Avenue', 'North Richland Hills', '(487) 479-9336', 'F', 'Widowed');
INSERT INTO Datos_Personales VALUES ('Myles Angel', 'mivxztrm_txjxxsw@gmail.com', '2008 Town Cir', 'Brenham', '(857) 863-6779', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Jerome Gipson', 'Killian@outlook.com', NULL, 'Chehalis', NULL, 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Lilla Perez', 'Maness@outlook.com', NULL, 'Big Rapids', '(104) 855-4937', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Josephine Norwood', 'KimberlieCrocker@outlook.com', '81 Beachwood Lane', 'Lindale', '(273) 600-9445', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Elli Robertson', 'oxdngcmz8118@gmail.com', '51 Stonewood Pkwy', 'Sheridan', '(553) 638-6830', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Curtis Hutson', 'Tiffanie.Romero27@outlook.com', '725 NW Waterview Way', 'Cathedral City', '(442) 344-5339', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Melia Gates', 'Gable@gmail.com', '75 Beachwood Way', 'San Angelo', '(535) 013-0514', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Marc Pickering', 'Myrtle_Bernard@gmail.com', '222 Burwood Pkwy', 'Fair Haven', '(875) 375-2382', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Alida Jobe', 'Raynor8@gmail.com', '959 East Meadowview Drive', 'Snoqualmie', '(610) 362-5075', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Cordelia Key', 'Sipes449@gmail.com', '2004 Mountain Dr', 'Philadelphia', '(243) 459-7372', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Reba Gregg', 'Batson@gmail.com', '2008 3rd Ct', 'Valdosta', '(845) 678-6842', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Jarod Bourgeois', 'ReaReyna391@outlook.com', '894 Old Rock Hill Way', 'Williams', '(384) 573-9515', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Oliva Coble', 'SeeleyJ@gmail.com', '2274 E Lake Ct', 'Ringwood', '(135) 721-2385', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Corey Musgrove', 'AbbieAbel@gmail.com', '1052 Deepwood Cir', 'Walnut Ridge', '(533) 039-4249', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Bud Grubbs', 'Monty.Swan5@outlook.com', '138 1st Drive', 'Mahtomedi', '(649) 790-3129', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Newton Graves', 'SteinerK@gmail.com', '2747 W Hope Hwy', 'Star', '(861) 866-2316', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Tamica Goins', 'Daily37@gmail.com', '3082 West Quailwood Loop', 'Lewisville', '(403) 014-5022', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Bertram Herzog', 'AddieTrice329@gmail.com', '609 Rose Hill Court', 'Winthrop Harbor', '(153) 734-4222', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Malcolm Coward', 'Caballero313@gmail.com', '238 Pine Tree Dr', 'Park Ridge', NULL, 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Carley Valdez', 'uvrguf247@outlook.com', '17 Bayview Lane', 'Big Spring', '(821) 308-8608', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Lizzie Krueger', 'Jewel.Albers24@outlook.com', '3747 Sharp Hill Dr', 'Champlin', '(864) 550-3567', 'F', NULL);
INSERT INTO Datos_Personales VALUES ('Celestine Hong', NULL, NULL, 'Beckley', '(360) 865-3659', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Shonda Leake', 'Oliva_Caskey572@gmail.com', '327 New Church St', 'Albion', '(598) 443-5163', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Hubert Waldrop', NULL, '2147 Riverview Dr', 'Aberdeen', '(995) 647-4714', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Alphonso Meeks', 'Nannie_Farr@outlook.com', '2621 Mountain Circle', 'Cahokia', '(447) 684-3013', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Aimee Stamm', 'mcvgy02@gmail.com', '806 Rose Hill Highway', 'Clarksville', NULL, 'M', NULL);
INSERT INTO Datos_Personales VALUES ('Sonia Ackerman', 'Mcnamara616@gmail.com', '3566 Old Hope Cir', 'Canal Fulton', '(866) 682-6586', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Bertrada Zabel', 'AbrahamAcevedo@hotmail.com', 'Monett', 'Middlesbrough', '(564) 517-5025', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Heiderose Blind', 'Jude_High169@hotmail.com', NULL, 'Stoke-on-Trent', '(684) 186-0087', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Joko Adler', 'Bauer@hotmail.com', 'Hanover', 'Oxford', '(260) 313-6443', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Hemma Küchenmeister', 'Alarcon@hotmail.com', 'West Bountiful', 'Liverpool', '(868) 864-8718', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Helwig Hummel', 'gndd9978@hotmail.com', 'Kiryas Joel', 'Milton Keynes', '(451) 929-8321', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Orthey Feuerbach', NULL, NULL, 'Gloucester', '(133) 683-0582', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Hannfried Blume', 'Palmer_Lofton@hotmail.com', 'Hampton', 'West Bromwich', '(765) 713-9006', 'F', 'Widow');
INSERT INTO Datos_Personales VALUES ('Xenja Bohnke', 'Abernathy@hotmail.com', 'Watauga', 'Colchester', '(447) 838-0332', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Selinda Reinrhard', 'Adaline_Abbott@hotmail.com', 'River Rouge', 'London', '(730) 273-6683', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Pontianus Unger', 'Shayne_Britton589@hotmail.com', 'Cleburne', 'Huddersfield', '(812) 252-0427', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Berengar Gering', 'mxwygtmf_ahjpwboxdy@hotmail.com', 'Valdosta', 'Walsall', '(977) 813-8110', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Clemendina Singer', 'Steve.A.Pape@outlook.com', 'Centralia', 'Wolverhampton', '(826) 366-1014', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Adine  Abicht', 'Ivan.Southern98@hotmail.com', NULL, 'Peterborough', '(914) 159-1651', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Falina Fischer', 'Darell_Centeno27@hotmail.com', 'Aberdeen', 'Sheffield', '(961) 069-2786', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Lovis Kloz', 'Shanta.Beaver89@outlook.com', 'Peekskill', 'Sunderland', '(768) 048-0640', 'F', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Amrei Menger', 'GregoryMurrell@hotmail.com', 'Presque Isle', 'Newcastle upon Tyne', '(790) 495-8216', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Catrin Niemann', 'rfgxqoso9811@hotmail.com', 'Madera', 'Bolton', '(552) 037-7186', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Conny Dippel', 'Violette_Maxey368@hotmail.com', 'Burbank', 'Watford', '(247) 811-3933', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Armgard Gerngross', 'Sanderson@hotmail.com', 'El Monte', 'Coventry', '(594) 490-9628', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Korth Schiefer', 'Dennis@hotmail.com', 'Sherwood', 'Slough', '(438) 866-0472', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Lenchen Zinger', 'Shifflett@hotmail.com', 'Poteau', 'Bournemouth', '(227) 049-9918', 'M', NULL);
INSERT INTO Datos_Personales VALUES ('Barthel  Zenner', 'Abbie.Watts@hotmail.com', 'Oxford', 'York', '(768) 693-9345', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Krispin Zeiger', 'AlessandraNMckenzie72@hotmail.com', 'Troutdale', 'Luton', '(487) 479-9336', 'F', 'Widowed');
INSERT INTO Datos_Personales VALUES ('Wilbrecht Ebel', 'mivxztrm_txjxxsw@hotmail.com', 'Palm Bay', 'Sutton Coldfield', '(857) 863-6779', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Dieter Gardenberg', 'Killian@outlook.com', NULL, 'Crawley', NULL, 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Rüder Geller', 'Maness@outlook.com', NULL, 'Ipswich', '(104) 855-4937', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('California Zeiger', 'KimberlieCrocker@outlook.com', 'Malone', 'Bradford', '(273) 600-9445', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Fredegar Menzel', 'oxdngcmz8118@hotmail.com', 'Kaysville', 'Southampton', '(553) 638-6830', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Lisa-Maria Geller', 'Tiffanie.Romero27@outlook.com', 'Coachella', 'Manchester', '(442) 344-5339', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Aurion  Stumpf', 'Gable@hotmail.com', 'Aberdeen', 'Plymouth', '(535) 013-0514', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Friedwart Möbius', 'Myrtle_Bernard@hotmail.com', 'Slatington', 'Kingston upon Hull', '(875) 375-2382', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Cölestin Köstlin', 'Raynor8@hotmail.com', 'Satellite Beach', 'Dudley', '(610) 362-5075', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Abeline  Gelen', 'Sipes449@hotmail.com', 'Amsterdam', 'Swindon', '(243) 459-7372', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Balte  Feierbach', 'Batson@hotmail.com', 'Washington Court House', 'Northampton', '(845) 678-6842', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Chlothar Bohrmann', 'ReaReyna391@outlook.com', 'Absecon', 'Derby', '(384) 573-9515', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Dietlana Kronberg', 'SeeleyJ@hotmail.com', 'Melrose Park', 'Poole', '(135) 721-2385', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Mirinda Schwarz', 'AbbieAbel@hotmail.com', 'Hazel Park', 'Leeds', '(533) 039-4249', 'M', 'Divorced');
INSERT INTO Datos_Personales VALUES ('Diepold Buchholz', 'Monty.Swan5@outlook.com', 'Lakeland', 'Southend-on-Sea', '(649) 790-3129', 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Janeric Pritzel', 'SteinerK@hotmail.com', 'Herndon', 'Brighton', '(861) 866-2316', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Adriane  Finkelstein', 'Daily37@hotmail.com', 'Warwick', 'Norwich', '(403) 014-5022', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Volbrecht Brandt', 'AddieTrice329@hotmail.com', 'Collinsville', 'Telford', '(153) 734-4222', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Haiko Zenner', 'Caballero313@hotmail.com', 'Cheboygan', 'Birmingham', NULL, 'M', 'Married');
INSERT INTO Datos_Personales VALUES ('Avenell Rüdiger', 'uvrguf247@outlook.com', 'Olympia Fields', 'Eastbourne', '(821) 308-8608', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Annalena Genkel', 'Jewel.Albers24@outlook.com', 'Lewisville', 'Portsmouth', '(864) 550-3567', 'F', NULL);
INSERT INTO Datos_Personales VALUES ('Haita Rosenblatt', NULL, NULL, 'Bristol', '(360) 865-3659', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Yente Ulbricht', 'Oliva_Caskey572@hotmail.com', 'Watauga', 'St Helens', '(598) 443-5163', 'M', 'Single');
INSERT INTO Datos_Personales VALUES ('Justus Dannenberg', NULL, 'Picayune', 'Blackburn', '(995) 647-4714', 'F', 'Married');
INSERT INTO Datos_Personales VALUES ('Ottfried Schneidermann', 'Nannie_Farr@outlook.com', 'Allegan', 'Leicester', '(447) 684-3013', 'F', 'Single');
INSERT INTO Datos_Personales VALUES ('Almute Ebert', 'mcvgy02@hotmail.com', 'Katy', 'Reading', NULL, 'M', NULL);
INSERT INTO Datos_Personales VALUES ('Friederun Appel', 'Mcnamara616@hotmail.com', 'Ste. Genevieve', 'Exeter', '(866) 682-6586', 'M', 'Married');

CREATE TABLE Ciudad(
    Ciudad VARCHAR(255) NOT NULL,
    Pais VARCHAR(100) NOT NULL,
    PRIMARY KEY (Ciudad)
);
INSERT INTO Ciudad VALUES ('Aberdeen','United Kingdom');
INSERT INTO Ciudad VALUES('Albion','United States');
INSERT INTO Ciudad VALUES('Arlington','United States');
INSERT INTO Ciudad VALUES('Beavercreek','United States');
INSERT INTO Ciudad VALUES('Beckley','United States');
INSERT INTO Ciudad VALUES('Bedford Heights','United States');
INSERT INTO Ciudad VALUES('Big Rapids','United States');
INSERT INTO Ciudad VALUES('Big Spring','United States');
INSERT INTO Ciudad VALUES('Birmingham','United Kingdom');
INSERT INTO Ciudad VALUES('Blackburn','United Kingdom');
INSERT INTO Ciudad VALUES('Bolton','United Kingdom');
INSERT INTO Ciudad VALUES('Bournemouth','United Kingdom');
INSERT INTO Ciudad VALUES('Bradford','United States');
INSERT INTO Ciudad VALUES('Breese','United States');
INSERT INTO Ciudad VALUES('Brenham','United States');
INSERT INTO Ciudad VALUES('Brigantine','United States');
INSERT INTO Ciudad VALUES('Brighton','United Kingdom');
INSERT INTO Ciudad VALUES('Bristol','United Kingdom');
INSERT INTO Ciudad VALUES('Brookings','United States');
INSERT INTO Ciudad VALUES('Cahokia','United States');
INSERT INTO Ciudad VALUES('Canal Fulton','United States');
INSERT INTO Ciudad VALUES('Cathedral City','United States');
INSERT INTO Ciudad VALUES('Champlin','United States');
INSERT INTO Ciudad VALUES('Chehalis','United States');
INSERT INTO Ciudad VALUES('Chickasaw','United States');
INSERT INTO Ciudad VALUES('Clarksville','United States');
INSERT INTO Ciudad VALUES('Clayton','United States');
INSERT INTO Ciudad VALUES('Colchester','United Kingdom');
INSERT INTO Ciudad VALUES('Concord','United States');
INSERT INTO Ciudad VALUES('Coventry','United Kingdom');
INSERT INTO Ciudad VALUES('Crawley','United States');
INSERT INTO Ciudad VALUES('Derby','United States');
INSERT INTO Ciudad VALUES('Dublin','United States');
INSERT INTO Ciudad VALUES('Dudley','United Kingdom');
INSERT INTO Ciudad VALUES('Eastbourne','United States');
INSERT INTO Ciudad VALUES('Exeter','United Kingdom');
INSERT INTO Ciudad VALUES('Fair Haven','United States');
INSERT INTO Ciudad VALUES('Gloucester','United Kingdom');
INSERT INTO Ciudad VALUES('Hoopeston','United States');
INSERT INTO Ciudad VALUES('Huddersfield','United Kingdom');
INSERT INTO Ciudad VALUES('Ipswich','United States');
INSERT INTO Ciudad VALUES('Kings Point','United Kingdom');
INSERT INTO Ciudad VALUES('Kingston upon Hull','United Kingdom');
INSERT INTO Ciudad VALUES('Leeds','United Kingdom');
INSERT INTO Ciudad VALUES('Leicester','United States');
INSERT INTO Ciudad VALUES('Lewisville','United States');
INSERT INTO Ciudad VALUES('Lincoln Park','United States');
INSERT INTO Ciudad VALUES('Lindale','United States');
INSERT INTO Ciudad VALUES('Liverpool','United Kingdom');
INSERT INTO Ciudad VALUES('Lompoc','United States');
INSERT INTO Ciudad VALUES('London','United Kingdom');
INSERT INTO Ciudad VALUES('Luton','United Kingdom');
INSERT INTO Ciudad VALUES('Madisonville','United States');
INSERT INTO Ciudad VALUES('Mahtomedi','United States');
INSERT INTO Ciudad VALUES('Manchester','United States');
INSERT INTO Ciudad VALUES('Merrill','United States');
INSERT INTO Ciudad VALUES('Middlesbrough','United Kingdom');
INSERT INTO Ciudad VALUES('Milton Keynes','United Kingdom');
INSERT INTO Ciudad VALUES('Mount Horeb','United States');
INSERT INTO Ciudad VALUES('Newcastle upon Tyne','United Kingdom');
INSERT INTO Ciudad VALUES('North Richland Hills','United States');
INSERT INTO Ciudad VALUES('Northampton','United Kingdom');
INSERT INTO Ciudad VALUES('Norwich','United Kingdom');
INSERT INTO Ciudad VALUES('Oxford','United Kingdom');
INSERT INTO Ciudad VALUES('Plymouth','United Kingdom');
INSERT INTO Ciudad VALUES('Poole','United Kingdom');
INSERT INTO Ciudad VALUES('Portsmouth','United States');
INSERT INTO Ciudad VALUES('Reading','United Kingdom');
INSERT INTO Ciudad VALUES('Park Ridge','United States');
INSERT INTO Ciudad VALUES('Peterborough','United Kingdom');
INSERT INTO Ciudad VALUES('Philadelphia','United States');
INSERT INTO Ciudad VALUES('Pleasant Prairie','United States');
INSERT INTO Ciudad VALUES('Ringwood','United States');
INSERT INTO Ciudad VALUES('San Angelo','United States');
INSERT INTO Ciudad VALUES('Scottdale','United States');
INSERT INTO Ciudad VALUES('Sheffield','United Kingdom');
INSERT INTO Ciudad VALUES('Sheridan','United States');
INSERT INTO Ciudad VALUES('Slough','United Kingdom');
INSERT INTO Ciudad VALUES('Snoqualmie','United States');
INSERT INTO Ciudad VALUES('Southampton','United Kingdom');
INSERT INTO Ciudad VALUES('Southend-on-Sea','United States');
INSERT INTO Ciudad VALUES('St Helens','United Kingdom');
INSERT INTO Ciudad VALUES('Star','United States');
INSERT INTO Ciudad VALUES('Stoke-on-Trent','United Kingdom');
INSERT INTO Ciudad VALUES('Sunderland','United States');
INSERT INTO Ciudad VALUES('Sutton Coldfield','United Kingdom');
INSERT INTO Ciudad VALUES('Swindon','United Kingdom');
INSERT INTO Ciudad VALUES('Telford','United Kingdom');
INSERT INTO Ciudad VALUES('Valdosta','United States');
INSERT INTO Ciudad VALUES('Wabash','United States');
INSERT INTO Ciudad VALUES('Walnut Ridge','United States');
INSERT INTO Ciudad VALUES('Walsall','United Kingdom');
INSERT INTO Ciudad VALUES('Watford','United Kingdom');
INSERT INTO Ciudad VALUES('West Bromwich','United Kingdom');
INSERT INTO Ciudad VALUES('Williams','United States');
INSERT INTO Ciudad VALUES('Winthrop Harbor','United States');
INSERT INTO Ciudad VALUES('Wolverhampton','United States');
INSERT INTO Ciudad VALUES('York','United Kingdom');

CREATE TABLE Region(
    Pais VARCHAR(100) NOT NULL,
    Region VARCHAR(100) NOT NULL,
    PRIMARY KEY (Pais)
);


INSERT INTO Region VALUES('United States','America');
INSERT INTO Region VALUES('United Kingdom','Europe');

---EXTRAYENDO COMPONENTES DE UNA COLUMNA

---#19. EXTRAYENDO COMPONENTES DE UNA FECHA 
---Muestre Año, Mes, año, hora de una columna 
USE [Adventure - Angel]

SELECT DateTime,
     DATEPART(YEAR, DateTime) AS Año, 
	 DATEPART(MONTH, DateTime) AS Mes, 
	 DATEPART(DAY, DateTime) AS dia, 
	 DATEPART(HOUR, DateTime) AS Hora, 
	 DATEPART(MINUTE, DateTime) AS Minuto
	 FROM PODateTime;
---CREA OTRAS 5 COLUMNAS. 


---IMPORTAR REGISTROS DE UN ARCHIVO CSV 

--IMPORTANDO REGISTROS DE UN ARCHIVO CSV A UNA TABLA. 
---Tenemos que abrir el archivo y ver que tienen el tipo de dato correcto. 
---Creamos la tabla con las mismas caracteristicas que tiene el archivo que importaremos. 

USE [Adventure - Angel];

CREATE TABLE Exportaciones(
       Material VARCHAR(255), ---caracteres
	   Sector VARCHAR(255), 
	   Monto_Exportacion BIGINT, 
	   Pais VARCHAR(255)
	   );
---Para importar registros 
BULK INSERT Exportaciones 
FROM 'C:/Users/URIEL/Documents/DATOS (CSV,XML,JSON,ETC)/DATOS CURSO SQL/Exportaciones Mexico varios paises 2018.csv'
--- CON FROM INDICAMOS LA RUTA Y EL NOMBRE DEL ARCHIVO
WITH --EL TIPO DE TERMINADO Y DELIMITADOR DLE ARCHIVO. 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n', 
FIRSTROW = 2      ---USAR ESTE PAREMETROS SI EL ARCHIVO TIENE ENCABEZADOS
