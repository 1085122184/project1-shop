package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.order_dao;
import entity.Order;
import service.order_service;
@Service
public class order_serviceImpl implements order_service{

	@Autowired
	order_dao dao;

	public List<Order> select() {
		return dao.select();
	}

	public void agree(int id) {
         dao.agree(id);
	}

	public List<Order> byId(int id) {
		return dao.byId(id);
	}

	public void refuse(int id) {
		dao.refuse(id);
	}
	

}
