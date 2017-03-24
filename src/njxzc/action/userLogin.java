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


//��֤�û���¼  �����ݿ��е����ݽ��бȶ�  ��¼�ɹ��͵�¼ʧ��
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
		//��ȡ�û��������֤��
		String inputCode = req.getParameter("checkcode");
//		System.out.println("imputcode:"+inputCode);
		//��ȡ�Զ����ɵ���֤��
		String randomCode = req.getSession().getAttribute("imagecheckcode").toString();
//		System.out.println("randomCode:"+randomCode);
		user.setUsername(username);
		user.setPassword(password);
		
		//��֤��¼
		ActionMethod aMethod = new ActionMethod();
		int returnFlag = aMethod.loginUser(user, inputCode,randomCode);
		switch (returnFlag) {
		case 1:
			//��¼�ɹ�
			session.setAttribute("username", username);
//			req.getSession().setAttribute("user", req.getParameter("username"));
//			out.println(returnFlag);
			out.println("��¼�ɹ���ҳ�潫���������ת����ҳ");
			req.getRequestDispatcher("indexContent.jsp").forward(req, resp);
			break;
		case -1:
//			out.println(returnFlag);
			out.print("��¼������,ҳ�潫���������ת����ҳ��¼ҳ��");
			resp.setHeader("refresh", "2;url=/makeFriends/login.jsp");
			break;
		case -2:
//			out.println(returnFlag);
			out.print("�������,ҳ�潫���������ת����ҳ��¼ҳ��");
			resp.setHeader("refresh", "2;url=/makeFriends/login.jsp");
			break;
		case -3:
//			out.println(returnFlag);
			out.print("��֤�����,ҳ�潫���������ת����ҳ��¼ҳ��");
			resp.setHeader("refresh", "2;url=/makeFriends/login.jsp");
			break;
 		default:
			break;
		}
//		if(user2!=null){	
//			session.setAttribute("username", username);
//			//req.getSession().setAttribute("user", req.getParameter("username"));
//			//out.println("��¼�ɹ���ҳ�潫���������ת����ҳ");
//			req.getRequestDispatcher("indexContent.jsp").forward(req, resp);
//		}else{
//			out.print("��¼�������������,ҳ�潫���������ת����ҳ��¼ҳ��");
//			resp.setHeader("refresh", "2;url=/makeFriends/index.jsp");
//		}
		//resp.setHeader("refresh", "3;url=/makeFriends/indexContent.jsp");
	}
}
