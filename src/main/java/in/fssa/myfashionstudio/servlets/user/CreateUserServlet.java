package in.fssa.myfashionstudio.servlets.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.myfashionstudio.model.ResponseEntity;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.User;
import in.fssa.myfashionstudioapp.service.UserService;

/**
 * Servlet implementation class CreateUserServlet
 */
/*
 * @WebServlet("/user/create") public class CreateUserServlet extends
 * HttpServlet { private static final long serialVersionUID = 1L;
 * 
 * @Override protected void doGet(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * request.getRequestDispatcher("/signup").forward(request, response); }
 * 
 * @Override protected void doPost(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * 
 * User newUser = new User();
 * newUser.setUserName(request.getParameter("username"));
 * newUser.setEmail(request.getParameter("email"));
 * newUser.setPhoneNumber(Long.parseLong(request.getParameter("phonenumber")));
 * newUser.setPassword(request.getParameter("password"));
 * 
 * UserService userService = new UserService(); try {
 * userService.createUser(newUser);
 * 
 * response.sendRedirect(request.getContextPath() + "/login");
 * 
 * } catch (ValidationException | ServiceException e) {
 * 
 * String errorMessage = "?error=" + e.getMessage();
 * 
 * response.sendRedirect(request.getContextPath() + "/signup" + errorMessage);
 * e.printStackTrace(); }
 * 
 * }
 * 
 * }
 * 
 */
@WebServlet("/user/signup")
public class CreateUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

//
	@Override
	protected void doOptions(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Set CORS headers to allow requests from the specific origin
		response.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:5501");
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
		response.setHeader("Access-Control-Max-Age", "3600"); // Cache preflight response for 1 hour
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
		// Read the JSON data from the request's input stream
//
//		BufferedReader reader = request.getReader();
//		StringBuilder jsonBody = new StringBuilder();
//		String line;
//		while ((line = reader.readLine()) != null) {
//			jsonBody.append(line);
//		}

		// Parse the JSON data using Gson or any other JSON parsing library
//		Gson gson = new Gson();
		// User userData = gson.fromJson(jsonBody.toString(), User.class);

		// System.out.println(userData);

		User newUser = new User();

		newUser.setUserName(request.getParameter("userName"));
		System.out.println((newUser.getUserName()));
		newUser.setEmail(request.getParameter("email"));
		newUser.setPhoneNumber(Long.parseLong(request.getParameter("phoneNumber")));
		newUser.setPassword(request.getParameter("password"));

		UserService userService = new UserService();

		try {

			userService.createUser(newUser);

			ResponseEntity res = new ResponseEntity();
			res.setStatusCode(200);
			res.setData("success");
			res.setMessage("user created succesfully");

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

		} catch (ValidationException | ServiceException e) {

			ResponseEntity res = new ResponseEntity();
			res.setStatusCode(500);
			res.setMessage(e.getMessage());

			Gson gson1 = new Gson();
			String responseJson = gson1.toJson(res);
			response.setStatus(500);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(responseJson);

			e.printStackTrace();
		}

	}

}
