package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.chitiethoadonbean;

public class lichsudao {
	public ArrayList<chitiethoadonbean> getChiTietHoaDon(int mkh) {
		try {
			ArrayList<chitiethoadonbean> ds = new ArrayList<chitiethoadonbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from VLichSu where makh = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, mkh);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int makh = rs.getInt("makh");
				long soluong = rs.getLong("SoLuongMua");
				Date ngaymua = rs.getDate("NgayMua");
				String anh = rs.getString("anh");
				String tengiay = rs.getString("tengiay");
				long gia = rs.getLong("gia");
				boolean damua = rs.getBoolean("damua");
				ds.add(new chitiethoadonbean(makh, soluong, ngaymua, anh, tengiay, gia, damua));
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
