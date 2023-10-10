package in.fssa.myfashionstudio.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.Address;
import in.fssa.myfashionstudioapp.model.User;
import in.fssa.myfashionstudioapp.service.AddressService;
import in.fssa.myfashionstudioapp.service.UserService;

/**
 * Servlet implementation class ViewProfileServlet
 */

@WebServlet("/my_profile")
public class ViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		request.getRequestDispatcher("/profile.jsp").forward(request, response);
//	}
//
//}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = (int) request.getSession().getAttribute("userId");

		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		User user = null;

		if (userId > 0) {

			AddressService addressService = new AddressService();

			try {

				Address address = addressService.findAddressByUserId(userId);

				System.out.println(address);

//				find address 

				request.setAttribute("address", address);

				user = userService.findById(userId);

				request.setAttribute("user", user);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");

				dispatcher.forward(request, response);
			} catch (ValidationException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			} catch (ServiceException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}

		}

	}

}