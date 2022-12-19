package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bo.giaybo;

/**
 * Servlet implementation class editGiayController
 */
@WebServlet("/editGiayController")
public class editGiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editGiayController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		giaybo s = new giaybo();
		String magiaycu = (String) session.getAttribute("magiaycu");
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		String nameimg = null;
		String mg = null;
		String tg = null;
		String dg = null;
		String sl = null;
		String nn = null;
		String ml = null;
		String dirUrl = request.getServletContext().getRealPath("") + File.separator + "images";

		// Xóa ảnh cũ trên server
		String image_cu = s.getImagePath(magiaycu);
		String fileImage = dirUrl + File.separator + image_cu;
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			for (FileItem fileItem : fileItems) {
				// thêm ảnh mới vào server
				if (!fileItem.isFormField()) {
					nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);
						try {
							if (fileImage.equals(fileImg))
								break;
							else {
								fileItem.write(file);
								Files.delete(Paths.get(fileImage));
							}
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
		s.editGiay(mg, tg, Long.parseLong(sl), Long.parseLong(dg), ml,  "images" + nameimg,
				Date.valueOf(nn), magiaycu);
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
