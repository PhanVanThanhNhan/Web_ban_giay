package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.giaybo;

/**
 * Servlet implementation class DeleteGiayController
 */
@WebServlet("/DeleteGiayController")
public class DeleteGiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteGiayController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		giaybo gbo = new giaybo();
		String magiay = request.getParameter("mg");
		//Lấy ảnh từ db với magiay = magiay
		String image = gbo.getImagePath(magiay);
		String dirUrl = request.getServletContext().getRealPath("") + File.separator + "images";
		String fileImg = dirUrl + File.separator + image;
		try {
			Files.delete(Paths.get(fileImg));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		gbo.deleteGiay(magiay);
		response.sendRedirect("adminGiayController");}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
