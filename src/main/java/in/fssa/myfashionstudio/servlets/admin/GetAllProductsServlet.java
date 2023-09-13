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

@WebServlet("/products")

public class GetAllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category");
		System.out.println(category);
		ProductService productService = new ProductService();
		try {
			List<ProductDTO> productList;
			if (category != null) {
				int categoryId = Integer.parseInt(request.getParameter("category"));

				productList = productService.findAllProductsByCategoryId(categoryId);

				for (ProductDTO product : productList) {
					System.out.println(product);
				}

			} else {
				productList = productService.getAllProducts();

				for (ProductDTO product : productList) {
					System.out.println(product);
				}
			}
			request.setAttribute("productList", productList);

			request.getRequestDispatcher("/product_list.jsp").forward(request, response);
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}
}
