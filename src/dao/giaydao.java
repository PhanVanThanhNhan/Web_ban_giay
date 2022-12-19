package dao;

import java.sql.Date;
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
				dsgiay.add(new giaybean(magiay,tengiay,anh,soluong,gia,maloai));
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
	public int getTotalGiays() {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "Select count(*) from giay";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
			rs.close();
			cs.cn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// count giay by maloai
	public int countGiaysByMaLoai(String ml) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "Select count(*) from giay where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ml);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
			rs.close();
			cs.cn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// count giay by search value
	public int countGiaysBySearchValue(String giaTriTimKiem) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "Select count(*) from giay where tengiay like CONCAT('%', ? , '%')";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, giaTriTimKiem);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
			rs.close();
			cs.cn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// get giay using pagination by magiay
	public ArrayList<giaybean> pagingGiaysByMagiay(int offset, String ml) {
		ArrayList<giaybean> dsgiay = new ArrayList<giaybean>();
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from giay" + " where maloai = ? "
					+ " order by magiay offset ? rows fetch next 12 rows only";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ml);
			cmd.setInt(2, (offset - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String magiay = rs.getString("magiay");
				String tengiay = rs.getString("tengiay");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				dsgiay.add(new giaybean(magiay,tengiay,anh,soluong,gia,maloai));
			}
			rs.close();
			cs.cn.close();
			return dsgiay;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// get giay using pagination with search value
	public ArrayList<giaybean> pagingGiaysBySearchValue(int offset, String giaTriTimKiem) {
		ArrayList<giaybean> dsgiay = new ArrayList<giaybean>();
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from giay" + " where tengiay like CONCAT('%', ? , '%') "
					+ " order by magiay offset ? rows fetch next 12 rows only";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, giaTriTimKiem);
			cmd.setInt(2, (offset - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String magiay = rs.getString("magiay");
				String tengiay = rs.getString("tengiay");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				dsgiay.add(new giaybean(magiay,tengiay,anh,soluong,gia,maloai));
			}
			rs.close();
			cs.cn.close();
			return dsgiay;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// get all giay using pagination
	public ArrayList<giaybean> pagingGiays(int offset) {
		ArrayList<giaybean> dsgiay = new ArrayList<giaybean>();
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from giay" + " order by magiay offset ? rows fetch next 12 rows only";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, (offset - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String magiay = rs.getString("magiay");
				String tengiay = rs.getString("tengiay");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				dsgiay.add(new giaybean(magiay,tengiay,anh,soluong,gia,maloai));
			}
			rs.close();
			cs.cn.close();
			return dsgiay;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**************** ADMIN *********************/
	public int addGiay(String mg, String tg, long sl, long g, String ml, String anh, Date nn) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into giay values (?,?,?,?,?,?,?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, mg);
			cmd.setString(2, tg);
			cmd.setString(3, anh);
			cmd.setLong(4, sl);
			cmd.setLong(5, g);
			cmd.setString(6, ml);			
			cmd.setDate(7, nn);		
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int deleteGiay(String mg) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "delete from giay where magiay = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, mg);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int editGiay(String mg, String tg, long sl, long g, String ml, String anh, Date nn,String mgmoi) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update giay set magiay = ?, tengiay = ?, soluong = ?, gia = ?, maloai = ?, "
					+ "anh = ?, NgayNhap = ? where magiay = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, mgmoi);
			cmd.setString(2, tg);
			cmd.setLong(3, sl);
			cmd.setLong(4, g);
			cmd.setString(5, ml);
			cmd.setString(6, anh);
			cmd.setDate(7, nn);
			cmd.setString(8, mg);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public String getImagePath(String mg) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select anh from giay where magiay = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, mg);
			ResultSet rs = cmd.executeQuery();
			while(rs.next())
				return rs.getString("anh");
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	public ArrayList<giaybean> getGiay(String mg) {
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
				Date ngaynhap = rs.getDate("NgayNhap");
				dsgiay.add(new giaybean(magiay,tengiay,anh,soluong,gia,maloai,ngaynhap));
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
