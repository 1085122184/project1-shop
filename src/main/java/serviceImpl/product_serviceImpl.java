package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.product_dao;
import entity.Product;
import service.product_service;
@Service
public class product_serviceImpl implements product_service{
    @Autowired
    product_dao dao;
	
	public void insert(Product p) {
       dao.insert(p);
	}

	public List<Product> select() {
		return dao.select();
	}

	public void update_off(int id) {
		dao.update_off(id);
		
	}

	public List<Product> byId(Integer id) {
		return dao.byId(id);
	}

	public void update_on(int id) {
        dao.update_on(id);		
	}

	public List<Product> byTypeid(int id) {
		return dao.byTypeid(id);
	}

	public List<Product> see(int id) {
		return dao.see(id);
	}

	public void update(Product p) {
		dao.update(p);
	}

	public void delete(int id) {
		dao.delete(id);
	}

}
