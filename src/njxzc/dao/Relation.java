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


//矩阵相乘
public class Relation implements RelationImpl{
	DbConnection db = new DbConnection();
	Connection conn = db.getConnection();
	
	//获取数据库中的值，并且装到数组中
	public String[][] getData(String table){
		try {
			Statement stm = conn.createStatement();			
			String sql = "select * from "+table;
			ResultSet rs = stm.executeQuery(sql); 
			
			//总行数
			rs.last();
			int rows = rs.getRow();
			//System.out.println(table+"行数是:"+rs.getRow());
			
			//总列数
			ResultSetMetaData rsmd = rs.getMetaData(); 
			int clos = rsmd.getColumnCount()-2;
			//System.out.println(table+"列数是:"+rsmd.getColumnCount()); 
			
			//将表中的数据存入数组中
			String relation[][] = new String[rows][clos];
			rs.first();
			for(int i = 0;i<rows;i++){
				for(int j = 0;j<clos;j++){
					relation[i][j] = rs.getString(j+3);
				}
				rs.next();
			}
			//打印数组内容
			//System.out.println(table+"里面的数据是：");
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
	
	
	//两个矩阵相乘  得到的数据装到数组里面
	public String[][] result(){
		String relation[][] = getData("relation");
		String userhobby[][] = getData("userhobby");
		
		//矩阵相乘
		int rows = relation.length;
		int clos = userhobby[0].length;
		String result[][] = new String[rows][clos];
		//两个矩阵相乘
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
		//打印连个矩阵相乘的结果
		//System.out.println("两个矩阵相乘的结果是：");
		for(int i = 0;i<rows;i++){
			for(int j=0;j<clos;j++){
				//System.out.print(result[i][j]);
			}
			//System.out.println();
		}
		return result;
	}
	
	
	//将结果写入数据库中，将两个矩阵相乘的结果插入数据库中
	public void insertTable(){
		String result[][] = result();
		try {
			Statement statement = conn.createStatement();
			//首先清空userresultset表中的数据
			String truncate = "truncate table userresultset";
			statement.executeUpdate(truncate);
			
			//获取username
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
			//打印username
			/*System.out.println("");
			for(int j=0;j<rows;j++){
				System.out.println(name[j]);
			}*/
			
			//将username插入到数据userresultset中
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
			//System.out.println("数据插入成功");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	//根据查询到的数据  找出最亲密的人物
	public String[] showUser(String username) {
		insertTable();
		String user[] = new String[8];
		try {
			Statement statement = null;
			
			//在userresultset表中找出数据最高的字段和数字
			String sql = "select * from userresultset where userName="+"\""+username+"\"" ;
			statement = conn.createStatement();
			ResultSet rSet = statement.executeQuery(sql);
			ResultSetMetaData rsm = rSet.getMetaData();
			rSet.first();
			Map<Integer, Integer> valueMap = new HashMap<Integer,Integer>();
			//List<String> usernameList = new ArrayList<String>();
			//将username查询到的记录有序插入treemap中
			for(int i = 3;i <= rsm.getColumnCount();i++){
				valueMap.put(i, rSet.getInt(i));
			}
			
			//System.out.println("根据"+username+"从userresultsset表中查询到的一行数据");
			/*for(int value:valueMap.values()){
				System.out.println(value);
			}*/
			
			//获取最大值的字段名称
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
			//System.out.println("最大的字段名称是："+cloNameFir);
			
			//System.out.println("去掉最大的字段后，所剩下的数据"+valueMap.size());
			for(int value:valueMap.values()){
				//System.out.println(value);
			}
			//获取第二个大的值的字段名称
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
			//System.out.println("第二大的字段名称是："+cloNameSec);
			
			/*
			//排序前
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
			//排序后
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
						
			//找出user表中字段cloName值最大的值，并且对从username中找出相应字段的五个最大值
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
		
			//找出user表中字段cloName值第二大的值，并且对从username中找出相应字段的三个最大值
			ResultSet rs2 = statement.executeQuery(newTable);
			Map<String, Integer> SecondMap = getDataMap(rs2, cloNameSec);
//			System.out.println(SecondMap.keySet());
			String second[] = mapSort(SecondMap,3);
//			System.out.println(second.length);
		    for(int i = 5;i<8;i++){
				user[i] = second[i-5];
//				System.out.print(user[i]);
			}
		    //System.out.println(user+"最后的取值为：");
		    /*for(int i=0;i<8;i++){
		    	System.out.println(user[i]);
		    }*/
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	//对haspmap进行排序  并且取出key值
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
		//System.out.println("取到的最大的前五位的username是");
		/*for(int i = 0;i<n;i++){
			System.out.print(userArray[i]);
		}*/
		return userArray;
	}
	
	
	
	
	//根据字段查找表中符合要求的数据
	public Map<String,Integer> getDataMap(ResultSet rs,String cloName){
		String newTableClo = "",newTable = "";
		Map<String,Integer> result = null;
		result = new HashMap<String, Integer>();
		
		try {
			while(rs.next()){
				newTable = "";
				newTableClo="";
				if(rs.getString(2).equals("学霸型")){
					newTableClo = "superScholar";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("运动")){
					newTableClo = "sport";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("旅游搭档")){
					newTableClo = "travel";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("吃货陪")){
					newTableClo = "foodie";
					if(newTableClo.equals(cloName)){
						result.put(rs.getString(1), rs.getInt(3));
					}
				}else if(rs.getString(2).equals("情感类")){
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
			//System.out.println(cloName+"查询到的username和交友人数是：");
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
