package bean;

import java.sql.Date;

public class lichsubean {
	private int makh;
	private String magiay;
	private long soluong;
	private Date ngaymua;
	private String anh;
	private String tengiay;
	private long gia;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsubean(int makh, String magiay, long soluong, Date ngaymua, String anh, String tengiay, long gia) {
		super();
		this.makh = makh;
		this.magiay = magiay;
		this.soluong = soluong;
		this.ngaymua = ngaymua;
		this.anh = anh;
		this.tengiay = tengiay;
		this.gia = gia;
	}
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getMagiay() {
		return magiay;
	}
	public void setMagiay(String magiay) {
		this.magiay = magiay;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getTengiay() {
		return tengiay;
	}
	public void setTengiay(String tengiay) {
		this.tengiay = tengiay;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	
}
