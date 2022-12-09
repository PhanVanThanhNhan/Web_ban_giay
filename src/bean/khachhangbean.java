package bean;

public class khachhangbean {
	private String makh;
	private String tenkh;
	private String username;
	private String password;
	private String email;
	private String sdt;
	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public khachhangbean(String makh, String tenkh, String username, String password, String email, String sdt) {
		super();
		this.makh = makh;
		this.tenkh = tenkh;
		this.username = username;
		this.password = password;
		this.email = email;
		this.sdt = sdt;
	}
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getTenkh() {
		return tenkh;
	}
	public void setTenkh(String tenkh) {
		this.tenkh = tenkh;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	
	
}
