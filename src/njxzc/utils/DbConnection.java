package njxzc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class DbConnection {
	private String dbDriver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/makefriends?useUnicode=true&characterEncoding=utf-8";
	private String name="root";
	private String password="960107";
	public Connection connection = null;
	public java.sql.PreparedStatement pstmt = null;
	public ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			Class.forName(dbDriver);
			connection = DriverManager.getConnection(url, name, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public void close() {
		try {
			if(rs!=null && !(this.rs.isClosed())){
				rs.close();
			}
			if(pstmt!=null && !(this.pstmt.isClosed())){
				pstmt.close();
			}
			if(connection!=null && !(this.connection.isClosed())){
				connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
