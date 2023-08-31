package in.fssa.myfashionstudio.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import in.fssa.myfashionstudioapp.model.Price;
import in.fssa.myfashionstudioapp.model.Product;
import in.fssa.myfashionstudioapp.model.Size;
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

		int productId = (int) request.getSession().getAttribute("product_id");
		;
		product.setId(productId);
		product.setName(request.getParameter("name"));
		product.setDescription(request.getParameter("description"));

		Category category = new Category(Integer.parseInt(request.getParameter("category")));
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
		PrintWriter out = response.getWriter();
		try {
			productService.updateProduct(product);
			out.println("Product updated successfully");
			// response.sendRedirect("product_list.jsp");
		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print(e.getMessage());
		}

		response.sendRedirect(request.getContextPath() + "/products");

	}

}
