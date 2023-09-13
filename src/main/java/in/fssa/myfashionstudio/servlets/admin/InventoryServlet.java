package in.fssa.myfashionstudio.servlets.admin;

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
import in.fssa.myfashionstudioapp.service.ProductService;

/**
 * Servlet implementation class InventoryServlet
 */
@WebServlet("/inventory")
public class InventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService productService = new ProductService();
		try {
			List<ProductDTO> productList = productService.getAllProducts();
			request.setAttribute("productList", productList);

			request.getRequestDispatcher("/inventory.jsp").forward(request, response);
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}

}
