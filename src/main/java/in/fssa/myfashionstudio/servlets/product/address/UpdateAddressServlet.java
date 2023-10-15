package in.fssa.myfashionstudio.servlets.product.address;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.Address;
import in.fssa.myfashionstudioapp.model.User;
import in.fssa.myfashionstudioapp.service.AddressService;

/**
 * Servlet implementation class UpdateAddressServlet
 */
@WebServlet("/address/update")
public class UpdateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String source = request.getParameter("source");
		System.out.println(source);

		Address address = new Address();
		HttpSession session = request.getSession();
		int userId = 0;
		if (session != null) {
			userId = (int) session.getAttribute("userId");
		}
		address.setId(Integer.parseInt(request.getParameter("address_id")));
		address.setUser(new User(userId));
		address.setTitle(request.getParameter("title"));
		address.setAddress(request.getParameter("address"));
		address.setLandMark(request.getParameter("landmark"));
		address.setCity(request.getParameter("city"));
		address.setState(request.getParameter("state"));
		address.setCountry(request.getParameter("country"));
		address.setPincode(Integer.parseInt(request.getParameter("pincode")));
		address.setStatus(Boolean.parseBoolean(request.getParameter("status")));

		System.out.println(address);

		AddressService addressService = new AddressService();
		try {

			addressService.updateAddress(address);

			if (source.equals("bag")) {
				response.sendRedirect(request.getContextPath() + "/shoppingbag");
			} else {
				response.sendRedirect(request.getContextPath() + "/my_profile");
			}

		} catch (ValidationException e) {

			System.out.println(e.getMessage());
			/* String errormsg = e.getMessage(); */
			/* response.sendRedirect("request.getContextPath() + /address/add"); */
			e.printStackTrace();
		} catch (ServiceException e) {

			System.out.println(e.getMessage());
//			String errormsg = e.getMessage();
//			response.sendRedirect("request.getContextPath() + /address/add");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
