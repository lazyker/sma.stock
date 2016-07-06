package sma.stock.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import sma.stock.common.utils.RequestUtil;

public class DefaultRequestInterceptor implements HandlerInterceptor {
	protected Log log = LogFactory.getLog(DefaultRequestInterceptor.class);
	
	@Autowired
    private RequestUtil requestUtil;
	     
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	log.debug("Request URI \t: " + request.getRequestURI());
    	requestUtil.setValue(request);
        return true;
    }
     
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws Exception {
    }
}
