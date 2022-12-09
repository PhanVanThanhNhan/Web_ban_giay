package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai(){
		   try {
		   ArrayList<loaibean> dsloai= new ArrayList<loaibean>();
		   //b1 : ket noi csdl
		   CoSodao cs = new CoSodao();
		   cs.KetNoi();
		   //b2: Lay du lieu ve
		   String sql ="select * from loaigiay";
		   PreparedStatement cmd = cs.cn.prepareStatement(sql);
		   ResultSet rs = cmd.executeQuery();
		   while(rs.next()) {
			  String maloai = rs.getString("maloai");
			  String tenloai = rs.getString("hanggiay");
			  dsloai.add(new loaibean(maloai, tenloai));
		   }
		   //b3: Dong rs va cn
		   rs.close();
		   cs.cn.close();   
		   return dsloai;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }
	}
}