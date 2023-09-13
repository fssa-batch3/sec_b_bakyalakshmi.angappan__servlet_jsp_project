package in.fssa.myfashionstudio.servlets.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.model.Bag;

/**
 * Servlet implementation class AddToBag
 */
@WebServlet("/user/bag")
public class AddToBag extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("product_id"));
		int sizeId = Integer.parseInt(request.getParameter("size_id"));

		ArrayList<Bag> bagList = new ArrayList<>();

		Bag bag = new Bag();
		bag.setId(productId);
		bag.getSize().setId(sizeId);
		bag.setQuantity(1);

		// if there is already a bag list this returns bag_list
		HttpSession httpSession = request.getSession();
		ArrayList<Bag> sessionBagList = (ArrayList<Bag>) httpSession.getAttribute("bag_list");

		System.out.println("session bag" + sessionBagList);

		PrintWriter out = response.getWriter();
		if (sessionBagList == null) {
			bagList.add(bag);
			httpSession.setAttribute("bag_List", bagList);

			System.out.println("session bag has been created ");
		} else {
			bagList = sessionBagList;

			boolean exist = false;

			for (Bag item : bagList) {

				if ((item.getId()) == productId && (item.getSize().getId()) == sizeId) {
					exist = true;
					out.println("product already exist");
					break;
				} else {
					bagList.add(bag);
					httpSession.setAttribute("bag_List", bagList);

					System.out.println("nsskms =====>" + request.getAttribute("bag_List"));

					out.println("product added");
				}

			}
		}

	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
