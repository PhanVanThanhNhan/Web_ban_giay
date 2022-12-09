package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.loaibo;
import bo.giaybo;
import bean.giaybean;

/**
 * Servlet implementation class htsachController
 */
@WebServlet("/htgiayController")
public class htgiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public htgiayController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loaibo loai = new loaibo();
		if (loai.getloai() != null) {
			request.setAttribute("dsloai", loai.getloai());
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		giaybo sdao = new giaybo();
		ArrayList<giaybean> dsgiay = sdao.getgiay();
		String maloai = request.getParameter("ml");
		String giaTriTimKiem = request.getParameter("txttk");
		if (maloai != null) {
			dsgiay = sdao.TimMa(maloai);
		} else {
			if (giaTriTimKiem != null)
				dsgiay = sdao.Tim(giaTriTimKiem);
		}

		if (dsgiay != null) {
			request.setAttribute("dsgiay", dsgiay);
		}
		RequestDispatcher rd = request.getRequestDispatcher("htgiay.jsp");
		rd.forward(request, response);
	}

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