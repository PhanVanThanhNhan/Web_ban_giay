package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.giaybean;

public class giaydao {
	public ArrayList<giaybean> dsgiay = new ArrayList<giaybean>();

	public ArrayList<giaybean> getgiay() {
		try {
			// b1 : ket noi csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			// b2: Lay du lieu ve
			String sql = "select * from giay";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String magiay = rs.getString("magiay");
				String tengiay = rs.getString("tengiay");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				dsgiay.add(new giaybean(magiay, tengiay, anh, soluong, gia, maloai));
			}
			// b3: Dong rs va cn
			rs.close();
			cs.cn.close();
			return dsgiay;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
