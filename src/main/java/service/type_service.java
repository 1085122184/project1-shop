package service;

import java.util.List;

import entity.type;

public interface type_service {
	public List<type> select();
	public void insert(type t);
	public List<type> ById(int id);
	 
}
