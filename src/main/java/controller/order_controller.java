package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Order;
import service.order_service;

@Controller
@RequestMapping("order")
public class order_controller {
	@Autowired
	order_service service;
	
    @RequestMapping("order-list")
	public void select(ModelMap m) {
		m.put("list",service.select());
	}
    @RequestMapping("agree")
    public @ResponseBody List<Order> agree(int id) {
    	service.agree(id);
    	List<Order> list = service.byId(id);
    	return list;
    }
    @RequestMapping("refuse")
    public @ResponseBody List<Order> refuse(int id) {
    	service.refuse(id);
    	List<Order> list = service.byId(id);
    	return list;
    }
    
}
