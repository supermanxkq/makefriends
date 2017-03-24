package njxzc.dao;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import njxzc.bean.User;
import njxzc.utils.DbConnection;


//根据username的数据找出相应的数据库中这些用户的信息
public class ResultFromDb {
	public Vector<User> dataFromDB(String[] userNames) {
		DbConnection dbConnection = new DbConnection();
		Vector<User> result = new Vector<User>();
		String sql = "";
		//Connection conn = db
		for (int i = 0; i < userNames.length; i++) {
			sql = "select userName,sex,birthday,introduction from user where userName='" + userNames[i] + "'";
			//System.out.println(sql);
			try {
				User tempUser = new User();
				dbConnection.pstmt = dbConnection.getConnection().prepareStatement(sql);
				dbConnection.rs = dbConnection.pstmt.executeQuery();
				while (dbConnection.rs.next()) {
					tempUser.setUsername(dbConnection.rs.getString(1));
					tempUser.setSex(dbConnection.rs.getString(2));
					int age = ageMethod(dbConnection.rs.getDate(3));
					//System.out.println("age" + age);
					tempUser.setBirthday(age+"");
					tempUser.setIntroduction(dbConnection.rs.getString(4));
					result.addElement(tempUser);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public Vector<User> dataFromDB(String userName) {
		DbConnection dbConnection = new DbConnection();
		Vector<User> result = new Vector<User>();
		String sql = "select userName,myType,desType,sex,academy,profession,"
				+ "birthday,height,province,city,grade,introduction from user "
				+ "where userName='" + userName + "'";
		//System.out.println(sql);
			try {
				User tempUser = new User();
				dbConnection.pstmt = dbConnection.getConnection().prepareStatement(sql);
				dbConnection.rs = dbConnection.pstmt.executeQuery();
				while (dbConnection.rs.next()) {
					tempUser.setUsername(dbConnection.rs.getString(1));
					tempUser.setMyType(dbConnection.rs.getString(2));
					tempUser.setDesType(dbConnection.rs.getString(3));
					tempUser.setSex(dbConnection.rs.getString(4));
					tempUser.setAcademy(dbConnection.rs.getString(5));
					tempUser.setProfession(dbConnection.rs.getString(6));
					int age = ageMethod(dbConnection.rs.getDate(7));
					//System.out.println("age" + age);
					tempUser.setBirthday(age+"");
					tempUser.setHeight((int)dbConnection.rs.getFloat(8));
					tempUser.setProvince(dbConnection.rs.getString(9));
					tempUser.setCity(dbConnection.rs.getString(10));
					tempUser.setGrade(dbConnection.rs.getString(11));
					tempUser.setIntroduction(dbConnection.rs.getString(12));
					result.addElement(tempUser);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	public int ageMethod(Date date) {
		int age = 0;
		Date now = new Date();// 当前年月日
		//System.out.println(date);
		SimpleDateFormat format_y = new SimpleDateFormat("yyyy");
		SimpleDateFormat format_M = new SimpleDateFormat("MM");

		String birth_year = format_y.format(date);
		String this_year = format_y.format(now);

		String birth_month = format_M.format(date);
		String this_month = format_M.format(now);

		// 初步，估算
		age = Integer.parseInt(this_year) - Integer.parseInt(birth_year);

		// 如果未到出生月份，则age - 1
		if (this_month.compareTo(birth_month) < 0) {
			age -= 1;
		}
		if (age < 0) {
			age = 0;
		}
		return age;
	}
}
