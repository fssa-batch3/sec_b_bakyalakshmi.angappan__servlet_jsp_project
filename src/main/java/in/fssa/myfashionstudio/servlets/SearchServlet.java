package in.fssa.myfashionstudio.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.dto.ProductDTO;
import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.model.SearchParameters;
import in.fssa.myfashionstudioapp.service.ProductService;
import in.fssa.myfashionstudioapp.util.SearchQueryUtil;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String searchInput = request.getParameter("q");

		searchInput = SearchQueryUtil.sanitizeText(searchInput);

		SearchParameters searchParameters = SearchQueryUtil.processSearchQuery(searchInput);

		ProductService productService = new ProductService();
		try {

			List<ProductDTO> productList = new ArrayList<>();

			// if search input is only gender

			SearchParameters categoryFromSearch = ForSpecificGenderAndCategory(searchParameters);
			SearchParameters genderFromSearch = ForSpecificGender(searchParameters);

			if ((categoryFromSearch.getCategory() != null) && (categoryFromSearch.getGender() != null)) {

				productList = productService.findProductsByGenderNameAndCategoryName(categoryFromSearch.getGender(),
						categoryFromSearch.getCategory());

				request.setAttribute("categoryName", categoryFromSearch.getCategory());
				request.setAttribute("genderName", categoryFromSearch.getGender());
			} else if (genderFromSearch != null) {
				productList = productService.findProductsByGenderName(genderFromSearch.getGender());
				request.setAttribute("categoryName", "all");
				request.setAttribute("genderName", genderFromSearch.getGender());
			} else {
				productList = productService.findProductsByProductName(searchInput);
			}

			request.setAttribute("productList", productList);

			request.getRequestDispatcher("product_list.jsp").forward(request, response);

		} catch (

		ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static SearchParameters ForSpecificGender(SearchParameters InputsearchParameters) {

		SearchParameters searchParam = InputsearchParameters;
		if (searchParam.getGender().equals("men") && (searchParam.getCategory() == null)
				&& (searchParam.getColor() == null) && searchParam.getMinPrice() == 0
				&& searchParam.getMaxPrice() == 0) {
			return searchParam;
		} else if (searchParam.getGender().equals("women") && (searchParam.getCategory() == null)
				&& (searchParam.getColor() == null) && searchParam.getMinPrice() == 0
				&& searchParam.getMaxPrice() == 0) {
			return searchParam;
		}

		return null;

	}

//	private static boolean isForMen(SearchParameters searchParameters) {
//		return searchParameters.isForMen() && !searchParameters.isForWomen()
//				&& (searchParameters.getCategory() == null || searchParameters.getCategory().isEmpty())
//				&& (searchParameters.getColor() == null || searchParameters.getColor().isEmpty())
//				&& searchParameters.getMinPrice() == 0 && searchParameters.getMaxPrice() == 0;
//
//	}
//
//	private static boolean isForWomen(SearchParameters searchParameters) {
//		return searchParameters.isForWomen() && !searchParameters.isForWomen()
//				&& (searchParameters.getCategory() == null || searchParameters.getCategory().isEmpty())
//				&& (searchParameters.getColor() == null || searchParameters.getColor().isEmpty())
//				&& searchParameters.getMinPrice() == 0 && searchParameters.getMaxPrice() == 0;
//
//	}

	private static SearchParameters ForSpecificGenderAndCategory(SearchParameters InputsearchParameters) {
		SearchParameters searchParam = InputsearchParameters;
		if (searchParam.getGender().equals("men") && (searchParam.getCategory() != null)
				&& (searchParam.getColor() == null) && searchParam.getMinPrice() == 0 && searchParam.getMaxPrice() == 0)
			return searchParam;
		else if (searchParam.getGender().equals("women") && (searchParam.getCategory() != null)
				&& (searchParam.getColor() == null) && searchParam.getMinPrice() == 0 && searchParam.getMaxPrice() == 0)
			return searchParam;

		return searchParam;
	}

}
