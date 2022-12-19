package bo;

import bean.adminbean;
import dao.dangnhapAdmindao;

public class dangnhapAdminbo {
	dangnhapAdmindao dndao =  new dangnhapAdmindao();
	public adminbean ktdn(String tendn, String pass) {
		return dndao.ktdn(tendn, pass);
	}
}
