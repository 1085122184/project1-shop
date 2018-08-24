package service;

import java.util.List;

import entity.Product;

public interface product_service {
	public List<Product> select();
	public void insert(Product p);
	public void update_off(int id);
	public void update_on(int id);
	public List<Product> byId(int id);
	public List<Product> byTypeid(int id);
	public List<Product> see(int id);
}
