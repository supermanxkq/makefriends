package njxzc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import njxzc.bean.User;
import njxzc.dao.Relation;
import njxzc.dao.ResultFromDb;

//用户登录后的处理  主要是用户在选择哪个选区时进行的处理
public class RelationShip extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		resp.setCharacterEncoding("UFT-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String username = (String)session.getAttribute("username");
		System.out.println("登录的人是："+username);
		
		Relation relation = new Relation();
		String relationUser[] = relation.showUser(username);
		
		ResultFromDb fromDb = new ResultFromDb();
		Vector<User> resultUser = fromDb.dataFromDB(relationUser);
		
		req.setAttribute("relationUser", resultUser);
		
		String type_tag = req.getParameter("type-tag");
		System.out.println("跳转页面的标志是："+type_tag);
		if(type_tag.equals("1")){
			req.getRequestDispatcher("makeFriendsSuperscholar.jsp").forward(req, resp);
		}else if(type_tag.equals("2")){
			req.getRequestDispatcher("makeFriendsSports.jsp").forward(req, resp);
		}else if(type_tag.equals("3")){
			req.getRequestDispatcher("makeFriendsTrip.jsp").forward(req, resp);
		}else if(type_tag.equals("4")){
			req.getRequestDispatcher("makeFriendsEating.jsp").forward(req, resp);
		}else if(type_tag.equals("5")){
			req.getRequestDispatcher("makeFriendsEmotion.jsp").forward(req, resp);
		}else{
			req.getRequestDispatcher("makeFriendsSuperscholar.jsp").forward(req, resp);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
