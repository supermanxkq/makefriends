package njxzc.dao.imple;

import org.apache.coyote.http11.filters.VoidInputFilter;

import njxzc.action.userLogin;
import njxzc.bean.User;

public interface ActionImple {
	public User addUser(User user);
	public int loginUser(User user,String inputCode,String randomCode);
	//比较验证码
	public boolean compareCode(String inputCode, String randomCode);
	public User modUser(User user);
}
