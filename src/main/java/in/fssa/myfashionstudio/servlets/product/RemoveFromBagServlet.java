package in.fssa.myfashionstudio.servlets.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.model.Bag;

/**
 * Servlet implementation class RemoveFromBagServlet
 */
@WebServlet("/removefrombag")
public class RemoveFromBagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("product_id"));
		int sizeId = Integer.parseInt(request.getParameter("size_id"));

		ArrayList<Bag> bagList = (ArrayList<Bag>) request.getSession().getAttribute("bag_list");

		if (bagList != null) {
			for (Bag item : bagList) {
				if ((item.getProduct().getId() == productId) & (item.getPrice().getSize().getId() == sizeId)) {
					bagList.remove(bagList.indexOf(item));
					break;
				}
			}
			response.sendRedirect(request.getContextPath() + "/shoppingbag");
		} else {
			response.sendRedirect(request.getContextPath() + "/shoppingbag");
		}

	}
}
