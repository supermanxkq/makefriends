package njxzc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import njxzc.utils.DbConnection;


//根据数据库中朋友数量最多的前四位  推荐到首页（用户还没有登录的首页）
public class SearchByQuality {
	public String[] searchQuality(){
		DbConnection connection = new DbConnection();
		Connection conn = connection.getConnection();
		String[] user = new String[4];
		
		try {
			Statement stm = conn.createStatement();
			String sql = "select username from user order by friendQuality desc limit 4";
			ResultSet rSet = stm.executeQuery(sql);
			int  i =0;
			while (rSet.next()) {
				user[i] = rSet.getString(1);
				i +=1;
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
}
