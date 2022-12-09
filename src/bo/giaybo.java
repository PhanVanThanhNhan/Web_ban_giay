package bo;

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

	public ArrayList<giaybean> TimMa(String maloai) {
		ArrayList<giaybean> tam = new ArrayList<giaybean>();
		for (giaybean s : ds) {
			if (s.getMaloai().equals(maloai)) {
				tam.add(s);
			}
		}
		return tam;
	}

	public ArrayList<giaybean> Tim(String key) {
		ArrayList<giaybean> tam = new ArrayList<giaybean>();
		for (giaybean s : ds)
			if (s.getTengiay().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getMaloai().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
	}
}
