package njxzc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import njxzc.utils.DbConnection;

//算法：多维空间向量夹角
public class RecommendFriends {
	DbConnection dbConnection = new DbConnection();
	String[] names = null; //names数组是用来存放username字段的各个值
	int columnCount;//除去userName字段后的字段总数
	final int recommendCount = 4;//推荐人数
	//返回被推荐的四个用户名字所组成的字符串数组
	public String[] recommendFriend(String name) {
		//接受saveUserDataToMap函数返回的map
		HashMap<String, int[]> resultMap = saveUserDataToMap();
		//获取除了参数name之外的userName;
		String[] otherKeys = new String[columnCount-1];
		//指定名字的用户数据
		int[] nameData = resultMap.get(name);
		//其他用户的数据
		int[] otherData = new int[columnCount-1];
		//放指定用户与其他用户空间夹角
		Map<String, Double> angles = new TreeMap<String, Double>();
//		for (Entry<String, int[]> entry : resultMap.entrySet()) {
//			System.out.println(entry.getKey());
//			int[] temp = entry.getValue();
//			for (int i = 0; i < temp.length; i++) {
//				System.out.print("遍历map：temp["+i+"]="+temp[i]+"  ");
//			}
//			System.out.println();
//		}
//		System.out.println(columnCount);
//		for (int i = 0; i < nameData.length; i++) {
//			System.out.print(name +" :"+nameData[i]+"   ");
//		}
		//把不是指定用户的其他用户名取出来存到otherKeys
		int n = 0;
		for (Entry<String, int[]> entry : resultMap.entrySet()) {
//			System.out.println("key= " + entry.getKey() + " and value= "
//                    + entry.getValue());
			if (!(entry.getKey().equals(name))) {
				otherKeys[n] = entry.getKey();
				n++;
			}
		}
//		System.out.println("otherKeysLength:"+otherKeys.length);
		
		//计算指定用户与其他用户之间的夹角
		for (int j = 0; j < otherKeys.length; j++) {
			String tempKey  = otherKeys[j];
//			System.out.println("otherKeys:"+tempKey+"  j:"+j+"  " );
//			String anglesKey = name + "To" + tempKey;
			otherData = resultMap.get(tempKey);
//			for (int j1 = 0; j1 < otherData.length; j1++) {
//				System.out.print("tempKey:"+otherData[j1]+"   ");
//			}
//			System.out.println();
			Double tempAngle = recommendMethod(nameData, otherData);
//			angles.put(anglesKey, tempAngle);
			angles.put(tempKey, tempAngle);
		}
		
		//对angles按照value进行排序
		List<Entry<String, Double>> sortList = new ArrayList<Entry<String, Double>>(angles.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Double>>(){
			//升序排序，取出前四个
			public int compare(Entry<String, Double> en1,Entry<String, Double> en2){
				return en1.getValue().compareTo(en2.getValue());
			}
		});
//		for (Entry<String, Double> entry : sortList) {
//			System.out.println(entry.getKey()+":"+entry.getValue());
//		}
		//取出排好序的前四个
		int tag=0;
		String[] finalRecommendUsers = new String[recommendCount];
		for (Entry<String, Double> entry : sortList) {
			if (tag >= 4) {
				break;
			}
			finalRecommendUsers[tag] = entry.getKey();
			tag++;
		}
//		for (int i = 0; i < finalRecommendUsers.length; i++) {
//			System.out.println(finalRecommendUsers[i]);
//		}
		return finalRecommendUsers;
	}
	//计算向量之间的夹角
	public double recommendMethod(int[] a,int[] b) {
		int aLength;//数组a,b的长度,但是两数组的长度是一致的
		int sumPointMul = 0;//向量点乘的结果
//		double aNorm,bNorm;//向量a,b的模
		int aSum = 0,bSum = 0;//向量a,b个坐标平方之和
		double resultCos;//两向量的余弦值
		double angle;//两向量的夹角
		aLength = a.length;
		for(int i = 0;i < aLength ;i++){
			sumPointMul += a[i] * b[i];
			aSum += Math.pow(a[i], 2);
			bSum += Math.pow(b[i], 2);
		}
//		System.out.println("sumPointMul："+sumPointMul+"  asum："
//		+aSum+"   bsum："+bSum);
//		aNorm = Math.sqrt(aSum);
//		System.out.println("anorm："+aNorm);
//		bNorm = Math.sqrt(bSum);
//		System.out.println("bnorm："+bNorm);
		resultCos = sumPointMul/(Math.sqrt(aSum)*Math.sqrt(bSum));
//		System.out.println("resyltcos："+resultCos);
		angle = Math.acos(resultCos);
//		System.out.println("angle："+angle);
		return angle;
	}
	
	//从数据库读取数据放到map中
	public  HashMap<String, int[]> saveUserDataToMap() {
		String sql = "select * from recommendFriends";
		HashMap<String, int[]> userData = new HashMap<String, int[]>();
		try {
			dbConnection.pstmt = dbConnection.getConnection().prepareStatement(sql);
			dbConnection.rs = dbConnection.pstmt.executeQuery();
			System.out.println("recommendFriends数据库查询成功");
			java.sql.ResultSetMetaData rsmd = dbConnection.rs.getMetaData();
			columnCount = rsmd.getColumnCount()-1;
			System.out.println(columnCount);
			//创建n维数组，存放各用户数据
			int tempUserData[] = new int[columnCount];
			names = new String[columnCount];
			String name = null;
			while(dbConnection.rs.next()) {
				int value[] = new int[columnCount];
				for (int i = 0; i < columnCount; i++) {
					value[i]= dbConnection.rs.getInt(i+2);
				}
//				for (int i = 0; i < value.length; i++) {
//					System.out.print(value[i]+"  ");
//				}
//				System.out.println();
				name = dbConnection.rs.getString(1);
//				System.out.println("name:"+name);
				userData.put(name, value);
//				int[] temp = userData.get(name);
//				for (int i = 0; i < temp.length; i++) {
//					System.out.print("temp["+i+"]="+temp[i]+"  ");
//				}
//				System.out.println();
			}
//			for (Entry<String, int[]> entry : userData.entrySet()) {
//				System.out.println(entry.getKey());
//				int[] temp = entry.getValue();
//				for (int i = 0; i < temp.length; i++) {
//					System.out.print("遍历map：temp["+i+"]="+temp[i]+"  ");
//				}
//				System.out.println();
//			}
//			遍历map
//			for (Entry<String, int[]> entry : userData.entrySet()) {
//				System.out.println("key= " + entry.getKey() + " and value= "
//				                     + entry.getValue());
//			}
			dbConnection.close();
		}catch(SQLException e){
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return userData;
	}
	
}
