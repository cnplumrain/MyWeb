package Control.Activity;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Db.SqlHelper;

/**
 * Servlet implementation class Activity
 */
@WebServlet("/activity")
public class Activity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Activity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sql = "select * from Activity";
		List<?> list = null;
		try {
			 list = Db.SqlHelper.query(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		request.setAttribute("activities", list);
		request.getRequestDispatcher("/view/activity/index.jsp").forward(request,response) ;
		//response.sendRedirect("view/activity/index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String t=request.getParameter("actId");
		int activityId =Integer.parseInt(t);
		String sql = "select top 1 Detail from Activity where Id='"+activityId+"'";
		String result="";
		try {
			result = SqlHelper.getSingle(sql).toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			response.getWriter().write("查询数据出错！");
			return;
		}
		
		response.getWriter().write(result);
	}

}
