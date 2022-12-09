package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.khachhangbo;

/**
 * Servlet implementation class khachhangController
 */
@WebServlet("/khachhangController")
public class khachhangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public khachhangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		khachhangbo tk = new khachhangbo();
		String tenkh = request.getParameter("uname");
		String username = request.getParameter("txtun");
		String password = request.getParameter("txtpass");
		String email = request.getParameter("email");
		String sdt = request.getParameter("phone");
		if (username != null && password != null ) {
			if (tk.checkKhachHang(username, password)==0) {
				tk.addKhachHang(tenkh, username, password, email, sdt);
//			if (session.getAttribute("DangNhap") != null)
//					session.setAttribute("DangNhap", "");
//				session.setAttribute("DangNhap", tk.getTenKhachHang(un, pass));
//				response.sendRedirect("htsachController");
				RequestDispatcher rd = request.getRequestDispatcher("dangnhapController");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("htgiay.jsp");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("htgiay.jsp");
			rd.forward(request, response);
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
