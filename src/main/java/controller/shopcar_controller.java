package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import service.shopcar_service;

@Controller
@RequestMapping("shopcar")
public class shopcar_controller {
	@Autowired
	shopcar_service service;
    @RequestMapping("selectshopcar")
	public String select(ModelMap m) {
		m.put("list", service.select());
    	return "shopcar/shopcar";
	}
	
	
}
