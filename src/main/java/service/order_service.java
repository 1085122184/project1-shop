package service;

import java.util.List;

import entity.Order;

public interface order_service {
	public List<Order> select();
	public void agree(int id);
	public void refuse(int id);
	public List<Order> byId(int id);
}
