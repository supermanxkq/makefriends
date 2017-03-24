package njxzc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import njxzc.bean.User;
import njxzc.dao.imple.ActionImple;
import njxzc.utils.DbConnection;


public class ActionMethod implements ActionImple{
	


	//�û�ע���¼�  Ȼ��д�����ݿ���
	public User addUser(User user) {
		DbConnection connection = new DbConnection();
		Connection conn = connection.getConnection();
		
		String sql = "insert into user(userName,password,myType,desType,sex,academy,profession,birthday,height,province,city,grade,introduction) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			//��user���в���һ����¼
			PreparedStatement pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, user.getUsername());
			pStatement.setString(2, user.getPassword());
			pStatement.setString(3, user.getMyType());
			pStatement.setString(4, user.getDesType());
			pStatement.setString(5, user.getSex());
			pStatement.setString(6, user.getAcademy());
			pStatement.setString(7, user.getProfession());
			pStatement.setString(8, user.getBirthday());
			pStatement.setInt(9, user.getHeight());
			pStatement.setString(10, user.getProvince());
			pStatement.setString(11, user.getCity());
			pStatement.setString(12, user.getGrade());
			pStatement.setString(13, user.getIntroduction());
			
			pStatement.executeUpdate();
			System.out.println("�����û��ɹ�");
			
			//��useroriginvalue���в����¼
			String sqlUser = "insert into recommendfriends(userName) values("+"\""+user.getUsername()+"\""+")";
			System.out.println("��useroriginvalue���в����¼"+sqlUser);
			Statement statement1 = conn.createStatement();
			statement1.executeUpdate(sqlUser);
			System.out.println("useroriginvalue������û��ɹ�");
			
			//��useroriginvalue���������ֶ�
			String addSql = "alter table recommendfriends add "+user.getUsername()+" varchar(10) not null default 0 after userName";
			System.out.println("��useroriginvalue���������ֶ�"+addSql);
			Statement statement2 = conn.createStatement();
			statement2.executeUpdate(addSql);
			System.out.println("useroriginvalue�������ֶγɹ�");
			
			//��relation�������Ӽ�¼
			String relationship = "insert into relation(userName) values("+"\""+user.getUsername()+"\""+")";
			System.out.println("��relation�������Ӽ�¼"+relationship);
			Statement statement3 = conn.createStatement();
			statement3.executeUpdate(relationship);
			System.out.println("��relation�������Ӽ�¼�ɹ�");
			
			//��relation���������ֶ�
			String relation = "alter table relation add "+user.getUsername()+" varchar(10) not null default 0";
			System.out.println("��relation���������ֶ�"+relation);
			Statement statement4 = conn.createStatement();
			statement4.executeUpdate(relation);
			System.out.println("relation�������ֶγɹ�");
			
			//��userhobby���в�����ֵ
			String des =  user.getDeString();
			String desSql;
			Statement statement5 = conn.createStatement();
			if(des.equals("1")){
				desSql = "insert into userhobby(username,superscholar) values("+"\""+user.getUsername()+"\""+",2)";
				System.out.println("��userhobby���в�����ֵ"+desSql);
				statement5.executeUpdate(desSql);
			}else if(des.equals("2")){
				desSql = "insert into userhobby(username,sport) values("+"\""+user.getUsername()+"\""+",2)";
				System.out.println("��userhobby���в�����ֵ"+desSql);
				statement5.executeUpdate(desSql);
			}else if(des.equals("3")){
				desSql = "insert into userhobby(username,travel) values("+"\""+user.getUsername()+"\""+",2)";
				System.out.println("��userhobby���в�����ֵ"+desSql);
				statement5.executeUpdate(desSql);
			}else if(des.equals("4")){
				desSql = "insert into userhobby(username,foodie) values("+"\""+user.getUsername()+"\""+",2)";
				System.out.println("��userhobby���в�����ֵ"+desSql);
				statement5.executeUpdate(desSql);
			}else if(des.equals("5")){
				desSql = "insert into userhobby(username,emotion) values("+"\""+user.getUsername()+"\""+",2)";
				System.out.println("��userhobby���в�����ֵ"+desSql);
				statement5.executeUpdate(desSql);
			}else{
				desSql = "insert into userhobby(username,other) values("+"\""+user.getUsername()+"\""+",2)";
				System.out.println("��userhobby���в�����ֵ"+desSql);
				statement5.executeUpdate(desSql);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//�û���¼�¼�  �ͺ�̨���ݿ����ƥ��
	public int loginUser(User user,String inputCode,String randomCode) {
		//System.out.println(user.getUsername()+","+user.getPassword());
		DbConnection connection = new DbConnection();
		Connection conn = connection.getConnection();
		String sql = "select username,password from user where userName = ?";
		//���ݷ���ֵ�ж����������
		//1�������¼�ɹ���-1�������û��������ڣ�-2�������������-3��������֤�����
		int returnFlag = 0;
		try {
			PreparedStatement pStatement = conn.prepareStatement(sql);
			System.out.println(sql);
			pStatement.setString(1, user.getUsername());
			System.out.println("name:"+user.getUsername());
			ResultSet rs = pStatement.executeQuery();
			if (rs==null || !rs.next()) {
				System.out.println("name do not exist");
				returnFlag =-1;
			}
			rs.beforeFirst();
			while(rs.next()){
				if(user.getPassword() != null && user.getPassword().equals(rs.getString("password"))){
				    if ( inputCode!=null && compareCode(inputCode, randomCode)) {
				    	//��ת����¼�ɹ�ҳ��
				    	System.out.println("login success");
				    	returnFlag =1;
				    	break;
					}else {
						System.out.println("��֤�����");
						returnFlag = -3;
						break;
					}
				}else{
					//���벻ƥ����߲�ƥ��
					System.out.println("login fail");
					returnFlag = -2;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return returnFlag;
	}



	//��֤���б���
	public boolean compareCode(String inputCode, String randomCode) {
		boolean flag = false;
		char[] inputChar = inputCode.toCharArray();
		char[] codeChar = randomCode.toCharArray();
		// �ж������Ƿ���ͬ
		if (inputChar.length == codeChar.length) {
			for (int i = 0; i < codeChar.length; i++) {
				// ���Զ����ɵ���֤���еĴ�д��ĸת����Сд���ٱȽ�
				if (codeChar[i] <= 90 && codeChar[i] >= 65) {
//					System.out.println("1111111111");
					int codeInt = (int) codeChar[i];
					int codeResu = codeInt + 32;// ת����Сд
//					 System.out.println("codere"+codeResu);
					int inputInt = (int) inputChar[i];
//					 System.out.println("input"+inputInt);
					if (inputInt <= 90 && inputInt >= 65) {
//						System.out.println("333333333");
						if (inputInt != codeInt) {
//							System.out.println("da�ȶ�shibai");
							flag = false;
							break;
						} else {
//							System.out.println("da�ȶԳɹ�");
							flag = true;
						}
					} else {
						if (inputInt != codeResu) {
//							System.out.println("da�ȶ�shibai");
							flag = false;
							break;
						} else {
//							System.out.println("da�ȶԳɹ�");
							flag = true;
						}
					}

				} else {
//					System.out.println("22222222");
					int codeInt = (int) codeChar[i];
					int inputInt = (int) inputChar[i];
					if (codeInt != inputInt) {
						System.out.println("xi�ȶ�shibai");
						flag = false;
						break;
					} else {
//						System.out.println("xi�ȶԳɹ�");
						flag = true;
					}
				}
			}
		}
//		System.out.println("flag:"+flag);
		return flag;
	}

	
	//�û��޸�������Ϣ�¼� Ȼ��������д�����ݿ���
	public User modUser(User user){
		DbConnection connection = new DbConnection();
		Connection conn = connection.getConnection();
		String userName=user.getUsername();
		String sql1 = "update user set password = '" + user.getPassword() + "' where userName = '" + userName + "'";
		String sql2 = "update user set myType = '" + user.getMyType() + "' where userName = '" + userName + "'";
		String sql3 = "update user set desType = '" + user.getDesType() + "' where userName = '" + userName + "'";
		String sql4 = "update user set sex = '" + user.getSex() + "' where userName = '" + userName + "'";
		String sql5 = "update user set academy = '" + user.getAcademy() + "' where userName = '" + userName + "'";
		String sql6 = "update user set profession = '" + user.getProfession() + "' where userName = '" + userName + "'";
		String sql7 = "update user set birthday = '" + user.getBirthday() + "' where userName = '" + userName + "'";
		String sql8 = "update user set height = '" + user.getHeight() + "' where userName = '" + userName + "'";	
		String sql9 = "update user set province = '" + user.getProvince() + "' where userName = '" + userName + "'";
		String sql10 = "update user set city = '" + user.getCity() + "' where userName = '" + userName + "'";
		String sql11 = "update user set grade = '" + user.getGrade() + "' where userName = '" + userName + "'";
		String sql12 = "update user set introduction = '" + user.getIntroduction() + "' where userName = '" + userName + "'";
		
		try {
			
			Statement stmt = conn.createStatement();
			System.out.print(stmt.executeUpdate(sql1));
			System.out.print(stmt.executeUpdate(sql2));			
			System.out.print(stmt.executeUpdate(sql3));			
			System.out.print(stmt.executeUpdate(sql4));			
			System.out.print(stmt.executeUpdate(sql5));			
			System.out.print(stmt.executeUpdate(sql6));			
			System.out.print(stmt.executeUpdate(sql7));			
			System.out.print(stmt.executeUpdate(sql8));			
			System.out.print(stmt.executeUpdate(sql9));			
			System.out.print(stmt.executeUpdate(sql10));			
			System.out.print(stmt.executeUpdate(sql11));
			System.out.print(stmt.executeUpdate(sql12));
			
			if (stmt.executeUpdate(sql1) <= 0&&stmt.executeUpdate(sql2) <= 0
					&&stmt.executeUpdate(sql3) <= 0&&stmt.executeUpdate(sql4) <= 0
					&&stmt.executeUpdate(sql5) <= 0&&stmt.executeUpdate(sql6) <= 0
					&&stmt.executeUpdate(sql7) <= 0&&stmt.executeUpdate(sql8) <= 0
					&&stmt.executeUpdate(sql9) <= 0&&stmt.executeUpdate(sql10) <= 0
					&&stmt.executeUpdate(sql11) <= 0&&stmt.executeUpdate(sql12) <= 0) {
				System.out.println("modify failure");
				//response.setHeader("refresh", "5;modify.jsp?username=" + username);
//				out.println("<script type='test/javascript'>history.back();</script>");
			} else {
				System.out.println("modify success");
				//response.setHeader("refresh", "5;url=list.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	
}
