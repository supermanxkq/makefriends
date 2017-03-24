package njxzc.utils;

import java.util.Vector;

import njxzc.bean.User;
import njxzc.dao.FindType;
import njxzc.dao.RecommendFriends;
import njxzc.dao.ResultFromDb;

public class Test {
	public static void main(String[] args) {
		
		FindType findType = new FindType();
		findType.getType("运动");
		
		
		
		// TODO Auto-generated method stub
//		DbCreateTablesImpl acti = new DbCreateTablesImpl();
//		acti.dropTables();
//		System.out.println("colleAd:"+acti.createTableUser());
//		System.out.println("callUserHobby:"+acti.createTableUserHobby());
		//acti.tableIsExist("recomendfriends");
//		System.out.println("callUserResult:"+acti.createTableRecomendFriends());
//		RecommendFriends rFriends = new RecommendFriends();
//		
//		ResultFromDb resultFromDb = new ResultFromDb();
//		Vector<User> result = resultFromDb.dataFromDB(rFriends.recommendFriend("cris"));
//		Object[] users = result.toArray();
//		for (Object obj : users) {
//			User user = (User)obj;
//			System.out.println("userName:"+user.getUsername());
//			System.out.println("sex:"+user.getSex());
//			System.out.println("birthday:"+user.getBirthday());
//			System.out.println("introduction:"+user.getIntroduction());
//		}
		
//		Vector<User> result1 = resultFromDb.dataFromDB("cris");
//		Object[] users1 = result1.toArray();
//		for (Object obj : users1) {
//			User user = (User)obj;
//			System.out.println("cris的userName:"+user.getUsername());
//			System.out.println("cris的getMyType:"+user.getMyType());
//			System.out.println("cris的getDesType:"+user.getDesType());
//			System.out.println("cris的sex:"+user.getSex());
//			System.out.println("cris的getAcademy:"+user.getAcademy());
//			System.out.println("cris的Profession:"+user.getProfession());
//			System.out.println("cris的setHeight:"+user.getHeight());
//			System.out.println("cris的birthday:"+user.getBirthday());
//			System.out.println("cris的setProvince:"+user.getProvince());
//			System.out.println("cris的setCity:"+user.getCity());
//			System.out.println("cris的setGrade:"+user.getGrade());
//			System.out.println("cris的introduction:"+user.getIntroduction());
//		}
	}
}
