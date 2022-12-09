package bo;

import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	public String getTenKhachHang(String tk, String mk) {
		return khdao.getTenKhachHang(tk, mk);
	}
	public int checkKhachHang(String tk, String mk) {
		return khdao.checkKhachHang(tk, mk);
	}
	public void addKhachHang(String tenkh, String username, String password, String email, String sdt) {
		khdao.addKhachHang(tenkh, username, password, email, sdt);
	}
	public String getMaKhachHang(String un) {
		return khdao.getMaKhachHang(un);
	}
}
