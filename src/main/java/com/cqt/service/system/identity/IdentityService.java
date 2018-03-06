package com.cqt.service.system.identity;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.system.Identity;

/**  
 * <p>Title: IdentityService</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Service("identityService")
public class IdentityService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<Identity> listAllIdentity() throws Exception{
		return (List<Identity>) dao.findForList("IdentityMapper.listAllIdentity", null);
	}
	

	public Identity findIdentityById(Long id) throws Exception {
		return (Identity) dao.findForObject("IdentityMapper.selectById", id);
	}
}
