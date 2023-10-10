package in.fssa.myfashionstudio.servlets.product.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.dto.OrderDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.Address;
import in.fssa.myfashionstudioapp.model.Bag;
import in.fssa.myfashionstudioapp.model.OrderItem;
import in.fssa.myfashionstudioapp.model.User;
import in.fssa.myfashionstudioapp.service.OrderService;
import in.fssa.myfashionstudioapp.service.UserService;

/**
 * Servlet implementation class placeOrderServlet
 */
@WebServlet("/placeorder")
public class placeOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		List<Bag> bagList = (List<Bag>) session.getAttribute("bag_list");

		int userId = (int) session.getAttribute("userId");

		double totalPrice = (double) session.getAttribute("total_price");

		int deliveryAddressId = 0; // Initialize to 0 by default

		String deliveryAddressIdParam = request.getParameter("delivery_address_id");
		if (deliveryAddressIdParam != null && !deliveryAddressIdParam.isEmpty()) {
			try {
				deliveryAddressId = Integer.parseInt(deliveryAddressIdParam);
			} catch (NumberFormatException e) {

				response.sendRedirect(request.getContextPath() + "/shoppingbag");
			}
		}

		UserService userService = new UserService();
		User user = null;

		try {

			user = userService.findById(userId);

			OrderService orderService = new OrderService();

			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setUser(user);

			Address deliveryAddress = new Address(deliveryAddressId);
			orderDTO.setAddress(deliveryAddress);

			orderDTO.setTotalPrice(totalPrice);

			List<OrderItem> orderItemList = new ArrayList<>();

			for (Bag bag : bagList) {
				OrderItem orderItem = new OrderItem();
				orderItem.setProduct(bag.getProduct());
				orderItem.setPrice(bag.getPrice());
				orderItem.setQuantity(bag.getQuantity());

				orderItemList.add(orderItem);
			}

			orderDTO.setOrderItemList(orderItemList);

			orderService.createOrder(orderDTO);

			RequestDispatcher rd = request.getRequestDispatcher("/orders");
			rd.forward(request, response);

			session.removeAttribute("bag_list");

		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
