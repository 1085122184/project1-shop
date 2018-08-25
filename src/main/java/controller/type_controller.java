package controller;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Admin;
import entity.Product;
import entity.type;
import jsonInfo.JsonUtil;
import jsonInfo.JsonUtil.JsonInfo;
import jsonInfo.jsonInfo;
import service.product_service;
import service.type_service;

@Controller
@RequestMapping("product")
public class type_controller {
	@Autowired
	type_service service;
	@Autowired
	product_service pservice;
	
	  @RequestMapping("product-category")
     public void select(ModelMap m) {
		m.put("list",JsonUtil.toString(service.select()));
	}
	  @RequestMapping("product-list")
	     public void select1(ModelMap m) {
			m.put("list",JsonUtil.toString(service.select()));
		}
	  @RequestMapping("product-llist")
	  public void selectproduct(ModelMap m) {
		  m.put("list",pservice.select());
	  }
	  @RequestMapping("product-list-typeid")         //根据类型id查询商品
	  public void productByid(ModelMap m,int id) {
		  m.put("list1",id);
		  m.put("list",pservice.byTypeid(id));
	  }
	  @RequestMapping("insert")
	  public @ResponseBody jsonInfo insert(type t) {
		service.insert(t);
		return new jsonInfo(1, "");
	}
	 
	  @RequestMapping("product-insert")
	  public @ResponseBody jsonInfo productInsert(Product p) {
		pservice.insert(p);
		return new jsonInfo(1, "");
	}
	  @RequestMapping("product-update")
	  public  @ResponseBody jsonInfo productUpdate(Product p) {
		  System.out.println(111);
		  pservice.update(p);
		  return new jsonInfo(1, "");
	}
	  @RequestMapping("product-del")
	  public @ResponseBody jsonInfo delete(int id) {
		  pservice.delete(id);
		  return new jsonInfo(1, "");
	}
	  
	  
	  @RequestMapping("add")
	  public String add(ModelMap m,int id) {
		  m.put("list1",id);
		  return "product/product-category-add";
	}
	  
	  
	  @RequestMapping("product-add")
	  public String productadd(ModelMap m,int id) {
		  m.put("list1",service.ById(id).get(0));
		  return "product/product-add";
	}
	  @RequestMapping("product-edit")
	  public String productedit(Integer id,ModelMap m) {
		  m.put("info",pservice.byId(id).get(0));
		  return "product/product-add";
	}
	  @RequestMapping("update_off")
      public @ResponseBody List<Product> update_off(int id) {
 		 pservice.update_off(id);
		 List<Product> list=pservice.byId(id);
		 return list;
	}
	  
	  @RequestMapping("update_on")
      public @ResponseBody List<Product> update_on(int id) {
 		 pservice.update_on(id);
		 List<Product> list=pservice.byId(id);
		 return list;
	}
	  @RequestMapping("see")
	  public String see(int id,ModelMap m) {
		  
		  m.put("list",pservice.see(id));
		  
		return "product/product-see";
	}
}
