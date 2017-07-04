-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbconta
-- ------------------------------------------------------
-- Server version	5.6.36-log

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
-- Table structure for table `aportes`
--

DROP TABLE IF EXISTS `aportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aportes` (
  `idaportes` int(11) NOT NULL AUTO_INCREMENT,
  `essalud` varchar(100) NOT NULL,
  `senati` varchar(100) NOT NULL,
  `idcontrato` int(11) DEFAULT NULL,
  PRIMARY KEY (`idaportes`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aportes`


--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `fechaingreso` date NOT NULL,
  `fechasalida` date NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `asigfamiliar` varchar(100) NOT NULL,
  `dlaborales` varchar(100) NOT NULL,
  `hlaborales` varchar(100) NOT NULL,
  PRIMARY KEY (`idcontrato`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

--
-- Table structure for table `descuentos`
--

DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descuentos` (
  `iddescuento` int(11) NOT NULL AUTO_INCREMENT,
  `afp` varchar(100) NOT NULL,
  `onp` varchar(100) NOT NULL,
  `quintacategoria` varchar(100) NOT NULL,
  `otros` varchar(100) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`iddescuento`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentos`
--

--
-- Table structure for table `det_privilegio`
--

DROP TABLE IF EXISTS `det_privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `det_privilegio` (
  `iddetpri` int(11) NOT NULL AUTO_INCREMENT,
  `idprivilegio` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`iddetpri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_privilegio`
--

LOCK TABLES `det_privilegio` WRITE;
/*!40000 ALTER TABLE `det_privilegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detusuario`
--

DROP TABLE IF EXISTS `detusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detusuario` (
  `idrol` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detusuario`
--

LOCK TABLES `detusuario` WRITE;
/*!40000 ALTER TABLE `detusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `detusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
   ruc     varchar(40) NOT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--


--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` int(10) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--


--
-- Table structure for table `privilegio`
--

DROP TABLE IF EXISTS `privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegio` (
  `idprivilegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idprivilegio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegio`
--

LOCK TABLES `privilegio` WRITE;
/*!40000 ALTER TABLE `privilegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remuneraciones`
--

DROP TABLE IF EXISTS `remuneraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remuneraciones` (
  `idremuneracion` int(11) NOT NULL AUTO_INCREMENT,
  `idsueldo` int(11) NOT NULL,
  `hextras` varchar(100) NOT NULL,
  `comisiones` varchar(100) NOT NULL,
  `bono` varchar(100) NOT NULL,
  PRIMARY KEY (`idremuneracion`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remuneraciones`
--

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMINISTRADOR DEL SISTEMA');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo`
--

DROP TABLE IF EXISTS `sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sueldo` (
  `idsueldo` int(11) NOT NULL AUTO_INCREMENT,
  `sueldobasico` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`idsueldo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

-- Estructura de tabla para la tabla `diario`
-- 

CREATE TABLE `diario` (
  `iddescricion` int(11) NOT NULL auto_increment,
  `idplancontable` int(11) NOT NULL,
  `cdgdescripcion` varchar(50) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `tmovimiento` char(1) NOT NULL,
  `cmovimiento` varchar(100) NOT NULL,
  PRIMARY KEY  (`iddescricion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- Estructura de tabla para la tabla `plancontable`
-- 

CREATE TABLE `plancontable` (
  `idplancontable` int(11) NOT NULL auto_increment,
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY  (`idplancontable`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- 
-- Volcar la base de datos para la tabla `plancontable`
-- 

INSERT INTO `plancontable` VALUES (1, 101, 'CAJA');
INSERT INTO `plancontable` VALUES (2, 403, 'INSTITUCIONES PÚBLICAS');
INSERT INTO `plancontable` VALUES (3, 4032, 'ONP');
INSERT INTO `plancontable` VALUES (4, 4031, 'ESSALUD');
INSERT INTO `plancontable` VALUES (5, 4033, 'SENATI');
INSERT INTO `plancontable` VALUES (6, 4034, 'SENCICO');
INSERT INTO `plancontable` VALUES (7, 4039, 'OTRAS INSTITUCIONES');
INSERT INTO `plancontable` VALUES (8, 411, 'REMUNERACIONES POR PAGAR');
INSERT INTO `plancontable` VALUES (9, 4111, 'SUELDOS Y SALARIOS POR PAGAR');
INSERT INTO `plancontable` VALUES (10, 4112, 'COMISIONES POR PAGAR');
INSERT INTO `plancontable` VALUES (11, 4113, 'REMUNERACIONES');
INSERT INTO `plancontable` VALUES (12, 4114, 'GRATIFICACIONES POR PAGAR');
INSERT INTO `plancontable` VALUES (13, 4115, 'VACACIONES POR PAGAR');
INSERT INTO `plancontable` VALUES (14, 621, ' REMUNERACIONES');
INSERT INTO `plancontable` VALUES (15, 6211, 'SUELDOS Y SALARIOS');
INSERT INTO `plancontable` VALUES (16, 6212, 'COMISIONES');
INSERT INTO `plancontable` VALUES (17, 6213, 'REMUNERACIONES');
INSERT INTO `plancontable` VALUES (18, 6214, 'GRATIFICACIONES');
INSERT INTO `plancontable` VALUES (19, 6215, 'VACACIONES');
INSERT INTO `plancontable` VALUES (20, 627, 'SEGURIDAD, PREVENCION SOCIAL');






--
-- Dumping data for table `usuario`
--


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20  9:48:10
delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createEmpresa`(empresai varchar(64))
begin
    declare idp integer;
        start transaction;
        insert into empresa values(null,empresai);        
        select max(idempresa) as idp from empresa;
        commit;
end$$
delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPersona`(nombresi varchar(64), apellidosi varchar(64),
dnii varchar(10))
begin
    declare idper integer;
        start transaction;
        insert into persona values(null,nombresi,apellidosi,dnii);
        select max(idpersona) as idper from persona;
        commit;
end$$
delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userROOT`(useri varchar(64),passi varchar(64),idu integer,idp integer)
begin
        start transaction;
        insert into usuario values(null,useri,passi,idu,idp,1);
        commit;
        select 1 as result;
end$$


DROP TABLE IF EXISTS `aportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aportes` (
  `idaportes` int(11) NOT NULL AUTO_INCREMENT,
  `essalud` varchar(100) NOT NULL,
  `senati` varchar(100) NOT NULL,
  `idcontrato` int(11) DEFAULT NULL,
  PRIMARY KEY (`idaportes`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descuentos` (
  `iddescuento` int(11) NOT NULL AUTO_INCREMENT,
  `afp` varchar(100) NOT NULL,
  `onp` varchar(100) NOT NULL,
  `quintacategoria` varchar(100) NOT NULL,
  `otros` varchar(100) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`iddescuento`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `remuneraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remuneraciones` (
  `idremuneracion` int(11) NOT NULL AUTO_INCREMENT,
  `idsueldo` int(11) NOT NULL,
  `hextras` varchar(100) NOT NULL,
  `comisiones` varchar(100) NOT NULL,
  `bono` varchar(100) NOT NULL,
  PRIMARY KEY (`idremuneracion`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMINISTRADOR DEL SISTEMA');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo`
--

DROP TABLE IF EXISTS `sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sueldo` (
  `idsueldo` int(11) NOT NULL AUTO_INCREMENT,
  `sueldobasico` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`idsueldo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'root','root',1,1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `comision` double NOT NULL,
  PRIMARY KEY (`idcargo`)
);
DROP TABLE IF EXISTS `contrato`;
CREATE TABLE `contrato` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `fechaingreso` date NOT NULL,
  `fechasalida` date NOT NULL,
  `idcargo` int(11) NOT NULL,
  `asigfamiliar` char(1) NOT NULL DEFAULT 0,
  `dlaborales` varchar(1) NOT NULL,
  `hlaborales` varchar(20) NOT NULL,
  `sueldo` double NOT NULL,
  `pension` char(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idcontrato`)
);
CREATE TABLE `planilla` (
  `idplanilla` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idplanilla`)
);
CREATE TABLE `det_planilla` (
  `iddetplanilla` int(11) NOT NULL AUTO_INCREMENT,
  `idplanilla` int(100) NOT NULL,
  `ntotal` double NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `denominacion` varchar(100) NOT NULL,
  `monto` double NOT NULL,
  `movimiento` int NOT NULL, --debe-haber
  PRIMARY KEY (`iddetplanilla`)
  FOREIGN KEY (`idplanilla`)
);