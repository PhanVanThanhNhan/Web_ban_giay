package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.giaybean;
import dao.giaydao;

public class giaybo {
	giaydao gdao = new giaydao();
	ArrayList<giaybean> ds;

	public ArrayList<giaybean> getgiay() {
		ds = gdao.getgiay();
		return ds;
	}

	public int getTotalGiay() {
		return gdao.getTotalGiays();
	}

	public int countGiayByMaLoai(String ml) {
		return gdao.countGiaysByMaLoai(ml);
	}

	public int countGiaysBySearchValue(String giaTriTimKiem) {
		return gdao.countGiaysBySearchValue(giaTriTimKiem);
	}

	public ArrayList<giaybean> pagingGiaysByMagiay(int offset, String ml) {
		return gdao.pagingGiaysByMagiay(offset, ml);
	}

	public ArrayList<giaybean> pagingGiaysBySearchValue(int offset, String giaTriTimKiem) {
		return gdao.pagingGiaysBySearchValue(offset, giaTriTimKiem);
	}

	public ArrayList<giaybean> pagingGiays(int offset) {
		return gdao.pagingGiays(offset);
	}

	/************** ADMIN *******************/
	public void addGiay(String mg, String tg, long sl, long g, String ml,  String anh, Date nn) {
		gdao.addGiay(mg, tg, sl, g, ml, anh, nn);
	}

	public ArrayList<giaybean> getsach() {
		ds = gdao.getgiay();
		return ds;
	}

	public void editGiay(String mg, String tg, long sl, long g, String ml, String anh, Date nn, String mgmoi) {
		gdao.editGiay(mg, tg, sl, g, ml,anh, nn, mgmoi);
	}

	public void deleteGiay(String mg) {
		gdao.deleteGiay(mg);
	}

	public String getImagePath(String mg) {
		String[] arr = gdao.getImagePath(mg).split("\\/");
		return arr[arr.length - 1];
	}

	public ArrayList<giaybean> getSach(String ms) {
		return gdao.getGiay(ms);
	}
}
