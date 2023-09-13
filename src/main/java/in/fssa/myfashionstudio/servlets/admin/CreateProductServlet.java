package in.fssa.myfashionstudio.servlets.admin;

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
import in.fssa.myfashionstudioapp.model.Price;
import in.fssa.myfashionstudioapp.model.Size;
import in.fssa.myfashionstudioapp.service.ProductService;

@WebServlet("/product/create")

public class CreateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDTO product = new ProductDTO();
		product.setImage(request.getParameter("image"));
		product.setName(request.getParameter("name"));
		product.setDescription(request.getParameter("description"));
		product.getCategory().setId(Integer.parseInt(request.getParameter("category")));

		String[] sizes = request.getParameterValues("size");
		String[] prices = request.getParameterValues("price");

		List<Price> priceList = product.getPriceList(); // empty []

		if (sizes != null && prices != null && sizes.length == prices.length) {
			for (int i = 0; i < sizes.length; i++) {
				Size size = new Size(Integer.parseInt(sizes[i]));
				Price price = new Price();
				price.setSize(size);
				price.setPrice(Double.parseDouble(prices[i]));
				priceList.add(price);
			}

			product.setPriceList(priceList);

			ProductService productService = new ProductService();
			PrintWriter out = response.getWriter();
			try {
				productService.createProduct(product);
				out.println("Product created successfully");
				response.sendRedirect(request.getContextPath() + "/inventory");
			} catch (ValidationException | ServiceException e) {

				String errorMessage = "?error=" + e.getMessage();

				response.sendRedirect(request.getContextPath() + "/product/new" + errorMessage);
				e.printStackTrace();
			}

		}

	}
}
