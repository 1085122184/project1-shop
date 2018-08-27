package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Admin;
import service.admin_service;

@Controller
public class login_controller {
    @Autowired
    admin_service service;
    @RequestMapping("admin-login")
    public String login(Admin a,HttpServletRequest req,String code,ModelMap m) throws IOException {
    	
    	List<Admin> nikes = service.selectbynike(a);
    	    String  session=(String) req.getSession().getAttribute("randomCode");
    	    if(service.selectbynike(a).isEmpty()||!session.equalsIgnoreCase(code)) {
    	    	req.getSession().setAttribute("msg", "验证码错误！");
    	    	return "login";
    	    }else if(service.selectbynike(a).isEmpty()||nikes.get(0).getStatus()==1) {
    	    	req.getSession().setAttribute("msg", "账户已冻结！");
    	    	return "login";
    	    }
    	    
    	    else if(a.getMd5().equals(nikes.get(0).getPassword())&&session.equalsIgnoreCase(code)) {
    	    	req.getSession().setMaxInactiveInterval(60);
    			req.getSession().setAttribute("nike",a.getNike());
    			req.getSession().removeAttribute("msg");
    			m.put("list",service.selectbynike(a).get(0));
    			return "index";
    		}else {
    			req.getSession().setAttribute("msg", "用户名或密码错误请重新输入！");
   			return "login";
    		}
	}
    
    
}
