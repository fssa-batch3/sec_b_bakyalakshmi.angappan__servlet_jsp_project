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
import in.fssa.myfashionstudioapp.model.Category;
import in.fssa.myfashionstudioapp.model.Gender;
import in.fssa.myfashionstudioapp.model.Price;
import in.fssa.myfashionstudioapp.model.Product;
import in.fssa.myfashionstudioapp.model.Size;
import in.fssa.myfashionstudioapp.service.CategoryService;
import in.fssa.myfashionstudioapp.service.ProductService;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/product/update")
public class UpdateProductServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDTO product = new ProductDTO();

		int productId = Integer.parseInt(request.getParameter("product_id"));
		;

		product.setId(productId);
		product.setImage(request.getParameter("image"));
		product.setName(request.getParameter("name"));
		product.setDescription(request.getParameter("description"));

		String categoryIddata = request.getParameter("category");

		int categoryId = -1;
		if (categoryIddata != null) {
			categoryId = Integer.parseInt(categoryIddata);

		}
		Category category = new Category();
		CategoryService categoryService = new CategoryService();

		Category categorydata = null;
		try {
			categorydata = categoryService.findCategoryByCategoryId(categoryId);
		} catch (ValidationException | ServiceException e) {

			e.printStackTrace();
		}

		Gender gender = new Gender(categorydata.getGender().getId());
		category.setGender(gender);
		category.setId(categoryId);

		product.setCategory(category);

		List<Price> priceList = product.getPriceList();

		Size size1 = new Size(Integer.parseInt(request.getParameter("size")));
		Product product1 = new Product(productId);
		Price price1 = new Price();
		price1.setSize(size1);
		price1.setPrice(Double.parseDouble(request.getParameter("price")));
		price1.setProduct(product1);

		priceList.add(price1);

		product.setPriceList(priceList);

		ProductService productService = new ProductService();

		try {
			productService.updateProduct(product);
			response.sendRedirect(request.getContextPath() + "/inventory");
		} catch (ValidationException | ServiceException e) {
			String errorMessage = "?error=" + e.getMessage();
			response.sendRedirect(request.getContextPath() + "/product/edit" + errorMessage);
			e.printStackTrace();

		}

	}

}
