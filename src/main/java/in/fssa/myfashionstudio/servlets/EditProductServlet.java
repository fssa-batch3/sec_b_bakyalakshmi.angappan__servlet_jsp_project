package in.fssa.myfashionstudio.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product/edit")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in edit servlet");

		int product_id = Integer.parseInt(request.getParameter("product_id"));

		request.getSession().setAttribute("product_id", product_id);

		System.out.println(product_id);
		request.setAttribute("product_id", product_id);

		String targetUrl = "/update_product.jsp";
		request.getRequestDispatcher(targetUrl).forward(request, response);
	}

}
