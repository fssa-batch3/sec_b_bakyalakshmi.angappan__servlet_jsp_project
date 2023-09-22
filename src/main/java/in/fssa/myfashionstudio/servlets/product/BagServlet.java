package in.fssa.myfashionstudio.servlets.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.model.Address;
import in.fssa.myfashionstudioapp.service.AddressService;

/**
 * Servlet implementation class BagServlet
 */
@WebServlet("/shoppingbag")
public class BagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");

		if (userId > 0) {

			AddressService addressService = new AddressService();

			try {
				Address address = addressService.findAddressByUserId(userId);

				System.out.println(address);

//				find address 

				request.setAttribute("address", address);
				request.getRequestDispatcher("/shopping_bag.jsp").forward(request, response);

//				response.sendRedirect(request.getContextPath() + "/shopping_bag.jsp");

			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
