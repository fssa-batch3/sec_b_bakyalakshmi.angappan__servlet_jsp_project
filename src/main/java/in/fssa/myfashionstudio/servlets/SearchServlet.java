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
import in.fssa.myfashionstudioapp.exception.PersistenceException;
import in.fssa.myfashionstudioapp.model.SearchParameters;
import in.fssa.myfashionstudioapp.service.SearchService;
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

		try {
			
			String pageNoFromUrl = request.getParameter("p");
			int pageNo= 0;
			if (pageNoFromUrl!= null) {
				pageNo= Integer.parseInt(request.getParameter("p"));
			} else {
				pageNo= 1;
			}

			int limit = 4;
			int offset = (pageNo-1)*limit;

			List<ProductDTO> productList = new ArrayList<>();

			searchInput = SearchQueryUtil.sanitizeText(searchInput);
			
			System.out.println(searchInput);

			SearchParameters searchParameters = SearchQueryUtil.processSearchQuery(searchInput);

			productList = SearchService.peformDynamicSearch(searchParameters ,limit ,offset);
			
			

			request.setAttribute("categoryName", searchParameters.getCategory());
			request.setAttribute("genderName", searchParameters.getGender());
			
			request.setAttribute("searchInput", searchInput);
			request.setAttribute("productList", productList);
		

			request.getRequestDispatcher("product_list.jsp").forward(request, response);

		} catch (PersistenceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
