package com.cqt.filter;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqt.commons.Const;
import com.cqt.commons.Constants;
import com.cqt.controller.base.BaseController;
import com.cqt.util.PropertiesUtil;

/**  
 * <p>Title: LoginFilter</p>  
 * <p>Description: 登录验证过滤器</p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class LoginFilter extends BaseController implements Filter {

	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		InputStream dictCfg = fc.getServletContext().getClassLoader().getResourceAsStream(Const.DICT_CFG_FILE_PATH);
		Properties pro = PropertiesUtil.getPro(dictCfg);
		Constants.setCQT_SFDM_BM(pro.getProperty("CQT.SFDM.BM", ""));
		Constants.setCQT_COMPANY_BM(pro.getProperty("CQT.COMPANY.BM", ""));
		Constants.setCQT_DQ_BM(pro.getProperty("CQT.DQ.BM", ""));
		Constants.setCQT_RYFL_BM(pro.getProperty("cQT.RYFL.BM", ""));
		
	}
	
	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		chain.doFilter(req, res); // 调用下一过滤器
	}

}
