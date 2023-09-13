package in.fssa.myfashionstudio.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.service.ProductService;

/**
 * Servlet implementation class DeleteProductServlet
 */

@WebServlet("/product/delete")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String paramId = request.getParameter("product_id");
		ProductService productService = new ProductService();

		try {

			int id = Integer.parseInt(paramId);
			productService.deleteProduct(id);
			response.sendRedirect(request.getContextPath() + "/inventory");
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}