package com.cqt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cqt.commons.Const;
import com.cqt.commons.Jurisdiction;
import com.cqt.commons.SessionContext;
import com.cqt.entity.system.User;
import com.cqt.util.Tools;

/**  
 * <p>Title: LoginHandlerInterceptor</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
			return true;
		}else{
			User user = SessionContext.getUser();
			if(user!=null){
				path = path.substring(1, path.length());
				boolean b = Jurisdiction.hasJurisdiction(path);
				if(!b){
					response.sendRedirect(request.getContextPath() + Const.LOGIN);
				}else{
					//需要拦截的地址不是菜单地址，判断是否是直接输入的地址，是直接输入的地址跳转登录
					String referer = request.getHeader("REFERER");
					if(Tools.isEmpty(referer)) response.sendRedirect(request.getContextPath() + Const.LOGIN);
				}
				return b;
			}else{
				//登陆过滤
				response.sendRedirect(request.getContextPath() + Const.LOGIN);
				return false;		
			}
		}
	}
	
}
