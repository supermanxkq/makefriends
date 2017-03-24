package njxzc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import njxzc.bean.User;
import njxzc.dao.ActionMethod;
import njxzc.utils.DbConnection;

//用户注册处理事件   将用户注册的内容写到数据库中
public class addUser extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		resp.setCharacterEncoding("UFT-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		HttpSession session  = req.getSession();
		
		PrintWriter out = resp.getWriter();
		
		String username = req.getParameter("username");
		session.setAttribute("username", username);
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(req.getParameter("password"));
		user.setAcademy(req.getParameter("academy"));
		user.setBirthday(req.getParameter("birthday"));
		user.setCity(req.getParameter("city"));
		user.setDesType(req.getParameter("desType"));
		user.setGrade(req.getParameter("grade"));
		user.setHeight(Integer.parseInt(req.getParameter("height")));
		user.setIntroduction(req.getParameter("introduction"));
		user.setMyType(req.getParameter("myType"));
		user.setProfession(req.getParameter("profession"));
		user.setProvince(req.getParameter("province"));
		user.setSex(req.getParameter("sex"));
		user.setDeString(req.getParameter("des"));
		System.out.println("目标类型是"+req.getParameter("des"));
		
		ActionMethod aMethod = new ActionMethod();
		aMethod.addUser(user);
	
		req.getSession().setAttribute("user", username);
		out.println("注册成功，页面将在两秒后跳转到首页");
		resp.setHeader("refresh", "3;url=/makeFriends/indexContent.jsp");
	}
}
