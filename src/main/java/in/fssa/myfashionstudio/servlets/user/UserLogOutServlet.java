package in.fssa.myfashionstudio.servlets.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogOutServlet
 */
@WebServlet("/logout")
public class UserLogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("shdysty");

		HttpSession session = request.getSession();

		String attributeName = "userId";
		session.removeAttribute(attributeName);
		/* session.invalidate(); */
		response.sendRedirect(request.getContextPath() + "/home");
	}
}
