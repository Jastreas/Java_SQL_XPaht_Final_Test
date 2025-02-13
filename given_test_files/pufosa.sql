CREATE DATABASE Pufosa;

USE Pufosa;

CREATE TABLE empleados 
(
        empleado_ID             decimal(4),
        Apellido               VARCHAR(15),
        Nombre                  VARCHAR(15),
        Inicial_del_segundo_apellido          VARCHAR(1),
        Trabajo_ID                  decimal(3),
        Jefe_ID              decimal(4),
        Fecha_contrato              DATE,
        Salario                  decimal(7,2),
        Comision              decimal(7,2),
        Departamento_ID           decimal(2)
);
	
CREATE TABLE departamento 
(
        departamento_ID           decimal(2,0),
        Nombre                    VARCHAR(14),
        Ubicacion_ID             decimal(3,0)
);

CREATE TABLE CLIENTE (
        CLIENTE_ID             decimal (6),
        nombre                    VARCHAR (45),
        Direccion                 VARCHAR (40),
        Ciudad                    VARCHAR (30),
        Estado                   VARCHAR (2),
        CodigoPostal                VARCHAR (9),
        CodigoDeArea               decimal (3),
        Telefono            decimal (7),
        Vendedor_ID          decimal (4),
        Limite_De_Credito            decimal (9,2),
        Comentarios                LONG
);

CREATE TABLE Ubicacion (
        Ubicacion_ID             decimal(3),
        GrupoRegional          VARCHAR(20)
);


CREATE TABLE trabajos (
        Trabajo_ID                  decimal(3),
        Funcion                VARCHAR(30)
);

	

	
ALTER TABLE `cliente`
	ADD CONSTRAINT PRIMARY KEY (`CLIENTE_ID`);
	
ALTER TABLE `departamento`
	ADD CONSTRAINT PRIMARY KEY (`departamento_ID`);
	
ALTER TABLE `empleados`
	ADD CONSTRAINT PRIMARY KEY (`empleado_ID`);

	
ALTER TABLE `ubicacion`
	ADD CONSTRAINT PRIMARY KEY (`Ubicacion_ID`);
	

ALTER TABLE `trabajos`
	ADD CONSTRAINT PRIMARY KEY (`Trabajo_ID`);

	

ALTER TABLE `empleados`
	ADD CONSTRAINT `FK_empleados_departamento` FOREIGN KEY (`Departamento_ID`) REFERENCES `departamento` (`departamento_ID`);

ALTER TABLE `empleados`
	ADD CONSTRAINT `FK_empleados_trabajos` FOREIGN KEY (`Trabajo_ID`) REFERENCES `Trabajos` (`Trabajo_ID`);


ALTER TABLE `cliente`
	ADD CONSTRAINT `FK_cliente_empleados` FOREIGN KEY (`Vendedor_ID`) REFERENCES `empleados` (`empleado_ID`);
	
ALTER TABLE `departamento`
	ADD CONSTRAINT `FK_departamento_ubicacion` FOREIGN KEY (`Ubicacion_ID`) REFERENCES `ubicacion` (`Ubicacion_ID`);
	

	
INSERT INTO Ubicacion VALUES (122, 'NEW YORK');
INSERT INTO Ubicacion VALUES (124, 'DALLAS');
INSERT INTO Ubicacion VALUES (123, 'CHICAGO');
INSERT INTO Ubicacion VALUES (167, 'BOSTON');


INSERT INTO trabajos VALUES (667, 'SECRETARIO');
INSERT INTO trabajos VALUES (668, 'STAFF');
INSERT INTO trabajos VALUES (669, 'ANALYST');
INSERT INTO trabajos VALUES (670, 'VENDEDOR');
INSERT INTO trabajos VALUES (671, 'MANAGER');
INSERT INTO trabajos VALUES (672, 'PRESIDENT');

	
INSERT INTO departamento VALUES (10,'contabilidad','122');
INSERT INTO departamento VALUES (20,'Investigacion','124');
INSERT INTO departamento VALUES (30,'Ventas','123');
INSERT INTO departamento VALUES (40,'Operaciones','167');

INSERT INTO departamento VALUES   ( 12 , 'Investigacion', '122');

INSERT INTO departamento VALUES
  ( 13 , 'Ventas', '122');

INSERT INTO departamento VALUES
  ( 14 , 'Operaciones', '122');

INSERT INTO departamento VALUES
  ( 23 , 'Ventas', '124');

INSERT INTO departamento VALUES
  ( 24 , 'Operaciones', '124');

INSERT INTO departamento VALUES
  ( 34 , 'Operaciones', '123');

INSERT INTO departamento VALUES
  ( 43 , 'ventas', '167');



INSERT INTO empleados VALUES
    (7369,'SMITH','Juan','Q',667,7902,null,800,NULL,20);
INSERT INTO empleados VALUES
    (7499,'ALLEN','KEVIN','J',670,7698,null,1600,300,30);
INSERT INTO empleados VALUES
    (7505,'DOYLE','JEAN','K',671,7839,null,2850,NULL,13);
INSERT INTO empleados VALUES
    (7506,'DENNIS','LYNN','S',671,7839,null,2750,NULL,23);
INSERT INTO empleados VALUES
    (7507,'BAKER','LESLIE','D',671,7839,null,2200,NULL,14);
INSERT INTO empleados VALUES
    (7521,'WARD','CYNTHIA','D',670,7698,null,1250,500,30);
INSERT INTO empleados VALUES
    (7555,'PETERS','DANIEL','T',670,7505,null,1250,300,13);
INSERT INTO empleados VALUES
    (7557,'SHAW','KAREN','P',670,7505,null,1250,1200,13);
INSERT INTO empleados VALUES
    (7560,'DUNCAN','SARAH','S',670,7506,null,1250,NULL,23);
INSERT INTO empleados VALUES
    (7564,'LANGE','GREGORY','J',670,7506,null,1250,300,23);
INSERT INTO empleados VALUES
    (7566,'JONES','TERRY','M',671,7839,null,2975,NULL,20);
INSERT INTO empleados VALUES
    (7569,'ALBERTS','CHRIS','L',671,7839,null,3000,NULL,12);
INSERT INTO empleados VALUES
    (7600,'PORTER','RAYMOND','Y',670,7505,null,1250,900,13);
INSERT INTO empleados VALUES
    (7609,'LEWIS','RICHARD','M',668,7507,null,1800,NULL,24);
INSERT INTO empleados VALUES
    (7654,'MARTIN','KENNETH','J',670,7698,null,1250,1400,30);
INSERT INTO empleados VALUES
    (7676,'SOMMERS','DENISE','D',668,7507,null,1850,NULL,34);
INSERT INTO empleados VALUES
    (7698,'BLAKE','MARION','S',671,7839,null,2850,NULL,30);
INSERT INTO empleados VALUES
    (7782,'CLARK','CAROL','F',671,7839,null,2450,NULL,10);
INSERT INTO empleados VALUES
    (7788,'SCOTT','DARIO','T',669,7566,null,3000,NULL,20);
INSERT INTO empleados VALUES
    (7789,'WEST','LIVIA','N',670,7506,null,1500,1000,23);
INSERT INTO empleados VALUES
    (7799,'FISHER','MATTHEW','G',669,7569,null,3000,NULL,12);
INSERT INTO empleados VALUES
    (7820,'ROSS','PAUL','S',670,7505,null,1300,800,43);
INSERT INTO empleados VALUES
    (7839,'KING','FRANCIS','A',672,NULL,null,5000,NULL,10);
INSERT INTO empleados VALUES
    (7844,'TURNER','MARY','A',670,7698,null,1500,0,30);
INSERT INTO empleados VALUES
    (7876,'ADAMS','DIANE','G',667,7788,null,1100,NULL,20);
INSERT INTO empleados VALUES
    (7900,'JAMES','FRED','S',667,7698,null,950,NULL,30);
INSERT INTO empleados VALUES
    (7902,'FORD','JENNIFER','D',669,7566,null,3000,NULL,20);
INSERT INTO empleados VALUES
    (7916,'ROBERTS','GRACE','M',669,7569,null,2875,NULL,12);
INSERT INTO empleados VALUES
    (7919,'DOUGLAS','MICHAEL','A',667,7799,null,800,NULL,12);
INSERT INTO empleados VALUES
    (7934,'MILLER','BARBARA','M',667,7782,null,1300,NULL,10);
INSERT INTO empleados VALUES
    (7950,'JENSEN','ALICE','B',667,7505,null,750,NULL,13);
INSERT INTO empleados VALUES
    (7954,'MURRAY','JAMES','T',667,7506,null,750,NULL,23);
	




INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('96711', 'CA', '7844', '5986609', 
  'JOCKSPORTS',
  '100', '5000', 'BELMONT', '415', '345 VIEWRIDGE', 
  'Very friendly people to work with -- sales rep likes to be called Mike.');
 
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('94061', 'CA', '7521', '3681223',
  'TKB SPORT SHOP',
  '101', '10000', 'REDWOOD Ciudad', '415', '490 BOLI RD.', 
  'Rep called 5/8 about change in order - contact shipping.');
                                                              
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('95133', 'CA', '7654', '6443341', 
  'VOLLYRITE',
  '102', '7000', 'BURLINGAME', '415', '9722 HAMILTON', 
  'Company doing heavy promotion beginning 10/89. Prepare for large orders during winter.');
 
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('97544', 'CA', '7521', '6779312',
  'JUST TENNIS',
  '103', '3000', 'BURLINGAME', '415', 'HILLVIEW MALL', 
  'Contact rep about new line of tennis rackets.');
                                                             
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('93301', 'CA', '7499', '9962323',
  'EVERY MOUNTAIN',
  '104', '10000', 'CUPERTINO', '408', '574 SURRY RD.', 
  'CLIENTE with high market share (23%) due to aggressive advertising.');
                                                      
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('91003', 'CA', '7844', '3769966',
  'K + T SPORTS',
  '105', '5000', 'SANTA CLARA', '408', '3476 EL PASEO', 
  'Tends to order large amounts of merchandise at once. Accounting is considering raising their credit limit. Usually pays on time.');
                                                      
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('94301', 'CA', '7521', '3649777',
  'SHAPE UP',
  '106', '6000', 'PALO ALTO', '415', '908 SEQUOIA', 
  'Support intensive. Orders small amounts (< 800) of merchandise at a time.');
 
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('93301', 'CA', '7499', '9674398',
  'WOMENS SPORTS',
  '107', '10000', 'SUNNYVALE', '408', 'VALCO VILLAGE', 
  'First sporting goods store geared exclusively towards women. Unusual promotional style and very willing to take chances towards new Productos!');
            
INSERT INTO CLIENTE
  (CodigoPostal, Estado, Vendedor_ID, Telefono, 
  nombre, 
  CLIENTE_ID,Limite_De_Credito, Ciudad, CodigoDeArea, Direccion, 
  Comentarios)
  VALUES ('55649', 'MN', '7844', '5669123',
  'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER',
  '108', '8000', 'HIBBING', '612', '98 LONE PINE WAY', '');

INSERT INTO CLIENTE VALUES
  ( 201 , 'STADIUM SPORTS', '47 IRVING PL.',
  'NEW YORK', 'NY', '10003',
  '212', '5555335',  7557 ,  10000 ,
  'Large general-purpose sports store with an affluent CLIENTE base.');

INSERT INTO CLIENTE VALUES
  ( 202 , 'HOOPS', '2345 ADAMS AVE.',
  'LEICESTER', 'MA', '01524',
  '508', '5557542',  7820 ,  5000 ,
  'Specializes in basketball equipment.');

INSERT INTO CLIENTE VALUES
  ( 203 , 'REBOUND SPORTS', '2 E. 14TH ST.',
  'NEW YORK', 'NY', '10009',
  '212', '5555989',  7557 ,  10000 ,
  'Follow up on the promotion proposal.');

INSERT INTO CLIENTE VALUES
  ( 204 , 'THE POWER FORWARD', '1 KNOTS LANDING',
  'DALLAS', 'TX', '75248',
  '214', '5550505',  7560 ,  12000 ,
  'Large floorspace.  Prefers maintaining large amounts of inventory on hand.');

INSERT INTO CLIENTE VALUES
  ( 205 , 'POINT GUARD', '20 THURSTON ST.',
  'YONKERS', 'NY', '10956',
  '914', '5554766',  7557 ,  3000 ,
  'Tremendous potential for an exclusive agreement.');

INSERT INTO CLIENTE VALUES
  ( 206 , 'THE COLISEUM', '5678 WILBUR PL.',
  'SCARSDALE', 'NY', '10583',
  '914', '5550217',  7557 ,  6000 ,
  'Contact rep. about new Producto lines.');

INSERT INTO CLIENTE VALUES
  ( 207 , 'FAST BREAK', '1000 HERBERT LN.',
  'CONCORD', 'MA', '01742',
  '508', '5551298',  7820 ,  7000 ,
  'CLIENTE requires written price quotes before making purchase requisitions.');

INSERT INTO CLIENTE VALUES
  ( 208 , 'AL AND BOB''S SPORTS', '260 YORKTOWN CT.',
  'AUSTIN', 'TX', '78731',
  '512', '5557631',  7560 ,  4000 ,
  'Very personal purchasing agents -- Sharon and Scott.');

INSERT INTO CLIENTE VALUES
  ( 211 , 'AT BAT', '234 BEACHEM ST.',
  'BROOKLINE', 'MA', '02146',
  '617', '5557385',  7820 ,  8000 ,
  'Have an open purchase order for $3000.  Ship immediately on request.');

INSERT INTO CLIENTE VALUES
  ( 212 , 'ALL SPORT', '1000 38TH ST.',
  'BROOKLYN', 'NY', '11210',
  '718', '5551739',  7600 ,  6000 ,
  'Pursue a contract -- possible candidate for volume purchasing agreements.');

INSERT INTO CLIENTE VALUES
  ( 213 , 'GOOD SPORT', '400 46TH ST.',
  'SUNNYSIDE', 'NY', '11104',
  '718', '5553771',  7600 ,  5000 ,
  'May be moving to a larger Ubicacion.');

INSERT INTO CLIENTE VALUES
  ( 214 , 'AL''S PRO SHOP', '45 SPRUCE ST.',
  'SPRING', 'TX', '77388',
  '713', '5555172',  7564 ,  8000 ,
  'Target market is serious athletes.');

INSERT INTO CLIENTE VALUES
  ( 215 , 'BOB''S FAMILY SPORTS', '400 E. 23RD',
  'HOUSTON', 'TX', '77026',
  '713', '5558015',  7654 ,  8000 ,
  'Target market is casual and weekend athletes.  Offers a large selection.');

INSERT INTO CLIENTE VALUES
  ( 216 , 'THE ALL AMERICAN', '547 PRENTICE RD.',
  'CHELSEA', 'MA', '02150',
  '617', '5553047',  7820 ,  5000 ,
  'CLIENTE prefers to be called between 10 and 12.');

INSERT INTO CLIENTE VALUES
  ( 217 , 'HIT, THROW, AND RUN', '333 WOOD COURT',
  'GRAPEVINE', 'TX', '76051',
  '817', '5552352',  7564 ,  6000 ,
  'General purpose sports store.');

INSERT INTO CLIENTE VALUES
  ( 218 , 'THE OUTFIELD', '346 GARDEN BLVD.',
  'FLUSHING', 'NY', '11355',
  '718', '5552131',  7820 ,  4000 ,
  'Store does not open until 11am and does not have an answering service.');

INSERT INTO CLIENTE VALUES
  ( 221 , 'WHEELS AND DEALS', '2 MEMORIAL DRIVE',
  'HOUSTON', 'TX', '77007',
  '713', '5554139',  7789 ,  10000 ,
  'Discount bicycle and sporting good store.');

INSERT INTO CLIENTE VALUES
  ( 222 , 'JUST BIKES', '4000 PARKRIDGE BLVD.',
  'DALLAS', 'TX', '75205',
  '214', '5558735',  7789 ,  4000 ,
  'Exclusive bicycle dealer.');

INSERT INTO CLIENTE VALUES
  ( 223 , 'VELO SPORTS', '23 WHITE ST.',
  'MALDEN', 'MA', '02148',
  '617', '5554983',  7820 ,  5000 ,
  'Clerk answers all phone lines.  Ask for Mike.');

INSERT INTO CLIENTE VALUES
  ( 224 , 'JOE''S BIKE SHOP', '4500 FOX COURT',
  'GRAND PRARIE', 'TX', '75051',
  '214', '5559834',  7789 ,  6000 ,
  'Call Joe to make sure last shipment was complete.');

INSERT INTO CLIENTE VALUES
  ( 225 , 'BOB''S SWIM, CYCLE, AND RUN', '300 HORSECREEK CIRCLE',
  'IRVING', 'TX', '75039',
  '214', '5558388',  7789 ,  7000 ,
  'Store catering to triathletes.');

INSERT INTO CLIENTE VALUES
  ( 226 , 'CENTURY SHOP', '8 DAGMAR DR.',
  'HUNTINGTON', 'NY', '11743',
  '516', '5553006',  7555 ,  4000 ,
  'CLIENTE in the midst of a cost-cutting program.');

INSERT INTO CLIENTE VALUES
  ( 227 , 'THE TOUR', '2500 GARDNER RD.',
  'SOMERVILLE', 'MA', '02144',
  '617', '5556673',  7820 ,  5000 ,
  'CLIENTE referred to us by The All American.');

INSERT INTO CLIENTE VALUES
  ( 228 , 'FITNESS FIRST', '5000 85TH ST.',
  'JACKSON HEIGHTS', 'NY', '11372',
  '718', '5558710',  7555 ,  4000 ,
  'Recently acquired another sporting goods store.  Expect higher volume in the future.');



