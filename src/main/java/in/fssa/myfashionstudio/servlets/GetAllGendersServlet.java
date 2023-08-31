package in.fssa.myfashionstudio.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.myfashionstudioapp.exception.ServiceException;
import in.fssa.myfashionstudioapp.model.Gender;
import in.fssa.myfashionstudioapp.service.GenderService;

/**
 * Servlet implementation class GetAllGendersServlet
 */
@WebServlet("/index")
public class GetAllGendersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GenderService genderService = new GenderService();
		try {
			List<Gender> genderList = genderService.getAllGenders();

			request.setAttribute("genderList", genderList);
			String targetUrl = "/index.jsp";
			request.getRequestDispatcher(targetUrl).forward(request, response);

		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
