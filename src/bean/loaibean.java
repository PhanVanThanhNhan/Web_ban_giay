package bean;

public class loaibean {
	private String maloai;
	private String hanggiay;
	
	
	public loaibean(String maloai, String hanggiay) {
		super();
		this.maloai = maloai;
		this.hanggiay = hanggiay;
	}


	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}


	public String getHanggiay() {
		return hanggiay;
	}
	public void setHanggiay(String hanggiay) {
		this.hanggiay = hanggiay;
	}
	
}
