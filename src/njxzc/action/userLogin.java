package njxzc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import njxzc.bean.User;
import njxzc.dao.ActionMethod;
import njxzc.dao.RecommendFriends;


//验证用户登录  和数据库中的数据进行比对  登录成功和登录失败
public class userLogin extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UFT-8");
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		
		PrintWriter out = resp.getWriter();
		
		
		User user = new User();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		//获取用户输入的验证码
		String inputCode = req.getParameter("checkcode");
//		System.out.println("imputcode:"+inputCode);
		//获取自动生成的验证码
		String randomCode = req.getSession().getAttribute("imagecheckcode").toString();
//		System.out.println("randomCode:"+randomCode);
		user.setUsername(username);
		user.setPassword(password);
		
		//验证登录
		ActionMethod aMethod = new ActionMethod();
		int returnFlag = aMethod.loginUser(user, inputCode,randomCode);
		switch (returnFlag) {
		case 1:
			//登录成功
			session.setAttribute("username", username);
//			req.getSession().setAttribute("user", req.getParameter("username"));
//			out.println(returnFlag);
			out.println("登录成功，页面将在两秒后跳转到首页");
			req.getRequestDispatcher("indexContent.jsp").forward(req, resp);
			break;
		case -1:
//			out.println(returnFlag);
			out.print("登录名错误,页面将在两秒后跳转到首页登录页面");
			resp.setHeader("refresh", "2;url=/makeFriends/login.jsp");
			break;
		case -2:
//			out.println(returnFlag);
			out.print("密码错误,页面将在两秒后跳转到首页登录页面");
			resp.setHeader("refresh", "2;url=/makeFriends/login.jsp");
			break;
		case -3:
//			out.println(returnFlag);
			out.print("验证码错误,页面将在两秒后跳转到首页登录页面");
			resp.setHeader("refresh", "2;url=/makeFriends/login.jsp");
			break;
 		default:
			break;
		}
//		if(user2!=null){	
//			session.setAttribute("username", username);
//			//req.getSession().setAttribute("user", req.getParameter("username"));
//			//out.println("登录成功，页面将在两秒后跳转到首页");
//			req.getRequestDispatcher("indexContent.jsp").forward(req, resp);
//		}else{
//			out.print("登录名或者密码错误,页面将在两秒后跳转到首页登录页面");
//			resp.setHeader("refresh", "2;url=/makeFriends/index.jsp");
//		}
		//resp.setHeader("refresh", "3;url=/makeFriends/indexContent.jsp");
	}
}
