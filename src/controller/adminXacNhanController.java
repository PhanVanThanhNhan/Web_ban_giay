package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.xacnhanbo;

/**
 * Servlet implementation class adminXacNhanController
 */
@WebServlet("/adminXacNhanController")
public class adminXacNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminXacNhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		xacnhanbo xn = new xacnhanbo();
		HttpSession session = request.getSession();
		String hd = request.getParameter("hd");
		String macthd = request.getParameter("mcthd");
		if (hd != null) {
			if (hd.equals("xacnhan")) {
				long mcthd = Long.parseLong(macthd);
				xn.xacnhan(mcthd);
				session.setAttribute("xn", xn.getdanhsach());
			}
		} else {
			session.setAttribute("xn", xn.getdanhsach());
			
		}
//		session.setAttribute("xn", xn.getXacNhan());
		RequestDispatcher rd = request.getRequestDispatcher("adminXacNhan.jsp");
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
