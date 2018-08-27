package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Admin;
import service.admin_service;

@Controller
public class login_controller {
    @Autowired
    admin_service service;
    @RequestMapping("admin-login")
    public String login(Admin a,HttpServletRequest req) throws IOException {
    	List<Admin> nikes = service.selectbynike(a);
    	   
    	    if(service.selectbynike(a).isEmpty()) {
    	    	return "login";
    	    }
    		if(a.getNike().equals(nikes.get(0).getNike())&&a.getPassword().equals(nikes.get(0).getPassword())) {
    			req.getSession().setMaxInactiveInterval(60);
    			req.getSession().setAttribute("nike",a.getNike());
    			req.getSession().removeAttribute("msg");
    			//System.out.println("1111"+req.getSession().getAttribute("msg"));
    			return "index";
    		}else {
    			req.getSession().setAttribute("msg", "用户名或密码错误请重新输入！");
    			//System.out.println("2222"+req.getSession().getAttribute("msg"));
    			return "login";
    		}
	}
    
    
}
