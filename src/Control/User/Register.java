package Control.User;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Db.SqlHelper;
import Ocean.Security.Security;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		// ImageIO.write(image, "JPEG", response.getOutputStream());
		request.getRequestDispatcher("/view/user/register.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("UserName");
		String password = request.getParameter("Password");
		String verificationCode = request.getParameter("VerificationCode");
		if (!request.getSession().getAttribute("verificationCode").toString().equalsIgnoreCase(verificationCode)) {
			request.getRequestDispatcher("/view/user/register.jsp").forward(request, response);
		} else {
			int count=0;
			String sql = "select count(*) from Users where UserName='" + username + "'";
			try {
				count = (int) SqlHelper.getSingle(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				response.getWriter().print("<script>alert('注册失败!" + e1.getMessage() + "');history.go(-1);</script>");
			}
			if (count > 0) {
				response.getWriter().print("<script>alert('该用户已存在!');history.go(-1);</script>");
			} else {
				String encodePassword = Security.Encode(password);
				Date timeNow = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String timeNowString = format.format(timeNow);
				String sql2 = "insert into Users(UserName,Password,RegistrationTime,LoginTime,Status,Type) "
						+ "values ('" + username + "','" + encodePassword + "','" + timeNowString + "','"
						+ timeNowString + "',0,0)";
				try {
					Db.SqlHelper.insertWithReturnPrimeKey(sql2);

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					response.getWriter().print("<script>alert('注册失败!" + e.getMessage() + "');history.go(-1);</script>");
				}
				response.getWriter().print("<script>alert('注册成功!')</script>");
			}

		}
	}

}
