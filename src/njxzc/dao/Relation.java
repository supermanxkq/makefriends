package njxzc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

import javax.servlet.SingleThreadModel;

import com.mysql.fabric.xmlrpc.base.Array;

import njxzc.bean.User;
import njxzc.dao.imple.RelationImpl;
import njxzc.utils.DbConnection;


//�������
public class Relation implements RelationImpl{
	DbConnection db = new DbConnection();
	Connection conn = db.getConnection();
	
	//��ȡ���ݿ��е�ֵ������װ��������
	public String[][] getData(String table){
		try {
			Statement stm = conn.createStatement();			
			String sql = "select * from "+table;
			ResultSet rs = stm.executeQuery(sql); 
			
			//������
			rs.last();
			int rows = rs.getRow();
			//System.out.println(table+"������:"+rs.getRow());
			
			//������
			ResultSetMetaData rsmd = rs.getMetaData(); 
			int clos = rsmd.getColumnCount()-2;
			//System.out.println(table+"������:"+rsmd.getColumnCount()); 
			
			//�����е����ݴ���������
			String relation[][] = new String[rows][clos];
			rs.first();
			for(int i = 0;i<rows;i++){
				for(int j = 0;j<clos;j++){
					relation[i][j] = rs.getString(j+3);
				}
				rs.next();
			}
			//��ӡ��������
			//System.out.println(table+"����������ǣ�");
			/*for(int i = 0;i<rows;i++){
				for(int j = 0;j<clos;j++){
					System.out.print(relation[i][j]);
				}
				System.out.println();
			}*/	
			return relation;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	
	//�����������  �õ�������װ����������
	public String[][] result(){
		String relation[][] = getData("relation");
		String userhobby[][] = getData("userhobby");
		
		//�������
		int rows = relation.length;
		int clos = userhobby[0].length;
		String result[][] = new String[rows][clos];
		//�����������
		for(int i = 0;i<rows ;i++)  
        {  
            for(int j = 0;j<clos;j++)  
            {  
                int t = 0;  
                for(int n = 0;n<userhobby.length;n++)  
                {  
                	int x = Integer.parseInt(relation[i][n]);
                	int y = Integer.parseInt(userhobby[n][j]);
                    t += x*y;              
                }  
                String temp = String.valueOf(t);
                result[i][j] = temp;    
            }  
        } 
		//��ӡ����������˵Ľ��
		//System.out.println("����������˵Ľ���ǣ�");
		for(int i = 0;i<rows;i++){
			for(int j=0;j<clos;j++){
				//System.out.print(result[i][j]);
			}
			//System.out.println();
		}
		return result;
	}
	
	
	//�����д�����ݿ��У�������������˵Ľ���������ݿ���
	public void insertTable(){
		String result[][] = result();
		try {
			Statement statement = conn.createStatement();
			//�������userresultset���е�����
			String truncate = "truncate table userresultset";
			statement.executeUpdate(truncate);
			
			//��ȡusername
			String sql = "select username from relation";
			ResultSet rSet = statement.executeQuery(sql);
			rSet.last();
			int rows = rSet.getRow();
			String name[] = new String[rows];
			rSet.first();
			for(int i= 0;i<rows;i++){
				name[i] = rSet.getString(1);
				rSet.next();
			}
			//��ӡusername
			/*System.out.println("");
			for(int j=0;j<rows;j++){
				System.out.println(name[j]);
			}*/
			
			//��username���뵽����userresultset��
			PreparedStatement pstm = null;
			for(int i = 0;i<rows;i++){
				String insert = "insert into userresultset(userName,superScholar,sport,travel,foodie,emotion,other) values(?,?,?,?,?,?,?)";
				pstm = conn.prepareStatement(insert);
				pstm.setString(1, name[i]);
				for(int j = 0;j<result[0].length;j++){
					pstm.setString(j+2, result[i][j]);
				}
				pstm.executeUpdate();
			}
			//System.out.println("���ݲ���ɹ�");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	//���ݲ�ѯ��������  �ҳ������ܵ�����
	public String[] showUser(String username) {
		insertTable();
		String user[] = new String[8];
		try {
			Statement statement = null;
			
			//��userresultset�����ҳ�������ߵ��ֶκ�����
			String sql = "select * from userresultset where userName="+"\""+username+"\"" ;
			statement = conn.createStatement();
			ResultSet rSet = statement.executeQuery(sql);
			ResultSetMetaData rsm = rSet.getMetaData();
			rSet.first();
			Map<Integer, Integer> valueMap = new HashMap<Integer,Integer>();
			//List<String> usernameList = new ArrayList<String>();
			//��username��ѯ���ļ�¼�������treemap��
			for(int i = 3;i <= rsm.getColumnCount();i++){
				valueMap.put(i, rSet.getInt(i));
			}
			
			//System.out.println("����"+username+"��userresultsset���в�ѯ����һ������");
			/*for(int value:valueMap.values()){
				System.out.println(value);
			}*/
			
			//��ȡ���ֵ���ֶ�����
			int max = 0,position = 0;
			for(int i = 3;i<=rsm.getColumnCount();i++){
				if(valueMap.get(i)>max){
					max = valueMap.get(i);
					position = i;
				}
			}
			//System.out.println(max+","+position);
			valueMap.remove(position);
			String cloNameFir = rsm.getColumnName(position);
			//System.out.println("�����ֶ������ǣ�"+cloNameFir);
			
			//System.out.println("ȥ�������ֶκ���ʣ�µ�����"+valueMap.size());
			for(int value:valueMap.values()){
				//System.out.println(value);
			}
			//��ȡ�ڶ������ֵ���ֶ�����
			int maxSec = 0,positionSec = 0;
			for(int i = 3;i<=rsm.getColumnCount();i++){
				if(i==position){
					continue;
				}
				if(valueMap.get(i)>maxSec){
					maxSec = valueMap.get(i);
					positionSec = i;
				}
			}
			//System.out.println(maxSec+","+positionSec);
			String cloNameSec = rsm.getColumnName(positionSec);
			//System.out.println("�ڶ�����ֶ������ǣ�"+cloNameSec);
			
			/*
			//����ǰ
			for(int value:valueMap.values()){
				System.out.println(value);
			}
			int v = 0;
			for(int i = 3;i<valueMap.size()+2;i++){
				for(int j = 3;j<valueMap.size()+2;j++){
					if(valueMap.get(j+1)>valueMap.get(j)){
						v = valueMap.get(j);
						valueMap.put(j, valueMap.get(j+1));
						valueMap.put(j+1,v);
					}
				}
			}
			//�����
			for(int value:valueMap.values()){
				System.out.println(value);
			}
			System.out.println(valueMap.keySet());*/
			
			/*int n = 0;
			int positionF = 0,positionS = 0;
			String cloNameF = "",cloNameS = "";
			for(int value:valueMap.keySet()){
				if(n==0){
					positionF = value;
					System.out.println(positionF);
					cloNameF = rsm.getColumnName(positionF);
					System.out.println(cloNameF);
				}
				if(n==1){
					positionS = value;
					cloNameS = rsm.getColumnName(positionS);
				}else{
					break;
				}
				n++;
			}
			System.out.println(cloNameF+","+cloNameS);*/
						
			//�ҳ�user�����ֶ�cloNameֵ����ֵ�����ҶԴ�username���ҳ���Ӧ�ֶε�������ֵ
			String newTable = "select username,myType,friendQuality from user";
			ResultSet rs = statement.executeQuery(newTable);
			Map<String, Integer> firstMap = getDataMap(rs, cloNameFir);
//			System.out.println(firstMap.keySet());
			String first[] = mapSort(firstMap,5);
//			System.out.println(first.length);
			for(int i = 0;i<5;i++){
				user[i] = first[i];
//				System.out.print(user[i]);
			}
		
			//�ҳ�user�����ֶ�cloNameֵ�ڶ����ֵ�����ҶԴ�username���ҳ���Ӧ�ֶε��������ֵ
			ResultSet rs2 = statement.executeQuery(newTable);
			Map<String, Integer> SecondMap = getDataMap(rs2, cloNameSec);
//			System.out.println(SecondMap.keySet());
			String second[] = mapSort(SecondMap,3);
//			System.out.println(second.length);
		    for(int i = 5;i<8;i++){
				user[i] = second[i-5];
//				System.out.print(user[i]);
			}
		    //System.out.println(user+"����ȡֵΪ��");
		    /*for(int i=0;i<8;i++){
		    	System.out.println(user[i]);
		    }*/
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	//��haspmap��������  ����ȡ��keyֵ
	public String[] mapSort(Map<String, Integer> map,int n){
		List<Entry<String, Integer>> sortList = new ArrayList<Entry<String, Integer>>(map.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Integer>>(){
			public int compare(Entry<String, Integer> en1,Entry<String, Integer> en2){
				return en2.getValue().compareTo(en1.getValue());
			}
		});
		
		int tag=0;
		String[] userArray = null;
		userArray = new String[n];
		for (Entry<String, Integer> entry : sortList) {
			if (tag >= n) {
				break;
			}			
			userArray[tag] = entry.getKey();
			tag++;
		}
		//System.out.println(tag);
		//System.out.println("ȡ��������ǰ��λ��username��");
		/*for(int i = 0;i<n;i++){
			System.out.print(userArray[i]);
		}*/
		return userArray;
	}
	
	
	
	
	//�����ֶβ��ұ��з���Ҫ�������
	public Map<String,Integer> getDataMap(ResultSet rs,String cloName){
		String newTableClo = "",newTable = "";
		Map<String,Integer> result = null;
		result = new HashMap<String, Integer>();
		
		try {
			while(rs.next()){
				newTable = "";
				newTableClo="";
				if(rs.getString(2).equals("ѧ����")){
					newTableClo = "superScholar";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("�˶�")){
					newTableClo = "sport";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("���δ")){
					newTableClo = "travel";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("�Ի���")){
					newTableClo = "foodie";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("�����")){
					newTableClo = "emotion";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else{
					newTableClo = "other";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}
			}
			//System.out.println(cloName+"��ѯ����username�ͽ��������ǣ�");
			//System.out.print(result.keySet());
			/*for(int value:result.values()){
				System.out.print(value);
			}*/
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
