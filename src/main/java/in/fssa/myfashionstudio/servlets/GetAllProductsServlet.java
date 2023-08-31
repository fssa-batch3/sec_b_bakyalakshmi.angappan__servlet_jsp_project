package in.fssa.myfashionstudio.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.dto.ProductDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.service.PriceService;
import in.fssa.myfashionstudioapp.service.ProductService;

/**
 * Servlet implementation class GetAllProducts
 */
@WebServlet("/products")
public class GetAllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService productService = new ProductService();
		try {
			List<ProductDTO> productList = productService.getAllProducts();

			PriceService priceService = new PriceService();
			request.setAttribute("productList", productList);

		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("product_list.jsp").forward(request, response);
	}

}
