package sma.stock.common.utils;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;

@Slf4j
public class RequestUtil {

    private String contextPath	= "";		// ContextPath
    private String servletPath		= "";		// ServletPath
    private String remoteAddr		= "";		// Remote Addr
    
    private String menuPath = "";

    public RequestUtil() {
    }

    public void setValue(HttpServletRequest request) {
        this.contextPath = request.getContextPath();
        this.servletPath = request.getServletPath();
        this.remoteAddr = request.getRemoteAddr();
        
		String path[] = request.getServletPath().split("/");
        this.menuPath =  path[1];
    }

    public String getContextPath() {
        return contextPath;
    }

    public void setContextPath(String contextPath) {
        this.contextPath = contextPath;
    }

    public String getServletPath() {
        return servletPath;
    }

    public void setServletPath(String servletPath) {
        this.servletPath = servletPath;
    }

    public String getRemoteAddr() {
        return remoteAddr;
    }

    public void setRemoteAddr(String remoteAddr) {
        this.remoteAddr = remoteAddr;
    }

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}
    
}
