package bo;

import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();

	public String GetTenkhachhang(String tk, String mk) {
		return khdao.gettenkhachhang(tk, mk);
	}

	public int Checkkhachhang(String tk, String mk) {
		return khdao.checkkhachhang(tk, mk);
	}

	public void Addkhachhang(String hoTen, String diaChi, String sdt, String email, String tk, String mk) {
		khdao.addkhachhang(hoTen, diaChi, sdt, email, tk, mk);
	}

	public String Getmakhachhang(String un) {
		return khdao.getmakhachhang(un);
	}
}
