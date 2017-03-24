package njxzc.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DbCreateTablesImpl implements DbCreateTablesInterface{
	DbConnection dbConnection = new DbConnection();
	
	public int  createTable(String sql) {
		int i = 0;
		try {
			dbConnection.pstmt = dbConnection.getConnection().prepareStatement(sql);
			i = dbConnection.pstmt.executeUpdate();
			dbConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public void tableIsExist(String tableName) {
		try {
			ResultSet rSet = dbConnection.getConnection().getMetaData().getTables(null, null, tableName, null);
			if (rSet.next()) {
				//表已经存在
				String sqlString  = "drop table "+tableName+"";
				System.out.println(sqlString);
				dbConnection.pstmt = dbConnection.getConnection().prepareStatement(sqlString);
				dbConnection.pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//因为userOriginValue等表中有registerinfo表中的外键，所以得先删除这两个子表，再删除父表，
	//所以要先删除子表，再删除父表，然后再建两个子表和父表。
	public void dropTables(){
		tableIsExist("userresultset");
		tableIsExist("userhobby");
		tableIsExist("recommendfreinds");
		tableIsExist("user");
	}
	public int createTableUser() {
		System.out.println("createTableUser:\n"+createTableUser);
		return createTable(createTableUser);
	}
	public int createTableUserResultSet() {
		System.out.println("createTableUserResultSet:\n"+createTableUserResultSet);
		return createTable(createTableUserResultSet);
	}
	public int createTableUserHobby() {
		System.out.println("createTableUserHobby:\n"+createTableUserHobby);
		return createTable(createTableUserHobby);
	}
	public int createTableRecomendFriends() {
		System.out.println("createTableRecomendFriends:\n"+createTableRecommendFreinds);
		return createTable(createTableRecommendFreinds);
	}
	
}
