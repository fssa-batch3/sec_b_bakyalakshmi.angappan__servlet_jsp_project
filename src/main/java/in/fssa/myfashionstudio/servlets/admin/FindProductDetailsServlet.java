package in.fssa.myfashionstudio.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.dto.ProductDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.service.ProductService;

/**
 * Servlet implementation class FindProductDetails
 */
@WebServlet("/product/details")
public class FindProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productId = request.getParameter("product_id");

		ProductService productService = new ProductService();

		try {
			ProductDTO product = productService.findProductDetailsByProductId(Integer.parseInt(productId));

			request.setAttribute("product", product);

			String targetUrl = "/product_details.jsp";
			request.getRequestDispatcher(targetUrl).forward(request, response);

		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
