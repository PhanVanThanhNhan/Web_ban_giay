package bean;

import java.util.Date;

public class xacnhanbean {
	private long makh;
	private String hoten;
	private String tengiay;
	private long soluongmua;
	private long gia;
	private long thanhtien;
	private Date ngaymua;
	private boolean damua;
	private long mahd;
	private long macthd;
public xacnhanbean() {
	super();
	// TODO Auto-generated constructor stub
}
public xacnhanbean(long makh, String hoten, String tengiay, long soluongmua, long gia, long thanhtien, Date ngaymua,
		boolean damua, long mahd, long macthd) {
	super();
	this.makh = makh;
	this.hoten = hoten;
	this.tengiay = tengiay;
	this.soluongmua = soluongmua;
	this.gia = gia;
	this.thanhtien = thanhtien;
	this.ngaymua = ngaymua;
	this.damua = damua;
	this.mahd = mahd;
	this.macthd = macthd;
}
public long getMakh() {
	return makh;
}
public void setMakh(int makh) {
	this.makh = makh;
}
public String getHoten() {
	return hoten;
}
public void setHoten(String hoten) {
	this.hoten = hoten;
}
public String getTengiay() {
	return tengiay;
}
public void setTengiay(String tengiay) {
	this.tengiay = tengiay;
}
public long getSoluongmua() {
	return soluongmua;
}
public void setSoluongmua(long soluongmua) {
	this.soluongmua = soluongmua;
}
public long getGia() {
	return gia;
}
public void setGia(long gia) {
	this.gia = gia;
}
public long getThanhtien() {
	return thanhtien;
}
public void setThanhtien(long thanhtien) {
	this.thanhtien = thanhtien;
}
public Date getNgaymua() {
	return ngaymua;
}
public void setNgaymua(Date ngaymua) {
	this.ngaymua = ngaymua;
}
public boolean isDamua() {
	return damua;
}
public void setDamua(boolean damua) {
	this.damua = damua;
}
public long getMahd() {
	return mahd;
}
public void setMahd(int mahd) {
	this.mahd = mahd;
}
public long getMacthd() {
	return macthd;
}
public void setMacthd(int macthd) {
	this.macthd = macthd;
}


}
