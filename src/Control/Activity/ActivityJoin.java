package Control.Activity;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActivityJoin
 */
@WebServlet("/activityJoin")
public class ActivityJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=utf-8");
		int activityId=Integer.parseInt(request.getParameter("activityId"));
		int userId=(int) request.getSession().getAttribute("userId");
		String sql = "insert into UserActivity(UserId,ActivityId) values ('"+userId+"','"+activityId+"')";
		try {
			Db.SqlHelper.insertWithReturnPrimeKey(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().print("<script>alert('报名失败!请联系管理员');history.go(-1);</script>");
			return;
		}
		response.getWriter().print("<script>alert('报名成功!')</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
