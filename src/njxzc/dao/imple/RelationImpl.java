package njxzc.dao.imple;

import java.sql.ResultSet;
import java.util.Map;

import njxzc.bean.User;

public interface RelationImpl {
	public String[][] getData(String table);
	public String[][] result();
	public void insertTable();
	public String[] showUser(String username);
	public Map<String,Integer> getDataMap(ResultSet rs,String cloName);
}
