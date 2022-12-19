package bo;

import java.util.ArrayList;

import bean.giohangbean;
import dao.giohangdao;

public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();

	public void Them(String maGiay, String tenGiay, long soluong, long gia, String anh) {
		for (giohangbean g : ds) {
			if (g.getMagiay().equals(maGiay)) {
				g.setSoluong(soluong + g.getSoluong());
				return;
			}
		}
		ds.add(new giohangbean(maGiay, tenGiay, soluong, gia, anh));
	}

	public long TongTien() {
		long tongtien = 0;
		for (giohangbean g : ds) {
			tongtien += g.getThanhtien();
		}
		return tongtien;
	}

	public void SuaSoLuong(String maGiay, long soluong) {
//		for(giohangbean g : ds) {
//			if(g.getMasach().equals(maSach) && g.getSoluong()!=soluong)
//				g.setSoluong(soluong);
//			if(soluong==0)
//				Xoa(maSach);
//		}

		for (int i = 0; i < ds.size(); i++) {
			if (ds.get(i).getMagiay().equals(maGiay) && ds.get(i).getSoluong() != soluong)
				ds.get(i).setSoluong(soluong);
			if (soluong <= 0)
				Xoa(maGiay);
		}
	}

	public void Xoa(String maGiay) {
		for (int i = 0; i < ds.size(); i++) {
			if (ds.get(i).getMagiay().equals(maGiay)) {
				ds.remove(i);
			}
		}
	}

	public void XoaAll() {
		ds.removeAll(ds);
	}

	public void addSach(String masach, String tensach, long gia, String anh, long soluong) {
		giohangdao gh = new giohangdao();
		gh.addGiay(masach, tensach, gia, anh, soluong);
	}
}
