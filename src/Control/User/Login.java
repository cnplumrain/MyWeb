package Control.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Db.SqlHelper;
import Model.User;
import Ocean.Security.Security;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String verificationCode = request.getParameter("VerificationCode");
		if (!request.getSession().getAttribute("verificationCode").toString().equalsIgnoreCase(verificationCode)) {
			request.getRequestDispatcher("/view/user/login.jsp").forward(request, response);
		} else {
			String username = request.getParameter("UserName");
			String password = request.getParameter("Password");
		
			List<HashMap> list=null;
			String sql = "select * from Users where UserName='" + username + "'";
			try {
				list =  SqlHelper.query(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				response.getWriter().print("<script>alert('ע��ʧ��!" + e1.getMessage() + "');history.go(-1);</script>");
			}
			int count = list.size();
			if(count==1){
				
				String dbPassword=(String)list.get(0).get("Password");
				String decodePassword =Security.Decode(dbPassword);
				if(password.equals(decodePassword)){
					request.getRequestDispatcher("/view/index.jsp").forward(request, response);
				}else{
					response.getWriter().print("<script>alert('�������!');history.go(-1);</script>");
				}
			}else if(count>1){
				response.getWriter().print("<script>alert('���ڶ����ͬ�û�������ϵ����Ա!');history.go(-1);</script>");
			}else{
				response.getWriter().print("<script>alert('û�и��û�!');history.go(-1);</script>");
			}
		}
	}

}
