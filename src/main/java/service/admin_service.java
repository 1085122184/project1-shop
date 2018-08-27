package service;

import java.util.List;

import entity.Admin;
import jsonInfo.searchInfo;

public interface admin_service {
	public List<Admin> selectAll();
	public List<Admin> selectbynike(Admin a);
	public List<Admin> select(searchInfo info);
	 public String count(searchInfo info);
	public void update_off(Integer id);	
	public void update_on(Integer id);	
	public void insert(Admin ad);
	public List<Admin> byId(int id);
	public void update(Admin ad);
	public void updatepass(Admin ad);
}
