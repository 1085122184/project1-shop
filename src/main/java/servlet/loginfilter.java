package servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginfilter implements Filter {
  private Set<String> prefixIignores = new HashSet<String>();
	public void destroy() {
		
	}

	public void doFilter(ServletRequest req1, ServletResponse resp1, FilterChain fc)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) req1;
		HttpServletResponse resp=(HttpServletResponse) resp1;
		    if(canIgnore(req)) {
		    	fc.doFilter(req, resp);
		    	return;
		    }
		    if(req.getSession().getAttribute("nike")!=null||req.getParameter("nike")!=null) {
				fc.doFilter(req, resp);
			}else {
				resp.sendRedirect("../login.jsp");
			}
		
	}

	public void init(FilterConfig c) throws ServletException {
		String ex=c.getInitParameter("ex");
		String[] ignoreArray = ex.split(",");
		for(String s:ignoreArray) {
			prefixIignores.add(s);
		}
	}
	private boolean canIgnore(HttpServletRequest request) {
		String url=request.getRequestURI();
		for(String ignore:prefixIignores) {
			if(url.endsWith(ignore)) {
				return true;
			}
		}return false;

	}
	
      
}
