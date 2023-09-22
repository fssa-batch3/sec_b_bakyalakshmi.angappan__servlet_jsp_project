package in.fssa.myfashionstudio.servlets.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.myfashionstudioapp.dto.ProductDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.exception.ValidationException;
import in.fssa.myfashionstudioapp.model.Bag;
import in.fssa.myfashionstudioapp.model.Price;
import in.fssa.myfashionstudioapp.model.Size;
import in.fssa.myfashionstudioapp.service.PriceService;
import in.fssa.myfashionstudioapp.service.ProductService;
import in.fssa.myfashionstudioapp.service.SizeService;

/**
 * Servlet implementation class AddToBag
 */
@WebServlet("/user/bag")
public class AddToBag extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get productId

		int productId = Integer.parseInt(request.getParameter("product_id"));

		// get sizeId

		int sizeId = Integer.parseInt(request.getParameter("size_id"));

		ArrayList<Bag> bagList = new ArrayList<>();

		PriceService PriceService = new PriceService();
		Price price = null;
		try {
			price = PriceService.findPriceByProductIdAndSizeId(productId, sizeId);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// call service get the details by product id
		ProductService productService = new ProductService();
		ProductDTO foundProduct = null;
		try {
			foundProduct = productService.findProductDetailsByProductId(productId);
		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SizeService sizeService = new SizeService();
		Size foundSize = null;

		try {
			foundSize = sizeService.FindSizeBySizeId(sizeId);
		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Size size = new Size();
		size.setId(sizeId);
		size.setValue(foundSize.getValue());

		price.setSize(size);

		Bag Bag = new Bag();

		// set the product
		Bag.setProduct(foundProduct);
		Bag.setPrice(price);
		Bag.setQuantity(1);

		// if there is already a bag list this returns bag_list
		HttpSession httpSession = request.getSession();

		ArrayList<Bag> sessionBagList = (ArrayList<Bag>) httpSession.getAttribute("bag_list");

		PrintWriter out = response.getWriter();
		if (sessionBagList == null) {
			bagList.add(Bag);
			httpSession.setAttribute("bag_list", bagList);

			System.out.println("session bag has been created ");

			response.sendRedirect(request.getContextPath() + "/shoppingbag");
		} else {

			bagList = sessionBagList;

			boolean exist = false;

			for (Bag item : bagList) {

				if ((item.getProduct().getId()) == productId && (item.getPrice().getSize().getId()) == sizeId) {
					exist = true;
//					request.setAttribute("existInBag", exist);
//					request.getRequestDispatcher("/product").forward(request, response);
					out.println("product already exist");
					break;

				}
			}

			if (!exist) {

				bagList.add(Bag);
				System.out.println("product added");
				response.sendRedirect(request.getContextPath() + "/shoppingbag");
			}
		}
	}

}
