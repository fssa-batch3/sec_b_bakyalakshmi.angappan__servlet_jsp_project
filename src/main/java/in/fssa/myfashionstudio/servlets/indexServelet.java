package in.fssa.myfashionstudio.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class indexServelet
 */
//@WebServlet("/index")
public class indexServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in index page");
		response.setContentType("text/html");

		try (PrintWriter out = response.getWriter()) {
			// Read the index.html content
			InputStream inputStream = getClass()
					.getResourceAsStream("sec_b_bakyalakshmi.angappan__corejava_project_2/index.html");
			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
			String line;
			while ((line = reader.readLine()) != null) {
				out.println(line);
			}
		} catch (IOException e) {
			// Handle exception
			e.printStackTrace();
		}
	}

}
