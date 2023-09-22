package in.fssa.myfashionstudio.servlets.product.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.dto.OrderDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.service.OrderService;

/**
 * Servlet implementation class GetAllOrdersByUserIdServlet
 */
@WebServlet("/orders")

public class GetAllOrdersByUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handle POST logic for order creation

//		// Redirect to "orders" servlet
		response.sendRedirect(request.getContextPath() + "/orders");
//		
//		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in get method");

		HttpSession session = request.getSession(false);

		int userId = 0;
		if (session != null) {
			userId = (int) session.getAttribute("userId");
		}

		OrderService orderService = new OrderService();
		List<OrderDTO> orderDTOList = new ArrayList<>();
		try {
			orderDTOList = orderService.getAllOrdersByUserId(userId);

			request.setAttribute("orderList", orderDTOList);

			System.out.println(orderDTOList);

			// check the delivery date greater than the current date

			// if so call a method to update the delivered status

			request.getRequestDispatcher("/order_list.jsp").forward(request, response);

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}

}
