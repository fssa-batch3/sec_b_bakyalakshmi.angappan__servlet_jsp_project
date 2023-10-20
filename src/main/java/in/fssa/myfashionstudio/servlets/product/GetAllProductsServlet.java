package in.fssa.myfashionstudio.servlets.product;

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
import in.fssa.myfashionstudioapp.model.Category;
import in.fssa.myfashionstudioapp.service.CategoryService;
import in.fssa.myfashionstudioapp.service.ProductService;

@WebServlet("/products")

public class GetAllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* request.getRequestDispatcher("/loading.jsp").forward(request, response); */

		String a = request.getParameter("p");
		int p = 0;
		if (a != null) {
			p = Integer.parseInt(request.getParameter("p"));
		} else {
			p = 1;
		}

		int limit = 4;
		int startId = 1 + (p - 1) * limit;
		int endId = limit + (p - 1) * limit;

		String category = request.getParameter("category");
		System.out.println("category " + category);

		ProductService productService = new ProductService();
		CategoryService categoryService = new CategoryService();
		try {
			Category cateGender = null;
			if (category != null) {

				cateGender = categoryService.findCategoryByCategoryId(Integer.parseInt(category));
			}

			List<ProductDTO> productList;
			if (category != null) {
				int categoryId = Integer.parseInt(request.getParameter("category"));

				productList = productService.findAllProductsByCategoryId(categoryId, startId, endId);

			} else {
				productList = productService.getAllProducts(startId, endId);

				for (ProductDTO product : productList) {
					System.out.println(product);
				}
			}
			request.setAttribute("category", cateGender);

			request.setAttribute("productList", productList);

			request.getRequestDispatcher("/product_list.jsp").forward(request, response);
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}
}
