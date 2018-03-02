package com.cqt.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cqt.commons.Const;

/**  
 * <p>Title: WebAppContextListener</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class WebAppContextListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
	}

	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		Const.WEB_APP_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		//System.out.println("========获取Spring WebApplicationContext");
	}

}
