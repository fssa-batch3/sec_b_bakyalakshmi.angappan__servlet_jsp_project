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
		product.setName(request.getParameter("name"));
		product.setDescription(request.getParameter("description"));
		product.getCategory().setId(Integer.parseInt(request.getParameter("category")));

		Price price = new Price();
		Size size = new Size(Integer.parseInt(request.getParameter("size")));
		price.setSize(size);
		price.setPrice(Double.parseDouble(request.getParameter("price")));

		List<Price> productList = product.getPriceList();
		productList.add(price);
		product.setPriceList(productList);

		ProductService productService = new ProductService();
		PrintWriter out = response.getWriter();

		try {
			productService.createProduct(product);
			out.println("Product created successfully");
			// response.sendRedirect("product_list.jsp");
		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print(e.getMessage());
		}

		response.sendRedirect(request.getContextPath() + "/products");

	}

}
