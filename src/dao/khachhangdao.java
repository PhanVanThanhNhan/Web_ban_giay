package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class khachhangdao {
	public int checkKhachHang(String tk, String mk) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from khachhang where username = ? and password = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tk);
			cmd.setString(2, mk);
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

	public String getTenKhachHang(String tk, String mk) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select tenkh from khachhang where username = ? and password = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tk);
			cmd.setString(2, mk);
			ResultSet rs = cmd.executeQuery();
			// B3: Duyệt qua tập dữ liệu lấy về
			while (rs.next()) {
				return rs.getString(1);
			}

			// B4: Đóng rs và cn
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void addKhachHang(String tenkh, String username, String password, String email, String sdt) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into khachhang values (?, ?, ?, ?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tenkh);
			cmd.setString(2, username);
			cmd.setString(3, password);
			cmd.setString(4, email);
			cmd.setString(5, sdt);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getMaKhachHang(String tdn) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select makh from khachhang\r\n"
					+ "where username = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tdn);
			ResultSet rs = cmd.executeQuery();
			while(rs.next())
				return rs.getString(1);
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
