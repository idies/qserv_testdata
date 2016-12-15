IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('test1'))
BEGIN;
    DROP TABLE [test1];
END;
GO

CREATE TABLE [test1] (
    [objectID] INTEGER NULL,
    [ra] INTEGER NULL,
    [dec] INTEGER NULL
);
GO

INSERT INTO test1([objectID],[ra],[dec]) VALUES(1,22,28),(2,77,3),(3,56,34),(4,57,52),(5,81,94),(6,45,93),(7,47,57),(8,50,15),(9,19,17),(10,79,27),(11,46,67),(12,37,70),(13,43,16),(14,76,36),(15,73,59),(16,22,87),(17,51,54),(18,95,38),(19,89,80),(20,54,59),(21,62,24),(22,6,29),(23,23,43),(24,1,43),(25,38,17),(26,9,4),(27,96,95),(28,25,85),(29,53,86),(30,84,40),(31,2,60),(32,39,94),(33,23,86),(34,71,33),(35,70,100),(36,26,26),(37,92,14),(38,16,47),(39,73,54),(40,41,59),(41,96,80),(42,98,11),(43,97,62),(44,16,53),(45,43,93),(46,61,58),(47,73,67),(48,86,7),(49,44,84),(50,56,59),(51,21,72),(52,43,56),(53,83,28),(54,51,66),(55,55,78),(56,36,14),(57,77,61),(58,88,55),(59,83,42),(60,40,35),(61,70,6),(62,65,78),(63,10,2),(64,47,95),(65,56,56),(66,83,31),(67,2,44),(68,54,88),(69,64,96),(70,24,71),(71,13,32),(72,31,33),(73,16,5),(74,73,19),(75,39,56),(76,53,86),(77,97,80),(78,92,50),(79,41,73),(80,24,16),(81,17,30),(82,16,86),(83,36,95),(84,82,20),(85,93,37),(86,26,58),(87,59,52),(88,4,40),(89,66,83),(90,14,60),(91,20,41),(92,44,53),(93,90,85),(94,78,86),(95,83,65),(96,16,1),(97,92,94),(98,51,53),(99,19,31),(100,94,93);