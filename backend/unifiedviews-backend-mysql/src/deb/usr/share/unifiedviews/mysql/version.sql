-- set db schema version into database 
LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES ('UV.db.version','001.005.000');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;


