/*
MySQL Data Transfer
Source Host: localhost
Source Database: teleweb
Target Host: localhost
Target Database: teleweb
Date: 31/3/2023 8:50:44 AM
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for grupo 2023/04/20
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `ID_Jefe` int NOT NULL,
  `ID_Gerente` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Jefe` (`ID_Jefe`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `FK_grupo_jefe` FOREIGN KEY (`ID_Jefe`) REFERENCES `Asesor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_grupo_gerente` FOREIGN KEY (`ID_Gerente`) REFERENCES `Asesor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for asesor_grupo --- Modificado 20230529
-- ----------------------------
DROP TABLE IF EXISTS `asesor_grupo`;
CREATE TABLE `asesor_grupo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Asesor` int NOT NULL,
  `ID_Grupo` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AG_Asesor_idx` (`ID_Asesor`),
  KEY `AG_Grupo_idx` (`ID_Grupo`),
  CONSTRAINT `AG_Asesor` FOREIGN KEY (`ID_Asesor`) REFERENCES `Asesor` (`ID`),
  CONSTRAINT `AG_Grupo` FOREIGN KEY (`ID_Grupo`) REFERENCES `grupo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for asesor_grupo --- Modificado 20230529
-- ----------------------------
DROP TABLE IF EXISTS `asesor_grupo`;
CREATE TABLE `asesor_grupo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Asesor` int NOT NULL,
  `ID_Grupo` int NOT NULL,
  `ID_Agencia` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AG_Asesor_idx` (`ID_Asesor`),
  KEY `AG_Grupo_idx` (`ID_Grupo`),
  KEY `AG_Agencia_idx` (`ID_Agencia`),
  CONSTRAINT `AG_Asesor` FOREIGN KEY (`ID_Asesor`) REFERENCES `Asesor` (`ID`),
  CONSTRAINT `AG_Grupo` FOREIGN KEY (`ID_Grupo`) REFERENCES `grupo` (`ID`),
  CONSTRAINT `AG_Agencia` FOREIGN KEY (`ID_Agencia`) REFERENCES `Agencia` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for agendamiento
-- ----------------------------
DROP TABLE IF EXISTS `agendamiento`;
CREATE TABLE `agendamiento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Contacto` varchar(200) DEFAULT NULL,
  `Telefono_contacto` varchar(200) DEFAULT NULL,
  `Fecha_agendamiento` date DEFAULT NULL,
  `Hora_agendamiento` time DEFAULT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Hora_creacion` time DEFAULT NULL,
  `Detalle` text,
  `Estado` enum('Agendada','Cumplida','No cumplida','Reagendada'),
  `ID_Asesor` int NOT NULL,
  `ID_Contacto` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Asesor` (`ID_Asesor`),
  KEY `ID_Contacto` (`ID_Contacto`),
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`ID_Asesor`) REFERENCES `Asesor` (`ID`),
  CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`ID_Contacto`) REFERENCES `Contacto` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for asistente_gerente --- Creada 20230614
-- ----------------------------
DROP TABLE IF EXISTS `asistente_gerente`;
CREATE TABLE `asistente_gerente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Asistente` int NOT NULL,
  `ID_Gerente` int NOT NULL,
  `ID_Agencia` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `asg_Asistente_idx` (`ID_Asistente`),
  KEY `asg_Gerente_idx` (`ID_Gerente`),
  KEY `asg_Agencia_idx` (`ID_Agencia`),
  CONSTRAINT `ASG_Asistente` FOREIGN KEY (`ID_Asistente`) REFERENCES `Asesor` (`ID`),
  CONSTRAINT `ASG_Gerente` FOREIGN KEY (`ID_Gerente`) REFERENCES `Asesor` (`ID`),
  CONSTRAINT `ASG_Agencia` FOREIGN KEY (`ID_Agencia`) REFERENCES `Agencia` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

