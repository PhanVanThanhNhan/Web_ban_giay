package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.dangnhapAdminbo;

/**
 * Servlet implementation class adminktdnController
 */
@WebServlet("/adminktdnController")
public class adminktdnController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminktdnController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String un = request.getParameter("txtun");
		String pass = request.getParameter("txtpass");
		dangnhapAdminbo dnbo = new dangnhapAdminbo();
		adminbean dn = null;
		RequestDispatcher rd;
		if (un != null && pass != null) {
			// Tao doi tuong session
			HttpSession session = request.getSession();
			// Neu chua tao session
			if (session.getAttribute("admin") == null) {
				dn = new adminbean();
				// session.setAttribute("kh", kh);//Tao bien session dn
			}
			dn = dnbo.ktdn(un, pass);
			if (dn == null) {
				request.setAttribute("status", "failed");
				rd = request.getRequestDispatcher("admin.jsp");
			} else {
				session.setAttribute("admin", dn);
				rd = request.getRequestDispatcher("adminController");
			}
		} else
			rd = request.getRequestDispatcher("admin.jsp");

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
