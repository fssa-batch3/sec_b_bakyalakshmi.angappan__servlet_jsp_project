package in.fssa.myfashionstudio.servlets.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.User;
import in.fssa.myfashionstudioapp.service.UserService;

@WebServlet("/user/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/signup").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User newUser = new User();
		newUser.setUserName(request.getParameter("username"));
		newUser.setEmail(request.getParameter("email"));
		newUser.setPhoneNumber(Long.parseLong(request.getParameter("mobilenumber")));
		newUser.setPassword(request.getParameter("password"));

		UserService userService = new UserService();
		try {
			int userId = userService.createUser(newUser);

			request.getSession().setAttribute("userId", userId);
			response.sendRedirect(request.getContextPath() + "/home");
		} catch (ValidationException | ServiceException e) {

			String errorMessage = "?error=" + e.getMessage();
			response.sendRedirect(request.getContextPath() + "/sign_up.jsp" + errorMessage);
			e.printStackTrace();
		}
	}
}

//
//@WebServlet("/user/create")
//public class CreateUserServlet extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//
//	@Override
//	protected void doOptions(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// Set CORS headers to allow requests from the specific origin
//		response.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:5501");
//		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS");
//		response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
//		response.setHeader("Access-Control-Max-Age", "3600"); // Cache preflight response for 1 hour
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		response.setHeader("Access-Control-Allow-Origin", "*");
//		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS");
//		response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
//
//		User newUser = new User();
//
//		newUser.setUserName(request.getParameter("username"));
//		System.out.println((newUser.getUserName()));
//		newUser.setEmail(request.getParameter("email"));
//		newUser.setPhoneNumber(Long.parseLong(request.getParameter("mobilenumber")));
//		newUser.setPassword(request.getParameter("password"));
//
//		UserService userService = new UserService();
//
//		try {
//
//			int userId = userService.createUser(newUser);
//
//			ResponseEntity res = new ResponseEntity();
//			res.setStatusCode(200);
//			res.setData("success");
//			res.setMessage("user created succesfully");
//
//			response.setContentType("application/json");
//			response.setCharacterEncoding("UTF-8");
//
//			request.getSession().setAttribute("userId", userId);
//
//			response.sendRedirect(request.getContextPath() + "/home");
//
//		} catch (ValidationException | ServiceException e) {
//
//			String errorMessage = "?error=" + e.getMessage();
//			response.sendRedirect(request.getContextPath() + "/sign_up.jsp" + errorMessage);
//
//			e.printStackTrace();
//		}
//
//	}
//
//}
