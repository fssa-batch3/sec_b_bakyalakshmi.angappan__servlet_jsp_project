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

		int productId = Integer.parseInt(request.getParameter("product_id"));
		int sizeId = Integer.parseInt(request.getParameter("size_id"));

		ArrayList<Bag> bagList = new ArrayList<>();

		PriceService PriceService = new PriceService();

		ArrayList<Price> priceList = new ArrayList<Price>();

		Price price = null;

		try {
			price = PriceService.findPriceByProductIdAndSizeId(productId, sizeId);

			priceList.add(price);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.print(priceList);

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

		Bag bag = new Bag();

		// set product
		bag.setId(productId);
		bag.setImage(foundProduct.getImage());
		bag.setName(foundProduct.getName());
		bag.setDescription(foundProduct.getDescription());
		bag.setPriceList(priceList);
		bag.setSize(size);
		bag.setQuantity(1);

		// if there is already a bag list this returns bag_list
		HttpSession httpSession = request.getSession();

		ArrayList<Bag> sessionBagList = (ArrayList<Bag>) httpSession.getAttribute("bag_list");

		PrintWriter out = response.getWriter();
		if (sessionBagList == null) {
			bagList.add(bag);
			httpSession.setAttribute("bag_list", bagList);

			System.out.println("session bag has been created ");

			response.sendRedirect(request.getContextPath() + "/shopping_bag.jsp");
		} else {

			bagList = sessionBagList;

			boolean exist = false;

			for (Bag item : bagList) {

				if ((item.getId()) == productId && (item.getSize().getId()) == sizeId) {
					exist = true;
					out.println("product already exist");
					break;

				}
			}

			if (!exist) {
				bagList.add(bag);
				System.out.println("product added");

				response.sendRedirect(request.getContextPath() + "/shopping_bag.jsp");

			}
		}
	}

}
