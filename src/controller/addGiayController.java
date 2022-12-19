package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bo.giaybo;

/**
 * Servlet implementation class addGiayController
 */
@WebServlet("/addGiayController")
public class addGiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addGiayController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if (request.getContentLength() <= 0) {
			RequestDispatcher rd = request.getRequestDispatcher("adminGiayController");
			rd.forward(request, response);
		}
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		String nameimg = null;
		giaybo s = new giaybo();
		String mg = null;
		String tg = null;
		String dg = null;
		String sl = null;
		String nn = null;
		String ml = null;
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
					// xử lý file
					nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") + File.separator + "images";
						System.out.println(dirUrl);
						File dir = new File(dirUrl);
						if (!dir.exists()) {// nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}

						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);// tạo file
						try {
							fileItem.write(file);// lưu file

						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else {
					String dulieu = fileItem.getFieldName();
					if (dulieu.equals("ma-giay"))
						mg = fileItem.getString();
					if (dulieu.equals("ten-giay"))
						tg = fileItem.getString();
					if (dulieu.equals("don-gia"))
						dg = fileItem.getString();
					if (dulieu.equals("so-luong"))
						sl = fileItem.getString();
					if (dulieu.equals("ngay-nhap"))
						nn = fileItem.getString();
					if (dulieu.equals("loai-giay"))
						ml = fileItem.getString();
				}
			}

		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		s.addGiay(mg, tg, Integer.parseInt(sl), Integer.parseInt(dg), ml, "images/" + nameimg, Date.valueOf(nn));
		RequestDispatcher rd = request.getRequestDispatcher("adminGiayController");
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
