package in.fssa.myfashionstudio.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.myfashionstudioapp.dto.ProductDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.Size;
import in.fssa.myfashionstudioapp.service.ProductService;
import in.fssa.myfashionstudioapp.service.SizeService;

@WebServlet("/product/edit")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String error = request.getParameter("error");
		System.out.println(error);

		int productId = Integer.parseInt(request.getParameter("product_id"));

		request.setAttribute("product_id", productId);

		System.out.println(productId);

		ProductService productService = new ProductService();
		SizeService sizeService = new SizeService();

		ProductDTO product;

		try {

			if (error != null && !error.isEmpty()) {

				List<Size> sizeList = sizeService.getAllSizes();
				String sizeListJson = new Gson().toJson(sizeList);

				request.setAttribute("sizeList", sizeListJson);

				request.setAttribute("error", error);
				request.getRequestDispatcher("/update_product.jsp").forward(request, response);
			}

			List<Size> sizeList = sizeService.getAllSizes();
			String sizeListJson = new Gson().toJson(sizeList); // Using Google Gson library to convert Java list to JSON
			request.setAttribute("sizeList", sizeListJson);

			product = productService.findProductDetailsByProductId(productId);

			request.setAttribute("product_id", productId);
			request.setAttribute("product", product);

			String targetUrl = "/update_product.jsp";
			request.getRequestDispatcher(targetUrl).forward(request, response);
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}

}
