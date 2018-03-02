package com.cqt.controller.system.dictionaries;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.xmlbeans.impl.common.IOUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqt.commons.Constants;
import com.cqt.commons.E;
import com.cqt.commons.IO;
import com.cqt.commons.SessionContext;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.system.User;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.system.dictionaries.DictionariesService;
import com.cqt.service.system.user.UserService;
import com.cqt.util.Tools;

import net.sf.json.JSONArray;

/**  
 * <p>Title: OrgController</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
@RequestMapping(value="/org")
public class OrgController extends BaseController {

	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	@Resource(name="userService")
	private UserService userService;
	
	/**
	 * 请求绑定,编辑用户机构信息
	 */
	@RequestMapping(value="/goUserOrg")
	public String goUserOrg(@RequestParam String userId,Model model)throws Exception{
		try{
			String orgId = SessionContext.getUser().getOrgId(); //组织ID
			
			if(Tools.notEmpty(userId)){
				User u = userService.getUserById(userId);	
				String uBm = u.getOrgBm(); //用户已分配的编码
				
				/**如果是对二级管理员分配机构，只能显示二级所有节点*/
				PageData pds= null;
				if(E.USER_TYPES.SYSTEM.name().toLowerCase().equals(u.getUserType())){
					pds = getOrgTree(orgId,null,uBm,1);
				}else{
					pds = getOrgTree(orgId,null,uBm,0);
				}
				JSONArray array = JSONArray.fromObject(pds.get("nodes"));
				String json = array.toString();
				json = json.replaceAll("bianma", "id").replace("zdName", "name");
				
				//System.out.println(json);
				model.addAttribute("user_orgs", json);
				model.addAttribute("userId", userId);
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return "system/org/org";
	}
	
	/**
	 * 保存用户机构信息
	 */
	@RequestMapping(value="/saveUserOrg")
	public void saveUserOrg(PrintWriter out)throws Exception{
		PageData pd = this.getPageData();
		try{
			//查询需要分配用户的信息
			String bm = pd.getString("bmIds");
			String orgId = pd.getString("orgIds");
			if(Tools.notEmpty(bm) && Tools.notEmpty(orgId)){
				pd.put("orgBm", bm);
				pd.put("orgId", orgId);
				userService.updateUserByPd(pd);
				out.write("success");
				out.close();
			}else{
				out.write("fail");
				out.close();
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}finally{
			IO.close(out);
		}
	}

	

	/**
	 * 获取指定PARENT_ID的下级机构及指定的chkBM为选中状态
	 */
	private PageData getOrgTree(String parentId, PageData pd, String chkBm,int loopNum){
		logBefore(logger, "递归");
		if(pd == null){
			pd = new PageData();
			pd.put("LOOPS", 0);
		}
		try {
			int loops = Integer.parseInt(pd.get("LOOPS").toString());
			if(loopNum>loops || loops==0){
				PageData pdps = new PageData();
				pdps.put("parentId", parentId);
				List<PageData> lstPD = dictionariesService.listByPid(pdps);//第一级节点
				loops++;
				if(lstPD != null && !lstPD.isEmpty()){
					for(PageData _pd : lstPD){
						if(loopNum>0){
							_pd.put("LOOPS", loops);
						}else{
							_pd.put("LOOPS", 0);
						}
						getOrgTree(_pd.getString("zdId"),_pd,chkBm,loopNum); //当前节点下指定循环次数的子节点
						//检查原有的机构信息
						System.out.println(_pd.getString("bianma"));
						
						if(null != chkBm && chkBm.equals(_pd.getString("bianma"))){
							_pd.put("checked", true);
						}
					}
				}
				pd.put("nodes", lstPD);
			}
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
		return pd;
	}
	
	/**
	 * 获取公司列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listCompany")
	@ResponseBody
	public PageData listCompany() throws Exception{
		PageData pd = new PageData();
		List<Map<String,Integer>> company = dictionariesService.listCompany(Constants.getCQT_COMPANY_BM());
		pd.put("company", company);
		return pd;
	}
}
