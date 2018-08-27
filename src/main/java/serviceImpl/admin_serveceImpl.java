package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin_dao;
import entity.Admin;
import jsonInfo.searchInfo;
import service.admin_service;
@Service
public class admin_serveceImpl implements admin_service{
	@Autowired
	admin_dao dao;
	public List<Admin> select(searchInfo info) {
		return dao.select(info);
	}
	public void update_off(Integer id) {
        dao.update_off(id);
		}
	public void insert(Admin ad) {
       dao.insert(ad);
	}
	public void update_on(Integer id) {
		dao.update_on(id);
		
	}
	public String count(searchInfo info) {
		return dao.count(info);
	}
	public List<Admin> byId(int id) {
		return dao.byId(id);
	}
	public void update(Admin ad) {
       dao.update(ad);
	}
	public List<Admin> selectAll() {
		return dao.selectAll();
	}
	public List<Admin> selectbynike(Admin a) {
		return dao.selectbynike(a);
	}
	public void updatepass(Admin ad) {
         dao.updatepass(ad);	
	}
	

}
