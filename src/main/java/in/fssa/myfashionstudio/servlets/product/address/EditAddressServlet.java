package in.fssa.myfashionstudio.servlets.product.address;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.model.Address;
import in.fssa.myfashionstudioapp.service.AddressService;

/**
 * Servlet implementation class EditAddressServlet
 */
@WebServlet("/address/edit")
public class EditAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAddressServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in get");

		int addressId = Integer.parseInt(request.getParameter("address_id"));
		AddressService addressService = new AddressService();

		Address address = null;
		try {
			address = addressService.findAddressByAddressId(addressId);
		} catch (ServiceException e) {
			e.printStackTrace();
		}

		System.out.print("in address" + address);

		request.setAttribute("address", address);

		request.getRequestDispatcher("/edit_address.jsp").forward(request, response);
	}

}
