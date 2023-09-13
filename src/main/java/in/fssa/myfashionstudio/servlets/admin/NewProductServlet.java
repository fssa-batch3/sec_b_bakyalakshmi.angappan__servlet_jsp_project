package in.fssa.myfashionstudio.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.model.Size;
import in.fssa.myfashionstudioapp.service.SizeService;

/**
 * Servlet implementation class NewProductServlet
 */
@WebServlet("/product/new")
public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String error = request.getParameter("error");
		System.out.println(error);

		SizeService sizeService = new SizeService();
		try {

			if (error != null && !error.isEmpty()) {

				List<Size> sizeList = sizeService.getAllSizes();
				String sizeListJson = new Gson().toJson(sizeList);

				request.setAttribute("sizeList", sizeListJson);

				request.setAttribute("error", error);
				request.getRequestDispatcher("/add_product.jsp").forward(request, response);
			}

			List<Size> sizeList = sizeService.getAllSizes();
			String sizeListJson = new Gson().toJson(sizeList);

			request.setAttribute("sizeList", sizeListJson);

			request.getRequestDispatcher("/add_product.jsp").forward(request, response);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
