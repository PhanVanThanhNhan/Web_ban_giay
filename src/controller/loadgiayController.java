package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giaybo;
import bo.loaibo;

/**
 * Servlet implementation class loadgiayController
 */
@WebServlet("/loadgiayController")
public class loadgiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadgiayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		giaybo s =  new giaybo();
		HttpSession session = request.getSession();
		String magiay = request.getParameter("mg");
		session.setAttribute("magiaycu", magiay);
		String image_cu = s.getImagePath(magiay);
		session.setAttribute("anhcu", image_cu);
		request.setAttribute("listGiay", s.getSach(magiay));
		loaibo l = new loaibo();
		request.setAttribute("listLoai", l.getloai());
		RequestDispatcher rd = request.getRequestDispatcher("adminSuaGiay.jsp");
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
