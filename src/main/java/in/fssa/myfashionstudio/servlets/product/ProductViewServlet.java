package in.fssa.myfashionstudio.servlets.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.dto.ProductDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.Bag;
import in.fssa.myfashionstudioapp.service.ProductService;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		List<Bag> bagList = (List<Bag>) session.getAttribute("bag_list");

		System.out.println("==========================>" + bagList);

		String productId = request.getParameter("product_id");

		Boolean existInBag = (Boolean) request.getAttribute("existInBag");

		System.out.println(existInBag);

		ProductService productService = new ProductService();

		try {
			ProductDTO product = productService.findProductDetailsByProductId(Integer.parseInt(productId));

			request.setAttribute("bagList", bagList);
			request.setAttribute("product", product);

			String targetUrl = "/product_detail.jsp";
			request.getRequestDispatcher(targetUrl).forward(request, response);

		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
