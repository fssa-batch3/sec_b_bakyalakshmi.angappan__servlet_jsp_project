package in.fssa.myfashionstudio.servlets.product.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.dto.OrderDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.service.OrderService;

/**
 * Servlet implementation class FindOrderByOrderIdServlet
 */
@WebServlet("/order_details")
public class FindOrderByOrderIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindOrderByOrderIdServlet() {
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

		String orderId = request.getParameter("order_id");

		System.out.println(orderId);

		if (orderId != null) {

			OrderService orderService = new OrderService();

			OrderDTO order;
			try {
				order = orderService.FindOrderByOrderId(orderId);

				request.setAttribute("order", order);

				String targetUrl = "/order_details.jsp";
				request.getRequestDispatcher(targetUrl).forward(request, response);

			} catch (ValidationException | ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
