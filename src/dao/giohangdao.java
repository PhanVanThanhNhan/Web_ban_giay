package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class giohangdao {
	public int checkGiay(String magiay) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from GioHang where magiay = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, magiay);
			ResultSet rs = cmd.executeQuery();
			// B3: Duyệt qua tập dữ liệu lấy về
			while (rs.next()) {
				return rs.getInt(1);
			}

			// B4: Đóng rs và cn
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public void addGiay(String magiay, String tengiay, long gia, String anh, long soluong) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into GioHang values (?, ?, ?, ?, ?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, magiay);
			cmd.setString(2, tengiay);
			cmd.setLong(3, gia);
			cmd.setLong(4, gia*soluong);
			cmd.setString(5, anh);
			cmd.setLong(6, soluong);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateGiay(String magiay, long gia, long soLuong) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update GioHang set thanhtien = ?, soluong = ?  where magiay = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, gia*soLuong);
			cmd.setLong(2, soLuong);
			cmd.setString(3, magiay);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
