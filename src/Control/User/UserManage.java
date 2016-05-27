package Control.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import Db.SqlHelper;

/**
 * Servlet implementation class UserManage
 */
@WebServlet (name = "UserManage", urlPatterns = { "/userManage" }, 
//loadOnStartup = 1,
initParams = { 
		@WebInitParam(name = "name", value = "java developer"),
		@WebInitParam(name = "age", value = "20")
})
public class UserManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public UserManage() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
		System.out.println("Servlet  初始化"+config);
		super.init(config);
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		// 使用 GBK 设置中文正常显示
		//response.setCharacterEncoding("GBK");
		//String initParams=getInitParameter("name");
		
		String sql = "select * from Users";
		List list = null;
		try {
			 list = Db.SqlHelper.query(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("users", list);
		request.getSession().setAttribute("o", "sessionTest");
		request.getRequestDispatcher("/view/user/userManage.jsp").forward(request,response) ;
		//System.out.println(list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    

}
