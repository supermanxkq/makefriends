package njxzc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import njxzc.bean.User;
import njxzc.dao.ActionMethod;


//用户修改自我信息  将修改的数据刷新写到数据库中
public class modify extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UFT-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
/*		
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		String myType=req.getParameter("myType");
		String desType=req.getParameter("desType");
		String sex=req.getParameter("sex");
		String academy=req.getParameter("academy");
		String profession=req.getParameter("profession");
		String birth=req.getParameter("birth");
		String province=req.getParameter("province");
		String city=req.getParameter("city");
		String grade=req.getParameter("province");
		String introduction=req.getParameter("introduction");
		String friendQuality=req.getParameter("friendQuality");
		
		String sql = "update person set password = '" + password + "' where username = '" + name + "'";
*/		
		User user = new User();
		user.setUsername(req.getParameter("name"));
		user.setPassword(req.getParameter("password"));
		user.setMyType(req.getParameter("myType"));
		user.setDesType(req.getParameter("desType"));
		user.setSex(req.getParameter("sex"));
		user.setAcademy(req.getParameter("academy"));
		user.setProfession(req.getParameter("profession"));
		user.setBirthday(req.getParameter("birthday"));
		user.setHeight(Integer.parseInt(req.getParameter("height")));
		user.setProvince(req.getParameter("province"));
		user.setCity(req.getParameter("city"));
		user.setGrade(req.getParameter("grade"));
		user.setIntroduction(req.getParameter("introduction"));

		System.out.println("用户名是："+req.getParameter("introduction"));
		
		ActionMethod aMethod = new ActionMethod();
		aMethod.modUser(user);
		//aMethod.modifyUser(user);
		System.out.println(user.getAcademy());
		
		req.setAttribute("user", user);
		req.getRequestDispatcher("mine1.jsp").forward(req, resp);
		
		//out.println("修改成功，页面将在两秒后跳回");
		//resp.setHeader("refresh", "2;url=/makeFriends/mine1.jsp");

		
	}
	

}
