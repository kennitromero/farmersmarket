CREATE DATABASE  IF NOT EXISTS `fm6` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fm6`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: fm6
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (101,'Frutas'),(102,'Hortalizas'),(103,'Platanos'),(104,'Tuberculos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `idCiudad` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `fk_Ciudades_1_idx` (`idDepartamento`),
  CONSTRAINT `fk_Ciudades_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (5001,'Medellin',5),(5002,'Abejorral',5),(5004,'Abriaqui',5),(5021,'Alejandria',5),(5030,'Amaga',5),(5031,'Amalfi',5),(5034,'Andes',5),(5036,'Angelopolis',5),(5038,'Angostura',5),(5040,'Anori',5),(5042,'Santafe de antioquia',5),(5044,'Anza',5),(5045,'Apartado',5),(5051,'Arboletes',5),(5055,'Argelia',5),(5059,'Armenia',5),(5079,'Barbosa',5),(5086,'Belmira',5),(5088,'Bello',5),(5091,'Betania',5),(5093,'Betulia',5),(5101,'Ciudad bolivar',5),(5107,'Briceño',5),(5113,'Buritica',5),(5120,'Caceres',5),(5125,'Caicedo',5),(5129,'Caldas',5),(5134,'Campamento',5),(5138,'Cañasgordas',5),(5142,'Caracoli',5),(5145,'Caramanta',5),(5147,'Carepa',5),(5148,'El carmen de viboral',5),(5150,'Carolina',5),(5154,'Caucasia',5),(5172,'Chigorodo',5),(5190,'Cisneros',5),(5197,'Cocorna',5),(5206,'Concepcion',5),(5209,'Concordia',5),(5212,'Copacabana',5),(5234,'Dabeiba',5),(5237,'Don matias',5),(5240,'Ebejico',5),(5250,'El bagre',5),(5264,'Entrerrios',5),(5266,'Envigado',5),(5282,'Fredonia',5),(5284,'Frontino',5),(5306,'Giraldo',5),(5308,'Girardota',5),(5310,'Gomez plata',5),(5313,'Granada',5),(5315,'Guadalupe',5),(5318,'Guarne',5),(5321,'Guatape',5),(5347,'Heliconia',5),(5353,'Hispania',5),(5360,'Itagui',5),(5361,'Ituango',5),(5364,'Jardin',5),(5368,'Jerico',5),(5376,'La ceja',5),(5380,'La estrella',5),(5390,'La pintada',5),(5400,'La union',5),(5411,'Liborina',5),(5425,'Maceo',5),(5440,'Marinilla',5),(5467,'Montebello',5),(5475,'Murindo',5),(5480,'Mutata',5),(5483,'Nariño',5),(5490,'Necocli',5),(5495,'Nechi',5),(5501,'Olaya',5),(5541,'Peðol',5),(5543,'Peque',5),(5576,'Pueblorrico',5),(5579,'Puerto berrio',5),(5585,'Puerto nare',5),(5591,'Puerto triunfo',5),(5604,'Remedios',5),(5607,'Retiro',5),(5615,'Rionegro',5),(5628,'Sabanalarga',5),(5631,'Sabaneta',5),(5642,'Salgar',5),(5647,'San andres de cuerquia',5),(5649,'San carlos',5),(5652,'San francisco',5),(5656,'San jeronimo',5),(5658,'San jose de la montaña',5),(5659,'San juan de uraba',5),(5660,'San luis',5),(5664,'San pedro',5),(5665,'San pedro de uraba',5),(5667,'San rafael',5),(5670,'San roque',5),(5674,'San vicente',5),(5679,'Santa barbara',5),(5686,'Santa rosa de osos',5),(5690,'Santo domingo',5),(5697,'El santuario',5),(5736,'Segovia',5),(5756,'Sonson',5),(5761,'Sopetran',5),(5789,'Tamesis',5),(5790,'Taraza',5),(5792,'Tarso',5),(5809,'Titiribi',5),(5819,'Toledo',5),(5837,'Turbo',5),(5842,'Uramita',5),(5847,'Urrao',5),(5854,'Valdivia',5),(5856,'Valparaiso',5),(5858,'Vegachi',5),(5861,'Venecia',5),(5873,'Vigia del fuerte',5),(5885,'Yali',5),(5887,'Yarumal',5),(5890,'Yolombo',5),(5893,'Yondo',5),(5895,'Zaragoza',5),(8001,'Barranquilla',8),(8078,'Baranoa',8),(8137,'Campo de la cruz',8),(8141,'Candelaria',8),(8296,'Galapa',8),(8372,'Juan de acosta',8),(8421,'Luruaco',8),(8433,'Malambo',8),(8436,'Manati',8),(8520,'Palmar de varela',8),(8549,'Piojo',8),(8558,'Polonuevo',8),(8560,'Ponedera',8),(8573,'Puerto colombia',8),(8606,'Repelon',8),(8634,'Sabanagrande',8),(8638,'Sabanalarga',8),(8675,'Santa lucia',8),(8685,'Santo tomas',8),(8758,'Soledad',8),(8770,'Suan',8),(8832,'Tubara',8),(8849,'Usiacuri',8),(11001,'Bogota, d.c.',11),(13001,'Cartagena',13),(13006,'Achi',13),(13030,'Altos del rosario',13),(13042,'Arenal',13),(13052,'Arjona',13),(13062,'Arroyohondo',13),(13074,'Barranco de loba',13),(13140,'Calamar',13),(13160,'Cantagallo',13),(13188,'Cicuco',13),(13212,'Cordoba',13),(13222,'Clemencia',13),(13244,'El carmen de bolivar',13),(13248,'El guamo',13),(13268,'El peñon',13),(13300,'Hatillo de loba',13),(13430,'Magangue',13),(13433,'Mahates',13),(13440,'Margarita',13),(13442,'Maria la baja',13),(13458,'Montecristo',13),(13468,'Mompos',13),(13473,'Morales',13),(13490,'Norosi',13),(13549,'Pinillos',13),(13580,'Regidor',13),(13600,'Rio viejo',13),(13620,'San cristobal',13),(13647,'San estanislao',13),(13650,'San fernando',13),(13654,'San jacinto',13),(13655,'San jacinto del cauca',13),(13657,'San juan nepomuceno',13),(13667,'San martin de loba',13),(13670,'San pablo',13),(13673,'Santa catalina',13),(13683,'Santa rosa',13),(13688,'Santa rosa del sur',13),(13744,'Simiti',13),(13760,'Soplaviento',13),(13780,'Talaigua nuevo',13),(13810,'Tiquisio',13),(13836,'Turbaco',13),(13838,'Turbana',13),(13873,'Villanueva',13),(13894,'Zambrano',13),(15001,'Tunja',15),(15022,'Almeida',15),(15047,'Aquitania',15),(15051,'Arcabuco',15),(15087,'Belen',15),(15090,'Berbeo',15),(15092,'Beteitiva',15),(15097,'Boavita',15),(15104,'Boyaca',15),(15106,'Briceño',15),(15109,'Buenavista',15),(15114,'Busbanza',15),(15131,'Caldas',15),(15135,'Campohermoso',15),(15162,'Cerinza',15),(15172,'Chinavita',15),(15176,'Chiquinquira',15),(15180,'Chiscas',15),(15183,'Chita',15),(15185,'Chitaraque',15),(15187,'Chivata',15),(15189,'Cienega',15),(15204,'Combita',15),(15212,'Coper',15),(15215,'Corrales',15),(15218,'Covarachia',15),(15223,'Cubara',15),(15224,'Cucaita',15),(15226,'Cuitiva',15),(15232,'Chiquiza',15),(15236,'Chivor',15),(15238,'Duitama',15),(15244,'El cocuy',15),(15248,'El espino',15),(15272,'Firavitoba',15),(15276,'Floresta',15),(15293,'Gachantiva',15),(15296,'Gameza',15),(15299,'Garagoa',15),(15317,'Guacamayas',15),(15322,'Guateque',15),(15325,'Guayata',15),(15332,'Gsican',15),(15362,'Iza',15),(15367,'Jenesano',15),(15368,'Jerico',15),(15377,'Labranzagrande',15),(15380,'La capilla',15),(15401,'La victoria',15),(15403,'La uvita',15),(15407,'Villa de leyva',15),(15425,'Macanal',15),(15442,'Maripi',15),(15455,'Miraflores',15),(15464,'Mongua',15),(15466,'Mongui',15),(15469,'Moniquira',15),(15476,'Motavita',15),(15480,'Muzo',15),(15491,'Nobsa',15),(15494,'Nuevo colon',15),(15500,'Oicata',15),(15507,'Otanche',15),(15511,'Pachavita',15),(15514,'Paez',15),(15516,'Paipa',15),(15518,'Pajarito',15),(15522,'Panqueba',15),(15531,'Pauna',15),(15533,'Paya',15),(15537,'Paz de rio',15),(15542,'Pesca',15),(15550,'Pisba',15),(15572,'Puerto boyaca',15),(15580,'Quipama',15),(15599,'Ramiriqui',15),(15600,'Raquira',15),(15621,'Rondon',15),(15632,'Saboya',15),(15638,'Sachica',15),(15646,'Samaca',15),(15660,'San eduardo',15),(15664,'San jose de pare',15),(15667,'San luis de gaceno',15),(15673,'San mateo',15),(15676,'San miguel de sema',15),(15681,'San pablo de borbur',15),(15686,'Santana',15),(15690,'Santa maria',15),(15693,'Santa rosa de viterbo',15),(15696,'Santa sofia',15),(15720,'Sativanorte',15),(15723,'Sativasur',15),(15740,'Siachoque',15),(15753,'Soata',15),(15755,'Socota',15),(15757,'Socha',15),(15759,'Sogamoso',15),(15761,'Somondoco',15),(15762,'Sora',15),(15763,'Sotaquira',15),(15764,'Soraca',15),(15774,'Susacon',15),(15776,'Sutamarchan',15),(15778,'Sutatenza',15),(15790,'Tasco',15),(15798,'Tenza',15),(15804,'Tibana',15),(15806,'Tibasosa',15),(15808,'Tinjaca',15),(15810,'Tipacoque',15),(15814,'Toca',15),(15816,'Togsi',15),(15820,'Topaga',15),(15822,'Tota',15),(15832,'Tunungua',15),(15835,'Turmeque',15),(15837,'Tuta',15),(15839,'Tutaza',15),(15842,'Umbita',15),(15861,'Ventaquemada',15),(15879,'Viracacha',15),(15897,'Zetaquira',15),(17001,'Manizales',17),(17013,'Aguadas',17),(17042,'Anserma',17),(17050,'Aranzazu',17),(17088,'Belalcazar',17),(17174,'Chinchina',17),(17272,'Filadelfia',17),(17380,'La dorada',17),(17388,'La merced',17),(17433,'Manzanares',17),(17442,'Marmato',17),(17444,'Marquetalia',17),(17446,'Marulanda',17),(17486,'Neira',17),(17495,'Norcasia',17),(17513,'Pacora',17),(17524,'Palestina',17),(17541,'Pensilvania',17),(17614,'Riosucio',17),(17616,'Risaralda',17),(17653,'Salamina',17),(17662,'Samana',17),(17665,'San jose',17),(17777,'Supia',17),(17867,'Victoria',17),(17873,'Villamaria',17),(17877,'Viterbo',17),(18001,'Florencia',18),(18029,'Albania',18),(18094,'Belen de los andaquies',18),(18150,'Cartagena del chaira',18),(18205,'Curillo',18),(18247,'El doncello',18),(18256,'El paujil',18),(18410,'La montañita',18),(18460,'Milan',18),(18479,'Morelia',18),(18592,'Puerto rico',18),(18610,'San jose del fragua',18),(18753,'San vicente del caguan',18),(18756,'Solano',18),(18785,'Solita',18),(18860,'Valparaiso',18),(19001,'Popayan',19),(19022,'Almaguer',19),(19050,'Argelia',19),(19075,'Balboa',19),(19100,'Bolivar',19),(19110,'Buenos aires',19),(19130,'Cajibio',19),(19137,'Caldono',19),(19142,'Caloto',19),(19212,'Corinto',19),(19256,'El tambo',19),(19290,'Florencia',19),(19300,'Guachene',19),(19318,'Guapi',19),(19355,'Inza',19),(19364,'Jambalo',19),(19392,'La sierra',19),(19397,'La vega',19),(19418,'Lopez',19),(19450,'Mercaderes',19),(19455,'Miranda',19),(19473,'Morales',19),(19513,'Padilla',19),(19517,'Paez',19),(19532,'Patia',19),(19533,'Piamonte',19),(19548,'Piendamo',19),(19573,'Puerto tejada',19),(19585,'Purace',19),(19622,'Rosas',19),(19693,'San sebastian',19),(19698,'Santander de quilichao',19),(19701,'Santa rosa',19),(19743,'Silvia',19),(19760,'Sotara',19),(19780,'Suarez',19),(19785,'Sucre',19),(19807,'Timbio',19),(19809,'Timbiqui',19),(19821,'Toribio',19),(19824,'Totoro',19),(19845,'Villa rica',19),(20001,'Valledupar',20),(20011,'Aguachica',20),(20013,'Agustin codazzi',20),(20032,'Astrea',20),(20045,'Becerril',20),(20060,'Bosconia',20),(20175,'Chimichagua',20),(20178,'Chiriguana',20),(20228,'Curumani',20),(20238,'El copey',20),(20250,'El paso',20),(20295,'Gamarra',20),(20310,'Gonzalez',20),(20383,'La gloria',20),(20400,'La jagua de ibirico',20),(20443,'Manaure',20),(20517,'Pailitas',20),(20550,'Pelaya',20),(20570,'Pueblo bello',20),(20614,'Rio de oro',20),(20621,'La paz',20),(20710,'San alberto',20),(20750,'San diego',20),(20770,'San martin',20),(20787,'Tamalameque',20),(23001,'Monteria',23),(23068,'Ayapel',23),(23079,'Buenavista',23),(23090,'Canalete',23),(23162,'Cerete',23),(23168,'Chima',23),(23182,'Chinu',23),(23189,'Cienaga de oro',23),(23300,'Cotorra',23),(23350,'La apartada',23),(23417,'Lorica',23),(23419,'Los cordobas',23),(23464,'Momil',23),(23466,'Montelibano',23),(23500,'Moñitos',23),(23555,'Planeta rica',23),(23570,'Pueblo nuevo',23),(23574,'Puerto escondido',23),(23580,'Puerto libertador',23),(23586,'Purisima',23),(23660,'Sahagun',23),(23670,'San andres sotavento',23),(23672,'San antero',23),(23675,'San bernardo del viento',23),(23678,'San carlos',23),(23686,'San pelayo',23),(23807,'Tierralta',23),(23855,'Valencia',23),(25001,'Agua de dios',25),(25019,'Alban',25),(25035,'Anapoima',25),(25040,'Anolaima',25),(25053,'Arbelaez',25),(25086,'Beltran',25),(25095,'Bituima',25),(25099,'Bojaca',25),(25120,'Cabrera',25),(25123,'Cachipay',25),(25126,'Cajica',25),(25148,'Caparrapi',25),(25151,'Caqueza',25),(25154,'Carmen de carupa',25),(25168,'Chaguani',25),(25175,'Chia',25),(25178,'Chipaque',25),(25181,'Choachi',25),(25183,'Choconta',25),(25200,'Cogua',25),(25214,'Cota',25),(25224,'Cucunuba',25),(25245,'El colegio',25),(25258,'El peñon',25),(25260,'El rosal',25),(25269,'Facatativa',25),(25279,'Fomeque',25),(25281,'Fosca',25),(25286,'Funza',25),(25288,'Fuquene',25),(25290,'Fusagasuga',25),(25293,'Gachala',25),(25295,'Gachancipa',25),(25297,'Gacheta',25),(25299,'Gama',25),(25307,'Girardot',25),(25312,'Granada',25),(25317,'Guacheta',25),(25320,'Guaduas',25),(25322,'Guasca',25),(25324,'Guataqui',25),(25326,'Guatavita',25),(25328,'Guayabal de siquima',25),(25335,'Guayabetal',25),(25339,'Gutierrez',25),(25368,'Jerusalen',25),(25372,'Junin',25),(25377,'La calera',25),(25386,'La mesa',25),(25394,'La palma',25),(25398,'La peña',25),(25402,'La vega',25),(25407,'Lenguazaque',25),(25426,'Macheta',25),(25430,'Madrid',25),(25436,'Manta',25),(25438,'Medina',25),(25473,'Mosquera',25),(25483,'Nariño',25),(25486,'Nemocon',25),(25488,'Nilo',25),(25489,'Nimaima',25),(25491,'Nocaima',25),(25506,'Venecia',25),(25513,'Pacho',25),(25518,'Paime',25),(25524,'Pandi',25),(25530,'Paratebueno',25),(25535,'Pasca',25),(25572,'Puerto salgar',25),(25580,'Puli',25),(25592,'Quebradanegra',25),(25594,'Quetame',25),(25596,'Quipile',25),(25599,'Apulo',25),(25612,'Ricaurte',25),(25645,'San antonio del tequendama',25),(25649,'San bernardo',25),(25653,'San cayetano',25),(25658,'San francisco',25),(25662,'San juan de rio seco',25),(25718,'Sasaima',25),(25736,'Sesquile',25),(25740,'Sibate',25),(25743,'Silvania',25),(25745,'Simijaca',25),(25754,'Soacha',25),(25758,'Sopo',25),(25769,'Subachoque',25),(25772,'Suesca',25),(25777,'Supata',25),(25779,'Susa',25),(25781,'Sutatausa',25),(25785,'Tabio',25),(25793,'Tausa',25),(25797,'Tena',25),(25799,'Tenjo',25),(25805,'Tibacuy',25),(25807,'Tibirita',25),(25815,'Tocaima',25),(25817,'Tocancipa',25),(25823,'Topaipi',25),(25839,'Ubala',25),(25841,'Ubaque',25),(25843,'Villa de san diego de ubate',25),(25845,'Une',25),(25851,'Utica',25),(25862,'Vergara',25),(25867,'Viani',25),(25871,'Villagomez',25),(25873,'Villapinzon',25),(25875,'Villeta',25),(25878,'Viota',25),(25885,'Yacopi',25),(25898,'Zipacon',25),(25899,'Zipaquira',25),(27001,'Quibdo',27),(27006,'Acandi',27),(27025,'Alto baudo',27),(27050,'Atrato',27),(27073,'Bagado',27),(27075,'Bahia solano',27),(27077,'Bajo baudo',27),(27099,'Bojaya',27),(27135,'El canton del san pablo',27),(27150,'Carmen del darien',27),(27160,'Certegui',27),(27205,'Condoto',27),(27245,'El carmen de atrato',27),(27250,'El litoral del san juan',27),(27361,'Istmina',27),(27372,'Jurado',27),(27413,'Lloro',27),(27425,'Medio atrato',27),(27430,'Medio baudo',27),(27450,'Medio san juan',27),(27491,'Novita',27),(27495,'Nuqui',27),(27580,'Rio iro',27),(27600,'Rio quito',27),(27615,'Riosucio',27),(27660,'San jose del palmar',27),(27745,'Sipi',27),(27787,'Tado',27),(27800,'Unguia',27),(27810,'Union panamericana',27),(41001,'Neiva',41),(41006,'Acevedo',41),(41013,'Agrado',41),(41016,'Aipe',41),(41020,'Algeciras',41),(41026,'Altamira',41),(41078,'Baraya',41),(41132,'Campoalegre',41),(41206,'Colombia',41),(41244,'Elias',41),(41298,'Garzon',41),(41306,'Gigante',41),(41319,'Guadalupe',41),(41349,'Hobo',41),(41357,'Iquira',41),(41359,'Isnos',41),(41378,'La argentina',41),(41396,'La plata',41),(41483,'Nataga',41),(41503,'Oporapa',41),(41518,'Paicol',41),(41524,'Palermo',41),(41530,'Palestina',41),(41548,'Pital',41),(41551,'Pitalito',41),(41615,'Rivera',41),(41660,'Saladoblanco',41),(41668,'San agustin',41),(41676,'Santa maria',41),(41770,'Suaza',41),(41791,'Tarqui',41),(41797,'Tesalia',41),(41799,'Tello',41),(41801,'Teruel',41),(41807,'Timana',41),(41872,'Villavieja',41),(41885,'Yaguara',41),(44001,'Riohacha',44),(44035,'Albania',44),(44078,'Barrancas',44),(44090,'Dibulla',44),(44098,'Distraccion',44),(44110,'El molino',44),(44279,'Fonseca',44),(44378,'Hatonuevo',44),(44420,'La jagua del pilar',44),(44430,'Maicao',44),(44560,'Manaure',44),(44650,'San juan del cesar',44),(44847,'Uribia',44),(44855,'Urumita',44),(44874,'Villanueva',44),(47001,'Santa marta',47),(47030,'Algarrobo',47),(47053,'Aracataca',47),(47058,'Ariguani',47),(47161,'Cerro san antonio',47),(47170,'Chibolo',47),(47189,'Cienaga',47),(47205,'Concordia',47),(47245,'El banco',47),(47258,'El piñon',47),(47268,'El reten',47),(47288,'Fundacion',47),(47318,'Guamal',47),(47460,'Nueva granada',47),(47541,'Pedraza',47),(47545,'Pijiño del carmen',47),(47551,'Pivijay',47),(47555,'Plato',47),(47570,'Puebloviejo',47),(47605,'Remolino',47),(47660,'Sabanas de san angel',47),(47675,'Salamina',47),(47692,'San sebastian de buenavista',47),(47703,'San zenon',47),(47707,'Santa ana',47),(47720,'Santa barbara de pinto',47),(47745,'Sitionuevo',47),(47798,'Tenerife',47),(47960,'Zapayan',47),(47980,'Zona bananera',47),(50001,'Villavicencio',50),(50006,'Acacias',50),(50110,'Barranca de upia',50),(50124,'Cabuyaro',50),(50150,'Castilla la nueva',50),(50223,'Cubarral',50),(50226,'Cumaral',50),(50245,'El calvario',50),(50251,'El castillo',50),(50270,'El dorado',50),(50287,'Fuente de oro',50),(50313,'Granada',50),(50318,'Guamal',50),(50325,'Mapiripan',50),(50330,'Mesetas',50),(50350,'La macarena',50),(50370,'Uribe',50),(50400,'Lejanias',50),(50450,'Puerto concordia',50),(50568,'Puerto gaitan',50),(50573,'Puerto lopez',50),(50577,'Puerto lleras',50),(50590,'Puerto rico',50),(50606,'Restrepo',50),(50680,'San carlos de guaroa',50),(50683,'San juan de arama',50),(50686,'San juanito',50),(50689,'San martin',50),(50711,'Vistahermosa',50),(52001,'Pasto',52),(52019,'Alban',52),(52022,'Aldana',52),(52036,'Ancuya',52),(52051,'Arboleda',52),(52079,'Barbacoas',52),(52083,'Belen',52),(52110,'Buesaco',52),(52203,'Colon',52),(52207,'Consaca',52),(52210,'Contadero',52),(52215,'Cordoba',52),(52224,'Cuaspud',52),(52227,'Cumbal',52),(52233,'Cumbitara',52),(52240,'Chachagsi',52),(52250,'El charco',52),(52254,'El peñol',52),(52256,'El rosario',52),(52258,'El tablon de gomez',52),(52260,'El tambo',52),(52287,'Funes',52),(52317,'Guachucal',52),(52320,'Guaitarilla',52),(52323,'Gualmatan',52),(52352,'Iles',52),(52354,'Imues',52),(52356,'Ipiales',52),(52378,'La cruz',52),(52381,'La florida',52),(52385,'La llanada',52),(52390,'La tola',52),(52399,'La union',52),(52405,'Leiva',52),(52411,'Linares',52),(52418,'Los andes',52),(52427,'Magsi',52),(52435,'Mallama',52),(52473,'Mosquera',52),(52480,'Nariño',52),(52490,'Olaya herrera',52),(52506,'Ospina',52),(52520,'Francisco pizarro',52),(52540,'Policarpa',52),(52560,'Potosi',52),(52565,'Providencia',52),(52573,'Puerres',52),(52585,'Pupiales',52),(52612,'Ricaurte',52),(52621,'Roberto payan',52),(52678,'Samaniego',52),(52683,'Sandona',52),(52685,'San bernardo',52),(52687,'San lorenzo',52),(52693,'San pablo',52),(52694,'San pedro de cartago',52),(52696,'Santa barbara',52),(52699,'Santacruz',52),(52720,'Sapuyes',52),(52786,'Taminango',52),(52788,'Tangua',52),(52835,'San andres de tumaco',52),(52838,'Tuquerres',52),(52885,'Yacuanquer',52),(54001,'Cucuta',54),(54003,'Abrego',54),(54051,'Arboledas',54),(54099,'Bochalema',54),(54109,'Bucarasica',54),(54125,'Cacota',54),(54128,'Cachira',54),(54172,'Chinacota',54),(54174,'Chitaga',54),(54206,'Convencion',54),(54223,'Cucutilla',54),(54239,'Durania',54),(54245,'El carmen',54),(54250,'El tarra',54),(54261,'El zulia',54),(54313,'Gramalote',54),(54344,'Hacari',54),(54347,'Herran',54),(54377,'Labateca',54),(54385,'La esperanza',54),(54398,'La playa',54),(54405,'Los patios',54),(54418,'Lourdes',54),(54480,'Mutiscua',54),(54498,'Ocaña',54),(54518,'Pamplona',54),(54520,'Pamplonita',54),(54553,'Puerto santander',54),(54599,'Ragonvalia',54),(54660,'Salazar',54),(54670,'San calixto',54),(54673,'San cayetano',54),(54680,'Santiago',54),(54720,'Sardinata',54),(54743,'Silos',54),(54800,'Teorama',54),(54810,'Tibu',54),(54820,'Toledo',54),(54871,'Villa caro',54),(54874,'Villa del rosario',54),(63001,'Armenia',63),(63111,'Buenavista',63),(63130,'Calarca',63),(63190,'Circasia',63),(63212,'Cordoba',63),(63272,'Filandia',63),(63302,'Genova',63),(63401,'La tebaida',63),(63470,'Montenegro',63),(63548,'Pijao',63),(63594,'Quimbaya',63),(63690,'Salento',63),(66001,'Pereira',66),(66045,'Apia',66),(66075,'Balboa',66),(66088,'Belen de umbria',66),(66170,'Dosquebradas',66),(66318,'Guatica',66),(66383,'La celia',66),(66400,'La virginia',66),(66440,'Marsella',66),(66456,'Mistrato',66),(66572,'Pueblo rico',66),(66594,'Quinchia',66),(66682,'Santa rosa de cabal',66),(66687,'Santuario',66),(68001,'Bucaramanga',68),(68013,'Aguada',68),(68020,'Albania',68),(68051,'Aratoca',68),(68077,'Barbosa',68),(68079,'Barichara',68),(68081,'Barrancabermeja',68),(68092,'Betulia',68),(68101,'Bolivar',68),(68121,'Cabrera',68),(68132,'California',68),(68147,'Capitanejo',68),(68152,'Carcasi',68),(68160,'Cepita',68),(68162,'Cerrito',68),(68167,'Charala',68),(68169,'Charta',68),(68176,'Chima',68),(68179,'Chipata',68),(68190,'Cimitarra',68),(68207,'Concepcion',68),(68209,'Confines',68),(68211,'Contratacion',68),(68217,'Coromoro',68),(68229,'Curiti',68),(68235,'El carmen de chucuri',68),(68245,'El guacamayo',68),(68250,'El peñon',68),(68255,'El playon',68),(68264,'Encino',68),(68266,'Enciso',68),(68271,'Florian',68),(68276,'Floridablanca',68),(68296,'Galan',68),(68298,'Gambita',68),(68307,'Giron',68),(68318,'Guaca',68),(68320,'Guadalupe',68),(68322,'Guapota',68),(68324,'Guavata',68),(68327,'Gsepsa',68),(68344,'Hato',68),(68368,'Jesus maria',68),(68370,'Jordan',68),(68377,'La belleza',68),(68385,'Landazuri',68),(68397,'La paz',68),(68406,'Lebrija',68),(68418,'Los santos',68),(68425,'Macaravita',68),(68432,'Malaga',68),(68444,'Matanza',68),(68464,'Mogotes',68),(68468,'Molagavita',68),(68498,'Ocamonte',68),(68500,'Oiba',68),(68502,'Onzaga',68),(68522,'Palmar',68),(68524,'Palmas del socorro',68),(68533,'Paramo',68),(68547,'Piedecuesta',68),(68549,'Pinchote',68),(68572,'Puente nacional',68),(68573,'Puerto parra',68),(68575,'Puerto wilches',68),(68615,'Rionegro',68),(68655,'Sabana de torres',68),(68669,'San andres',68),(68673,'San benito',68),(68679,'San gil',68),(68682,'San joaquin',68),(68684,'San jose de miranda',68),(68686,'San miguel',68),(68689,'San vicente de chucuri',68),(68705,'Santa barbara',68),(68720,'Santa helena del opon',68),(68745,'Simacota',68),(68755,'Socorro',68),(68770,'Suaita',68),(68773,'Sucre',68),(68780,'Surata',68),(68820,'Tona',68),(68855,'Valle de san jose',68),(68861,'Velez',68),(68867,'Vetas',68),(68872,'Villanueva',68),(68895,'Zapatoca',68),(70001,'Sincelejo',70),(70110,'Buenavista',70),(70124,'Caimito',70),(70204,'Coloso',70),(70215,'Corozal',70),(70221,'Coveñas',70),(70230,'Chalan',70),(70233,'El roble',70),(70235,'Galeras',70),(70265,'Guaranda',70),(70400,'La union',70),(70418,'Los palmitos',70),(70429,'Majagual',70),(70473,'Morroa',70),(70508,'Ovejas',70),(70523,'Palmito',70),(70670,'Sampues',70),(70678,'San benito abad',70),(70702,'San juan de betulia',70),(70708,'San marcos',70),(70713,'San onofre',70),(70717,'San pedro',70),(70742,'San luis de since',70),(70771,'Sucre',70),(70820,'Santiago de tolu',70),(70823,'Tolu viejo',70),(73001,'Ibague',73),(73024,'Alpujarra',73),(73026,'Alvarado',73),(73030,'Ambalema',73),(73043,'Anzoategui',73),(73055,'Armero',73),(73067,'Ataco',73),(73124,'Cajamarca',73),(73148,'Carmen de apicala',73),(73152,'Casabianca',73),(73168,'Chaparral',73),(73200,'Coello',73),(73217,'Coyaima',73),(73226,'Cunday',73),(73236,'Dolores',73),(73268,'Espinal',73),(73270,'Falan',73),(73275,'Flandes',73),(73283,'Fresno',73),(73319,'Guamo',73),(73347,'Herveo',73),(73349,'Honda',73),(73352,'Icononzo',73),(73408,'Lerida',73),(73411,'Libano',73),(73443,'Mariquita',73),(73449,'Melgar',73),(73461,'Murillo',73),(73483,'Natagaima',73),(73504,'Ortega',73),(73520,'Palocabildo',73),(73547,'Piedras',73),(73555,'Planadas',73),(73563,'Prado',73),(73585,'Purificacion',73),(73616,'Rioblanco',73),(73622,'Roncesvalles',73),(73624,'Rovira',73),(73671,'Saldaña',73),(73675,'San antonio',73),(73678,'San luis',73),(73686,'Santa isabel',73),(73770,'Suarez',73),(73854,'Valle de san juan',73),(73861,'Venadillo',73),(73870,'Villahermosa',73),(73873,'Villarrica',73),(76001,'Cali',76),(76020,'Alcala',76),(76036,'Andalucia',76),(76041,'Ansermanuevo',76),(76054,'Argelia',76),(76100,'Bolivar',76),(76109,'Buenaventura',76),(76111,'Guadalajara de buga',76),(76113,'Bugalagrande',76),(76122,'Caicedonia',76),(76126,'Calima',76),(76130,'Candelaria',76),(76147,'Cartago',76),(76233,'Dagua',76),(76243,'El aguila',76),(76246,'El cairo',76),(76248,'El cerrito',76),(76250,'El dovio',76),(76275,'Florida',76),(76306,'Ginebra',76),(76318,'Guacari',76),(76364,'Jamundi',76),(76377,'La cumbre',76),(76400,'La union',76),(76403,'La victoria',76),(76497,'Obando',76),(76520,'Palmira',76),(76563,'Pradera',76),(76606,'Restrepo',76),(76616,'Riofrio',76),(76622,'Roldanillo',76),(76670,'San pedro',76),(76736,'Sevilla',76),(76823,'Toro',76),(76828,'Trujillo',76),(76834,'Tulua',76),(76845,'Ulloa',76),(76863,'Versalles',76),(76869,'Vijes',76),(76890,'Yotoco',76),(76892,'Yumbo',76),(76895,'Zarzal',76),(81001,'Arauca',81),(81065,'Arauquita',81),(81220,'Cravo norte',81),(81300,'Fortul',81),(81591,'Puerto rondon',81),(81736,'Saravena',81),(81794,'Tame',81),(85001,'Yopal',85),(85010,'Aguazul',85),(85015,'Chameza',85),(85125,'Hato corozal',85),(85136,'La salina',85),(85139,'Mani',85),(85162,'Monterrey',85),(85225,'Nunchia',85),(85230,'Orocue',85),(85250,'Paz de ariporo',85),(85263,'Pore',85),(85279,'Recetor',85),(85300,'Sabanalarga',85),(85315,'Sacama',85),(85325,'San luis de palenque',85),(85400,'Tamara',85),(85410,'Tauramena',85),(85430,'Trinidad',85),(85440,'Villanueva',85),(86001,'Mocoa',86),(86219,'Colon',86),(86320,'Orito',86),(86568,'Puerto asis',86),(86569,'Puerto caicedo',86),(86571,'Puerto guzman',86),(86573,'Leguizamo',86),(86749,'Sibundoy',86),(86755,'San francisco',86),(86757,'San miguel',86),(86760,'Santiago',86),(86865,'Valle del guamuez',86),(86885,'Villagarzon',86),(88001,'San andres',88),(88564,'Providencia',88),(91001,'Leticia',91),(91263,'El encanto',91),(91405,'La chorrera',91),(91407,'La pedrera',91),(91430,'La victoria',91),(91460,'Miriti - parana',91),(91530,'Puerto alegria',91),(91536,'Puerto arica',91),(91540,'Puerto nariño',91),(91669,'Puerto santander',91),(91798,'Tarapaca',91),(94001,'Inirida',94),(94343,'Barranco minas',94),(94663,'Mapiripana',94),(94883,'San felipe',94),(94884,'Puerto colombia',94),(94885,'La guadalupe',94),(94886,'Cacahual',94),(94887,'Pana pana',94),(94888,'Morichal',94),(95001,'San jose del guaviare',95),(95015,'Calamar',95),(95025,'El retorno',95),(95200,'Miraflores',95),(97001,'Mitu',97),(97161,'Caruru',97),(97511,'Pacoa',97),(97666,'Taraira',97),(97777,'Papunaua',97),(97889,'Yavarate',97),(99001,'Puerto carreño',99),(99524,'La primavera',99),(99624,'Santa rosalia',99),(99773,'Cumaribo',99);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (5,'Antioquia'),(8,'Atlantico'),(11,'Bogota'),(13,'Bolivar'),(15,'Boyaca'),(17,'Caldas'),(18,'Caqueta'),(19,'Cauca'),(20,'Cesar'),(23,'Cordoba'),(25,'Cundinamarca'),(27,'Choco'),(41,'Huila'),(44,'La guajira'),(47,'Magdalena'),(50,'Meta'),(52,'Nariño'),(54,'N. De santander'),(63,'Quindio'),(66,'Risaralda'),(68,'Santander'),(70,'Sucre'),(73,'Tolima'),(76,'Valle del cauca'),(81,'Arauca'),(85,'Casanare'),(86,'Putumayo'),(88,'San andres'),(91,'Amazonas'),(94,'Guainia'),(95,'Guaviare'),(97,'Vaupes'),(99,'Vichada');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `idOferta` int(11) NOT NULL,
  `Cantidad` float NOT NULL,
  KEY `fk_inventario_1_idx` (`idOferta`),
  CONSTRAINT `fk_inventario_1` FOREIGN KEY (`idOferta`) REFERENCES `oferta` (`idOferta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedades`
--

DROP TABLE IF EXISTS `novedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novedades` (
  `idNovedad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  `Detalle` float NOT NULL,
  PRIMARY KEY (`idNovedad`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novedades`
--

LOCK TABLES `novedades` WRITE;
/*!40000 ALTER TABLE `novedades` DISABLE KEYS */;
INSERT INTO `novedades` VALUES (301,'Sin novedad',1),(302,'Pague 1 y lleve 2',0.5),(303,'Pague 2 y lleve 3',0.67),(304,'Pague 1 y lleve 3',0.33),(305,'30% de descuento',0.3),(306,'15% de descuento',0.15),(307,'25% de descuento',0.25);
/*!40000 ALTER TABLE `novedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oferta` (
  `idOferta` int(11) NOT NULL AUTO_INCREMENT,
  `idPresentacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idProductor` bigint(20) NOT NULL,
  `PrecioVenta` float NOT NULL,
  `idNovedad` int(11) NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`idOferta`),
  KEY `fk_productos1_idx` (`idProducto`),
  KEY `fk_DetalleProducto_4_idx` (`idNovedad`),
  KEY `fk_DetalleProducto_1_idx` (`idProductor`),
  KEY `fk_Oferta_3` (`idPresentacion`),
  CONSTRAINT `fk_Oferta_1` FOREIGN KEY (`idProductor`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Oferta_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Oferta_3` FOREIGN KEY (`idPresentacion`) REFERENCES `presentacion` (`idPresentacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Oferta_4` FOREIGN KEY (`idNovedad`) REFERENCES `novedades` (`idNovedad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (1051,1021,101022,45331275,5000,301,'2015-02-28','2015-05-30',1),(1052,1061,104003,93476236,8000,304,'2015-01-21','2015-04-23',1),(1053,1063,101022,45331275,6000,301,'2015-04-25','2015-07-12',1),(1054,1020,104003,11558866,15000,305,'2014-01-12','2015-03-20',1),(1057,1002,102013,12387634,1000,302,'2014-02-28','2015-11-05',1);
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idOferta` int(11) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `FechaPedido` date NOT NULL,
  `Cantidad` float NOT NULL,
  PRIMARY KEY (`idPedido`,`idOferta`),
  KEY `fk_Pedidos_2_idx` (`idCliente`),
  KEY `fk_Pedidos_1_idx` (`idOferta`),
  CONSTRAINT `fk_Pedidos_1` FOREIGN KEY (`idOferta`) REFERENCES `oferta` (`idOferta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Pedidos_2` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1051,1073247453,'2015-03-08',2),(2,1054,1073247453,'2015-03-08',52),(3,1053,1073247453,'2015-03-08',20),(4,1054,1073247453,'2015-03-08',13),(5,1054,1073247453,'2015-03-08',6),(6,1051,12387634,'2015-03-08',48),(7,1054,1073247453,'2015-03-10',5);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `idPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Url` varchar(200) NOT NULL,
  `Icon` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`idPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisosrol`
--

DROP TABLE IF EXISTS `permisosrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisosrol` (
  `idPermiso` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`idPermiso`,`idRol`),
  KEY `fk_PermisosRol_2_idx` (`idRol`),
  CONSTRAINT `fk_PermisosRol_1` FOREIGN KEY (`idPermiso`) REFERENCES `permisos` (`idPermiso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PermisosRol_2` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisosrol`
--

LOCK TABLES `permisosrol` WRITE;
/*!40000 ALTER TABLE `permisosrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisosrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentacion` (
  `idPresentacion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  `Conversion` float NOT NULL,
  PRIMARY KEY (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1000,'Kilo',1),(1001,'Atado',9),(1002,'Atado',6),(1010,'Bolsa',28),(1011,'Bolsa',10),(1020,'Bulto',72),(1021,'Bulto',60),(1022,'Bulto',50),(1030,'Caja',20),(1031,'Caja',18),(1032,'Caja',14),(1033,'Caja',12.5),(1034,'Caja',11),(1035,'Caja',10),(1036,'Caja',7),(1040,'Canastilla',25),(1041,'Canastilla',22),(1042,'Canastilla',20),(1050,'Docena',20),(1051,'Docena',12),(1052,'Docena',11),(1053,'Docena',9),(1054,'Docena',8),(1055,'Docena',5),(1060,'Guacal',35),(1061,'Guacal',30),(1062,'Guacal',25),(1063,'Guacal',20),(1070,'Rueda',50);
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) NOT NULL,
  `Unidad` varchar(10) NOT NULL DEFAULT 'KILO',
  `idCategoria` int(11) NOT NULL,
  `PrecioCompra` float NOT NULL,
  `Imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Productos_1_idx` (`idCategoria`),
  CONSTRAINT `fk_Productos_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104013 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (101001,'Aguacate','Kilo',101,2500,''),(101002,'Banano Criollo','Kilo',101,1033,''),(101003,'Banano Uraba','Kilo',101,1100,''),(101004,'Breva','Kilo',101,6000,''),(101005,'Coco','Kilo',101,2200,''),(101006,'Curuba Boyacence','Kilo',101,1364,''),(101007,'Curuba San Bernardo','Kilo',101,1400,''),(101008,'Durazno Importado','Kilo',101,4500,''),(101009,'Feijoa','Kilo',101,6000,''),(101010,'Fresa','Kilo',101,4400,''),(101011,'Granadilla','Kilo',101,3214,''),(101012,'Guanabana','Kilo',101,3500,''),(101013,'Guayaba','Kilo',101,1500,''),(101014,'Limon Comun','Kilo',101,1528,''),(101015,'Limon Tahiti','Kilo',101,2222,''),(101016,'Lulo','Kilo',101,2600,''),(101017,'Mandarina Arrayana','Kilo',101,2250,''),(101018,'Mandarina Oneco','Kilo',101,2100,''),(101019,'Mango Chancleto','Kilo',101,1818,''),(101020,'Mango Reina','Kilo',101,1818,''),(101021,'Mango Tommy','Kilo',101,3636,''),(101022,'Manzana Nacional','Kilo',101,3000,''),(101023,'Manzana Roja Importada','Kilo',101,3889,''),(101024,'Manzana Verde Importada','Kilo',101,3611,''),(101025,'Maracuya','Kilo',101,3000,''),(101026,'Melon','Kilo',101,1800,''),(101027,'Mora De Castilla','Kilo',101,2143,''),(101028,'Naranja Armenia','Kilo',101,1000,''),(101029,'Naranja Grey','Kilo',101,900,''),(101030,'Naranja Ombligona','Kilo',101,1100,''),(101031,'Naranja Valencia','Kilo',101,1100,''),(101032,'Papaya Hawiana','Kilo',101,1500,''),(101033,'Papaya Maradol','Kilo',101,1500,''),(101034,'Papaya Melona','Kilo',101,1000,''),(101035,'Papaya Redonda','Kilo',101,1150,''),(101036,'Patilla','Kilo',101,650,''),(101037,'Pina','Kilo',101,714,''),(101038,'Pitahaya','Kilo',101,4000,''),(101039,'Tomate De Arbol','Kilo',101,1520,''),(101040,'Uva Champa','Kilo',101,2800,''),(101041,'Uva Negra','Kilo',101,2800,''),(101042,'Uva Roja','Kilo',101,3600,''),(102001,'Acelga','Kilo',102,500,''),(102002,'Ahuyama','Kilo',102,800,''),(102003,'Ajo Rosado','Kilo',102,2444,''),(102004,'Alcachofa','Kilo',102,2400,''),(102005,'Apio','Kilo',102,778,''),(102006,'Arveja Verde','Kilo',102,2400,''),(102007,'Berenjena','Kilo',102,2300,''),(102008,'Brocoli','Kilo',102,833,''),(102009,'Calabacin','Kilo',102,1500,''),(102010,'Calabaza','Kilo',102,400,''),(102011,'Cebolla Cabezona Blanca','Kilo',102,1000,''),(102012,'Cebolla Cabezona Roja','Kilo',102,1500,''),(102013,'Cebolla Larga','Kilo',102,1200,''),(102014,'Cilantro','Kilo',102,778,''),(102015,'Coliflor','Kilo',102,889,''),(102016,'Espinaca','Kilo',102,667,''),(102017,'Frijol Verde Andino','Kilo',102,2200,''),(102018,'Frijol Verde Bolo','Kilo',102,2400,''),(102019,'Haba Verde Sabanera','Kilo',102,1200,''),(102020,'Habichuela','Kilo',102,2000,''),(102021,'Lechuga','Kilo',102,636,''),(102022,'Mazorca','Kilo',102,1100,''),(102023,'Pepino Cohombro','Kilo',102,1200,''),(102024,'Pepino Comun','Kilo',102,1200,''),(102025,'Pimenton','Kilo',102,2600,''),(102026,'Rabano Rojo','Kilo',102,4444,''),(102027,'Remolacha','Kilo',102,400,''),(102028,'Repollo','Kilo',102,1200,''),(102029,'Tomate Chonto','Kilo',102,1000,''),(102030,'Tomate Larga Vida','Kilo',102,818,''),(102031,'Tomate Milano','Kilo',102,1273,''),(102032,'Zanahoria','Kilo',102,1700,''),(103001,'Platano Colicero','Kilo',103,1000,''),(103002,'Platano Harton','Kilo',103,1636,''),(104001,'Arracacha','Kilo',104,800,''),(104002,'Papa Criolla Lavada','Kilo',104,1400,''),(104003,'Papa Criolla Sucia','Kilo',104,1200,''),(104004,'Papa Pastusa','Kilo',104,900,''),(104005,'Papa R12 Industrial','Kilo',104,800,''),(104006,'Papa R12 Negra','Kilo',104,700,''),(104007,'Papa R12 Roja','Kilo',104,600,''),(104008,'Papa Sabanera','Kilo',104,1200,''),(104009,'Papa Suprema','Kilo',104,640,''),(104010,'Papa Tocarre','Kilo',104,1000,''),(104011,'Yuca Armenia','Kilo',104,821,''),(104012,'Yuca Llanera','Kilo',104,893,'');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(145) NOT NULL,
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Usuario','El rol más básico dentro del sistema',1),(2,'Cliente','Cliente del sistema',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolusuario`
--

DROP TABLE IF EXISTS `rolusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolusuario` (
  `idRol` int(11) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  PRIMARY KEY (`idRol`,`idUsuario`),
  KEY `fk_RolUsuario_2_idx` (`idUsuario`),
  CONSTRAINT `fk_RolUsuario_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RolUsuario_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolusuario`
--

LOCK TABLES `rolusuario` WRITE;
/*!40000 ALTER TABLE `rolusuario` DISABLE KEYS */;
INSERT INTO `rolusuario` VALUES (1,1017324734),(2,1073247453),(1,1102867002),(1,1923772888);
/*!40000 ALTER TABLE `rolusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `idUsuario` bigint(20) NOT NULL,
  `Numero` varchar(15) NOT NULL,
  KEY `fk_Telefonos_1_idx` (`idUsuario`),
  CONSTRAINT `fk_Telefonos_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` bigint(20) NOT NULL,
  `Nombres` varchar(55) NOT NULL,
  `Apellidos` varchar(55) NOT NULL,
  `Clave` blob NOT NULL,
  `Correo` varchar(105) NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `idCiudad` int(11) NOT NULL,
  `FechaSistema` date NOT NULL,
  `Imagen` varchar(100) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuarios_1_idx` (`idCiudad`),
  CONSTRAINT `fk_Usuarios_1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (11558866,'Marcelo','Ordui','23456','marce@hotmail.com','1994-01-21','La salle',50001,'2015-02-15','',1),(12341235,'Felipe','Osorio','63422','fe@hotmail.com','1998-01-11','Juan',25799,'2015-01-14','',1),(12387634,'Gloria','Duque','345654','glo@hotmail.com','1995-03-31','Bogota',25799,'2015-02-15','',1),(12456789,'Julin','Casto','1234','julca@hotmail.com','1994-01-01','Aguas',5129,'2012-01-12','',1),(23456655,'Cristina','Perilla','93453','cripi@hotmail.com','1997-07-21','Maranta',5467,'0000-00-00','2015-02-04',1),(45331275,'Laura','torres','11765','lauto@hotmail.com','1994-05-31','Girardot',5129,'2012-02-01','',1),(55667897,'Cristian','Obiedo','42246','kris@hotmail.com','1995-05-11','Poblado',5467,'0000-00-00','2015-03-04',1),(66123428,'Carlos','Parra','98467','car@hotmail.com','1995-11-06','El codito',5467,'0000-00-00','2015-06-27',1),(93476236,'Geraldine','Mendoza','456234','Gel@hotmail.com','1996-06-30','La frontera',5467,'2015-01-28','',1),(1017324734,'sebastian235345','fjkanfn2352','232352','asfasg@asf.com',NULL,'235235236',70001,'2015-03-06',NULL,1),(1073247453,'Sebastianc','Cespedes','Guitarra97','sebasco9703@hotmail.com',NULL,'Carrera 19 Bis 8 - 19',11001,'2015-03-08',NULL,1),(1102867002,'Kennit','Romero','mark42','kdruz@misena.edu.co',NULL,'Carrera 19',70001,'2015-03-06',NULL,1),(1923772888,'David','Amador MontaÃ±o','mark42hill','solucionaticos@gmail.com',NULL,'Carrera 19 Bis 8 - 19',11001,'2015-03-07',NULL,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-11  2:16:32
