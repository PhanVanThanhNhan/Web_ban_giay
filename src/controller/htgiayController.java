package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.giaybean;
import bo.giaybo;
import bo.loaibo;

/**
 * Servlet implementation class htgiayController
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loaibo loai = new loaibo();
		if(loai.getloai()!=null) {
			request.setAttribute("dsloai", loai.getloai());
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		giaybo gdao = new giaybo();
		String maloai = request.getParameter("ml");
		String giaTriTimKiem = request.getParameter("txttk");
		int count =0;
		int endPage=0;
		//Pagination
		String indexPage = request.getParameter("page");
		int page=1;
		if(indexPage!=null)
			page = Integer.parseInt(indexPage);
		ArrayList<giaybean> dsGiay = null;
		if(maloai == null && giaTriTimKiem == null) {
			dsGiay = gdao.pagingGiays(page);
			count = gdao.getTotalGiay();
			endPage = count/12;
			if(count % 12 != 0)
				endPage++;
		}
		if(maloai!=null) {
			dsGiay = gdao.pagingGiaysByMagiay(page, maloai);
			count = gdao.countGiayByMaLoai(maloai);
			endPage = count/12;
			if(count % 12 != 0)
				endPage++;
		}
		if(giaTriTimKiem!=null) {
			dsGiay = gdao.pagingGiaysBySearchValue(page, giaTriTimKiem);
			count = gdao.countGiaysBySearchValue(giaTriTimKiem);
			endPage = count/12;
			if(count % 12 != 0)
				endPage++;
		}
		if(dsGiay!=null)
			request.setAttribute("dsgiay", dsGiay);
		
		request.setAttribute("endPage", endPage);
		request.setAttribute("tag", page);
		RequestDispatcher rd = request.getRequestDispatcher("htgiay.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
