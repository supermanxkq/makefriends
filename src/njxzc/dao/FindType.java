package njxzc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import njxzc.utils.DbConnection;

//根据username的值的目标类型 找出朋友数最大的前五位  然后推荐给此用户
public class FindType {
	
	public String[] getType(String type){
		DbConnection db = new DbConnection();
		Connection conn = db.getConnection();
		try {
			Relation relation = new Relation();
			Map<String, Integer> typeSort = new HashMap<String,Integer>();
			Statement stm = conn.createStatement();
			String sql = "select * from user where myType="+"\""+type+"\"";
			//System.out.println(sql);
			ResultSet rs = stm.executeQuery(sql);	
			
			while(rs.next()){
				//System.out.println(rs.getInt(14));
				typeSort.put(rs.getString(1),rs.getInt(14));
			}
			String typeUser[] = relation.mapSort(typeSort, 6);
//			for(String typeuser:typeUser){				
//				System.out.println(typeuser);
//			}
			return typeUser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	} 
}
