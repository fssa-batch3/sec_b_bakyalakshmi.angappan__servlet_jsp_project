package in.fssa.myfashionstudio.servlets.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.model.Bag;

/**
 * Servlet implementation class updateQuantityServlet
 */
@WebServlet("/updatequantity")
public class UpdateQuantityServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get the parameters from the form submission

		System.out.println("Sdsnjdhjs" + request.getParameter("product_id"));

		int productId = Integer.parseInt(request.getParameter("product_id"));
		System.out.println("productId" + productId);
		int sizeId = Integer.parseInt(request.getParameter("size_id"));
		System.out.println("sizeId" + sizeId);
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.println(quantity);

		// Get the HttpSession
		HttpSession session = request.getSession();

		// Retrieve the bag_list from the session
		List<Bag> bagList = (List<Bag>) session.getAttribute("bag_list");

		// Iterate through bagList and update the quantity for the matching product and
		// size
		for (Bag item : bagList) {
			if (item.getProduct().getId() == (productId) && (item.getPrice().getSize().getId() == (sizeId))) {
				item.setQuantity(quantity);
				break; // Assuming there's only one matching item
			}
		}

		// Update the session attribute
		session.setAttribute("bag_list", bagList);

		// Redirect to a success page or send a response if needed
		response.sendRedirect(request.getContextPath() + "/shoppingbag"); // Replace with your success page
	}
}
