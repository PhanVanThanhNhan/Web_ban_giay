package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class khachhangdao {
	public int checkkhachhang(String tk, String mk) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from khachhang where tendn = ? and password = ?";
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

	public String gettenkhachhang(String tk, String mk) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select hoten from khachhang where tendn = ? and password = ?";
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

	public int addkhachhang(String hoTen, String diaChi, String sdt, String email, String tk, String mk) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into khachhang values (?, ?, ?, ?, ?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, hoTen);
			cmd.setString(2, tk);
			cmd.setString(3, mk);
			cmd.setString(4, email);
			cmd.setString(5, sdt);
			cmd.setString(6, diaChi);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public String getmakhachhang(String tdn) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select makh from khachhang\r\n"
					+ "where tendn = ?";
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
