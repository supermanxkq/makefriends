package njxzc.utils;

public interface DbCreateTablesInterface {
	String createTableUser = "CREATE TABLE `user` ("
			+ "`userName` varchar(10) NOT NULL,"
			+ "`password` varchar(10) NOT NULL,"
			+ "`myType` varchar(50) NOT NULL,"
			+ "`desType` varchar(50) NOT NULL,"
			+ "`sex` varchar(10) DEFAULT NULL,"
			+ "`academy` varchar(20) DEFAULT NULL,"
			+ "`profession` varchar(20) DEFAULT NULL,"
			+ "`birthday` date DEFAULT NULL," + "`height` float DEFAULT NULL,"
			+ "`province` varchar(10) DEFAULT NULL,"
			+ "`city` varchar(10) DEFAULT NULL,"
			+ "`grade` varchar(10) DEFAULT NULL,"
			+ "`introduction` varchar(30) DEFAULT NULL,"
			+ "`friendQuality` int(11) DEFAULT NULL,"
			+ "PRIMARY KEY (`userName`)"
			+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8";
	String createTableUserResultSet = "CREATE TABLE `userresultset` ( "
			+ "`userName` varchar(10) NOT NULL,"
			+ "`result` float DEFAULT NULL,"
			+ "PRIMARY KEY (`userName`),"
			+ "CONSTRAINT `URSToUser` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE"
			+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";
	String createTableUserHobby = "CREATE TABLE `userhobby` ("
			+ "`userName` varchar(10) NOT NULL,"
			+ "`superScholar` int(11) DEFAULT '0',"
			+ "`sport` int(11) DEFAULT '0',"
			+ "`travel` int(11) DEFAULT '0',"
			+ "`foodie` int(11) DEFAULT '0',"
			+ "`emotion` int(11) DEFAULT '0',"
			+ "`other` int(11) DEFAULT '0',"
			+ "PRIMARY KEY (`userName`),"
			+ "CONSTRAINT `UHToUser` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE"
			+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";
	String createTableRecommendFreinds = "CREATE TABLE `recommendfriends` ("
			+ "`userName` varchar(10) NOT NULL,"
			+ "PRIMARY KEY (`userName`),"
			+ "CONSTRAINT `rfToUser` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE"
			+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8";
	String createTableRelation = "CREATE TABLE `relation` ("
			  +"`id` int(10) NOT NULL AUTO_INCREMENT,"
			  +"`userName` varchar(10) NOT NULL,"
			  +"PRIMARY KEY (`id`)"
			+") ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;";

	public int createTable(String sql);

	public void tableIsExist(String tableName);

	public int createTableUser();
	public int createTableUserResultSet();
	public int createTableUserHobby();
	public int createTableRecomendFriends();
}
