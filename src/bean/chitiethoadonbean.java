package bean;

import java.io.Serializable;
import java.sql.Date;

public class chitiethoadonbean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int makh;
	private long soluong;
	private Date ngaymua;
	private String anh;
	private String tengiay;
	private long gia;
	private boolean damua;

	public chitiethoadonbean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public chitiethoadonbean(int makh, long soluong, Date ngaymua, String anh, String tengiay, long gia,
			boolean damua) {
		super();
		this.makh = makh;
		this.soluong = soluong;
		this.ngaymua = ngaymua;
		this.anh = anh;
		this.tengiay = tengiay;
		this.gia = gia;
		this.damua = damua;
	}

	public int getMakh() {
		return makh;
	}

	public void setMakh(int makh) {
		this.makh = makh;
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

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

}
