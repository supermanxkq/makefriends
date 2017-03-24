package njxzc.dao.imple;

import java.util.HashMap;

public interface RecommendImple {
	public String[] recommendFriend(String name);
	public double recommendMethod(int[] a,int[] b);
	public  HashMap<String, int[]> saveUserDataToMap();
}
