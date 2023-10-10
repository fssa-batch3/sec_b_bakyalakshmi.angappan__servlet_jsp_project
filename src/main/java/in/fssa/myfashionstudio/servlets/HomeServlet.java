package in.fssa.myfashionstudio.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * HttpSession session = request.getSession();
		 * 
		 * session.invalidate();
		 */

		// get all categories

		// get all products

//		ProductService productService = new ProductService();
//		List<ProductDTO> productList;
//		try {
//			productList = productService.getAllProducts();
//
//			request.setAttribute("productList", productList);
//
//			request.getRequestDispatcher("/index.jsp").forward(request, response);
//
//		} catch (ValidationException | ServiceException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		request.getRequestDispatcher("/index.jsp").forward(request, response);

	}

}
