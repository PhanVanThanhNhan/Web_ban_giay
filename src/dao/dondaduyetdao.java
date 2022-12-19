package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.xacnhanbean;

public class dondaduyetdao {
	public ArrayList<xacnhanbean> ds = new ArrayList<xacnhanbean>();

	public ArrayList<xacnhanbean> getDonDuyet() {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from VDonDuyet";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int makh = rs.getInt("makh");
				String hoten = rs.getString("hoten");
				String tengiay = rs.getString("tengiay");
				long soluongmua = rs.getLong("SoLuongMua");
				long gia = rs.getLong("gia");
				long thanhtien = rs.getLong("ThanhTien");
				Date ngaymua = rs.getDate("NgayMua");
				boolean damua = rs.getBoolean("damua");
				int mahd = rs.getInt("MaHoaDon");
				int macthd = rs.getInt("MaChiTietHD");
				ds.add(new xacnhanbean(makh, hoten, tengiay, soluongmua, gia, thanhtien, ngaymua, damua, mahd, macthd));
			}
			rs.close();
			cs.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
