package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.khachhangbo;

/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhapController")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		khachhangbo tk = new khachhangbo();
		String un = request.getParameter("txtun");
		String pass = request.getParameter("txtpass");

		session.setAttribute("makh", tk.getMaKhachHang(un));
		if (un != null && pass != null) {
			
			if (tk.checkKhachHang(un, pass)==1) {
				if (session.getAttribute("DangNhap") != null)
					session.setAttribute("DangNhap", "");
				session.setAttribute("DangNhap", tk.getTenKhachHang(un, pass));
				response.sendRedirect("htgiayController");
			}
			else {
				request.setAttribute("status", "failed");
				request.getRequestDispatcher("htgiayController").forward(request, response);
				}
		}
		else {
			request.setAttribute("status", "failed");
			request.getRequestDispatcher("htgiayController").forward(request, response);
	
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
