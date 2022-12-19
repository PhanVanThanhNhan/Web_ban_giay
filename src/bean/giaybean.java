package bean;

import java.sql.Date;

public class giaybean {
	private String magiay;
	private String tengiay;
	private String anh;
	private long soluong;
	private long gia;
	private String maloai;
	private Date NgayNhap;
	public giaybean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public giaybean(String magiay, String tengiay, String anh, long soluong, long gia, String maloai, Date ngayNhap) {
		super();
		this.magiay = magiay;
		this.tengiay = tengiay;
		this.anh = anh;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		NgayNhap = ngayNhap;
	}

	public giaybean(String magiay, String tengiay, String anh, long soluong, long gia, String maloai) {
		super();
		this.magiay = magiay;
		this.tengiay = tengiay;
		this.anh = anh;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
	}
	public String getMagiay() {
		return magiay;
	}
	public void setMagiay(String magiay) {
		this.magiay = magiay;
	}
	public String getTengiay() {
		return tengiay;
	}
	public void setTengiay(String tengiay) {
		this.tengiay = tengiay;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public Date getNgayNhap() {
		return NgayNhap;
	}
	public void setNgayNhap(Date ngayNhap) {
		NgayNhap = ngayNhap;
	}
	
	
}
