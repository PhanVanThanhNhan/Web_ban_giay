package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.xacnhanbean;

public class xacnhandao {
	public ArrayList<xacnhanbean> getdanhsach() {
		try {
			// B1: Ket noi vao csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			// B2: Lay du lieu ve
			ArrayList<xacnhanbean> ds = new ArrayList<xacnhanbean>();
			String sql = "select * from VXacNhan";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			// B3: Duyet qua tap du lieu lay ve
			while (rs.next()) {

				long makh = rs.getLong("makh");
				String hoten = rs.getString("hoten");
				String tengiay = rs.getString("tengiay");
				long soluongmua = rs.getLong("SoLuongMua");
				long gia = rs.getLong("gia");
				long thanhtien = rs.getLong("ThanhTien");
				Date ngaymua = rs.getDate("NgayMua");
				boolean damua = rs.getBoolean("damua");
				long mahd = rs.getLong("MaHoaDon");
				long macthd = rs.getLong("MaChiTietHD");
				
				ds.add(new xacnhanbean(makh,hoten,tengiay,soluongmua,gia,thanhtien,ngaymua,damua,mahd,macthd));
			}
			// b4: Dong rs va cn
			rs.close();
			cs.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int XacNhan(long macthd) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update VXacNhan set damua = 1 where MaChiTietHD = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, macthd);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
