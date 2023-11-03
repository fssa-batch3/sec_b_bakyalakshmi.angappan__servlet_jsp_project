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

		String pageNoFromURL = request.getParameter("p");
		int pageNo = 0;
		if (pageNoFromURL != null) {
			pageNo = Integer.parseInt(request.getParameter("p"));
		} else {
			pageNo = 1;
		}

		int limit = 4;
		int offset = (pageNo - 1) * limit;

		String category = request.getParameter("category");

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

				productList = productService.findAllProductsByCategoryId(categoryId, limit, offset);

			} else {
				productList = productService.getAllProducts(limit, offset);
			}

			request.setAttribute("category", cateGender);

			request.setAttribute("productList", productList);

			request.getRequestDispatcher("/product_list.jsp").forward(request, response);

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}
}
