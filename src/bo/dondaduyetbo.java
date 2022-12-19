package bo;

import java.util.ArrayList;

import bean.xacnhanbean;
import dao.dondaduyetdao;

public class dondaduyetbo {
	dondaduyetdao d = new dondaduyetdao();
	public ArrayList<xacnhanbean> getDonDuyet(){
		return d.getDonDuyet();
	}
}
