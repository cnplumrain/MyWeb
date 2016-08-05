package Control.Chat;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetMsg
 */
@WebServlet("/getMsg")
public class GetMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		
		String sql = "select a.DisplayName,b.Msg,b.Time from Users a ,Chat b where a.Id=b.UserId";
		List<?> list = null;
		try {
			 list = Db.SqlHelper.query(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg="";
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String time = format.format(calendar.getTime());
		for(int i=0;i<list.size();i++){
			try {
				msg+="<div>"+((HashMap) list.get(i)).get("DisplayName")+"   "+ 
						format.format(((HashMap)list.get(i)).get("Time")) +"</div><br/><div>"+
						((HashMap)list.get(i)).get("Msg")+"</div><br/>";
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.getWriter().write(msg);
		//request.setAttribute("chats", list);
		//request.getRequestDispatcher("/view/chat/index.jsp").forward(request,response) ;
	
		
	}
}
