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

//�㷨����ά�ռ������н�
public class RecommendFriends {
	DbConnection dbConnection = new DbConnection();
	String[] names = null; //names�������������username�ֶεĸ���ֵ
	int columnCount;//��ȥuserName�ֶκ���ֶ�����
	final int recommendCount = 4;//�Ƽ�����
	//���ر��Ƽ����ĸ��û���������ɵ��ַ�������
	public String[] recommendFriend(String name) {
		//����saveUserDataToMap�������ص�map
		HashMap<String, int[]> resultMap = saveUserDataToMap();
		//��ȡ���˲���name֮���userName;
		String[] otherKeys = new String[columnCount-1];
		//ָ�����ֵ��û�����
		int[] nameData = resultMap.get(name);
		//�����û�������
		int[] otherData = new int[columnCount-1];
		//��ָ���û��������û��ռ�н�
		Map<String, Double> angles = new TreeMap<String, Double>();
//		for (Entry<String, int[]> entry : resultMap.entrySet()) {
//			System.out.println(entry.getKey());
//			int[] temp = entry.getValue();
//			for (int i = 0; i < temp.length; i++) {
//				System.out.print("����map��temp["+i+"]="+temp[i]+"  ");
//			}
//			System.out.println();
//		}
//		System.out.println(columnCount);
//		for (int i = 0; i < nameData.length; i++) {
//			System.out.print(name +" :"+nameData[i]+"   ");
//		}
		//�Ѳ���ָ���û��������û���ȡ�����浽otherKeys
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
		
		//����ָ���û��������û�֮��ļн�
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
		
		//��angles����value��������
		List<Entry<String, Double>> sortList = new ArrayList<Entry<String, Double>>(angles.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Double>>(){
			//��������ȡ��ǰ�ĸ�
			public int compare(Entry<String, Double> en1,Entry<String, Double> en2){
				return en1.getValue().compareTo(en2.getValue());
			}
		});
//		for (Entry<String, Double> entry : sortList) {
//			System.out.println(entry.getKey()+":"+entry.getValue());
//		}
		//ȡ���ź����ǰ�ĸ�
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
	//��������֮��ļн�
	public double recommendMethod(int[] a,int[] b) {
		int aLength;//����a,b�ĳ���,����������ĳ�����һ�µ�
		int sumPointMul = 0;//������˵Ľ��
//		double aNorm,bNorm;//����a,b��ģ
		int aSum = 0,bSum = 0;//����a,b������ƽ��֮��
		double resultCos;//������������ֵ
		double angle;//�������ļн�
		aLength = a.length;
		for(int i = 0;i < aLength ;i++){
			sumPointMul += a[i] * b[i];
			aSum += Math.pow(a[i], 2);
			bSum += Math.pow(b[i], 2);
		}
//		System.out.println("sumPointMul��"+sumPointMul+"  asum��"
//		+aSum+"   bsum��"+bSum);
//		aNorm = Math.sqrt(aSum);
//		System.out.println("anorm��"+aNorm);
//		bNorm = Math.sqrt(bSum);
//		System.out.println("bnorm��"+bNorm);
		resultCos = sumPointMul/(Math.sqrt(aSum)*Math.sqrt(bSum));
//		System.out.println("resyltcos��"+resultCos);
		angle = Math.acos(resultCos);
//		System.out.println("angle��"+angle);
		return angle;
	}
	
	//�����ݿ��ȡ���ݷŵ�map��
	public  HashMap<String, int[]> saveUserDataToMap() {
		String sql = "select * from recommendFriends";
		HashMap<String, int[]> userData = new HashMap<String, int[]>();
		try {
			dbConnection.pstmt = dbConnection.getConnection().prepareStatement(sql);
			dbConnection.rs = dbConnection.pstmt.executeQuery();
			System.out.println("recommendFriends���ݿ��ѯ�ɹ�");
			java.sql.ResultSetMetaData rsmd = dbConnection.rs.getMetaData();
			columnCount = rsmd.getColumnCount()-1;
			System.out.println(columnCount);
			//����nά���飬��Ÿ��û�����
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
//					System.out.print("����map��temp["+i+"]="+temp[i]+"  ");
//				}
//				System.out.println();
//			}
//			����map
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
