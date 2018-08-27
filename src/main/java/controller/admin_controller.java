package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Admin;

import jsonInfo.jsonInfo;
import jsonInfo.searchInfo;
import service.admin_service;


@Controller
@RequestMapping("admin")
public class admin_controller {
	@Autowired
	admin_service service;
	
	@RequestMapping(value="admin-list",params= {"txt"})
	public void search(Integer select,String txt,ModelMap m,Admin ad,searchInfo info) {
		 if(select==null)select=0;
	  		String where="";
	  		if(txt!=null&&txt.length()>0){
	  			switch (select) {
	  			case 1:
	  				where=" where status ="+txt+" ";
	  				break;
	 			default:
	  				where=" where name like '%"+txt+"%'";
	  			}
	   		}
	  		info.setWhere(where);
	  		 m.put("select",select);
	  		 m.put("txt",select==0?"'"+txt+"'":txt);
	  		 m.put("status",ad.statuss);
	         m.put("counts",service.count(info));
	         info.can(true);
		     m.put("list",service.select(info));
	}
      @RequestMapping("admin-list")
	public void select(ModelMap m,Admin ad,searchInfo info) {
    	  m.put("searchInfo",info);
  		 m.put("status",ad.statuss);
         m.put("counts",service.count(info));
	     m.put("list",service.select(info));
	}
      @RequestMapping("update_off")
      public @ResponseBody List<Admin> update_off(Integer id) {
 		 service.update_off(id);
		 List<Admin> list=service.byId(id);
		 return list;
	}
      @RequestMapping("update_on")
      public  @ResponseBody List<Admin> update_on(Integer id) {
		 service.update_on(id);
		 List<Admin> list=service.byId(id);
		 return list;
	}
      @RequestMapping("insert")
      public @ResponseBody jsonInfo insert(Admin ad) {
    		service.insert(ad);
    	  return new jsonInfo(1, "");
	}
      @RequestMapping("update")
      public @ResponseBody jsonInfo update(Admin ad) {
     	 service.update(ad);
    	 return new jsonInfo(1, "");
	}
      @RequestMapping("add")
      public String add(ModelMap m,Admin ad) {
        m.put("sexs",ad.sexs);
 		m.put("powers",ad.powers);
		return "admin/admin-add";
	}
      @RequestMapping("edit")
      public String edit(int id,ModelMap m,Admin ad) {
		m.put("info",service.byId(id).get(0));
    	  return add(m, ad);
	}
    
      @RequestMapping("editpass")
      public String editpass(int id,ModelMap m,Admin ad) {
		m.put("info",service.byId(id).get(0));
    	  return "admin/admin-password-edit";
	}
      @RequestMapping("updatepass")
      public @ResponseBody jsonInfo pass(Admin ad) {
		  service.updatepass(ad);
    	  return new jsonInfo(1, "");
	}
      
      
}
