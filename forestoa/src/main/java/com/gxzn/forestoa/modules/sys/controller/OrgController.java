package com.gxzn.forestoa.modules.sys.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Org;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.sys.service.OrgService;

/**
 * 组织controller
 * 
 * @CrossOrigin(origins = "*") 为跨域配置,支持跨域访问 origins： 允许可访问的域列表
 * @author HaiTao
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/orgController")
public class OrgController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "orgService")
	private OrgService orgService;

	/**
	 * 根据组织id查询组织树
	 * 
	 * @param oId
	 * @return
	 */
	@RequestMapping(value = "getOrgTree")
	public ResponseModel<List<Org>> getOrgTree(Long oId) {
		ResponseModel<List<Org>> rm = new ResponseModel<List<Org>>();
		try {
			rm.success("根据组织id查询组织树成功", orgService.getOrgTree(oId));
			logger.info(StrFormatterUtils.format("根据组织id查询组织树成功{}",JSON.toJSONString(oId)));

		} catch (Exception e) {
			rm.init("根据组织id查询组织树失败");
			logger.error("根据组织" + oId + "查询组织树失败", e);
		}
		return rm;
	}

	/**
	 * 根据组织id查询组织详细信息
	 * 
	 * @param oId
	 * @return
	 */
	@RequestMapping(value = "getOrgById")
	public ResponseModel<Org> getOrgById(Long oId) {
		ResponseModel<Org> rm = new ResponseModel<Org>();
		try {
			rm.success("根据组织id查询组织详细信息成功", orgService.getOrgById(oId));
			logger.info(StrFormatterUtils.format("根据组织id查询组织详细信息成功{}", JSON.toJSONString(oId)));
		} catch (Exception e) {
			rm.init("根据组织id查询组织详细信息失败");
			logger.error("根据组织" + oId + "查询组织详细信息失败", e);
		}
		return rm;
	}
	/**
	 * 获取所有组织
	 * @return
	 */
	@RequestMapping(value = "getALLOrg")
	public ResponseModel<List<Org>> getALLOrg() {
		ResponseModel<List<Org>> rm = new ResponseModel<List<Org>>();
		try {
			rm.success("获取所有组织成功", orgService.getALLOrg());
			logger.info(StrFormatterUtils.format("获取所有组织成功"));
		} catch (Exception e) {
			rm.init("获取所有组织失败");
			logger.error("获取所有组织失败", e);
		}
		return rm;
	}
	/**
	 * 保存组织信息
	 * 
	 * @param org
	 * @return
	 */
	@RequestMapping(value = "saveOrg")
	public ResponseModel<Integer> saveOrg(@RequestBody Org org) {
		ResponseModel<Integer> rm = new ResponseModel<Integer>();
		try {
			int flag=orgService.saveOrg(org);
			if(flag!=1) {
				rm.init("保存组织信息失败");
			}else {
				rm.success("保存组织信息成功", flag);
				logger.info("保存组织信息成功");
			}
			logger.info(StrFormatterUtils.format("保存组织信息成功{}", org));
		} catch (Exception e) {
			rm.init("保存组织信息失败");
			logger.error("保存组织" + org + "信息失败", e);
		}
		return rm;
	}

	/**
	 * 更新组织信息
	 * 
	 * @param org
	 * @return
	 */
	@RequestMapping(value = "updateOrg")
	public ResponseModel<Integer> updateOrg(@RequestBody Org org) {
		ResponseModel<Integer> rm = new ResponseModel<Integer>();
		try {
			rm.success("更新组织信息成功", orgService.updateOrg(org));
			logger.info(StrFormatterUtils.format("更新组织信息成功{}", org));
		} catch (Exception e) {
			rm.init("更新组织信息失败");
			logger.error("更新组织" + org + "信息失败", e);
		}
		return rm;
	}

	/**
	 * 通过oId删除组织信息
	 * 
	 * @param org
	 * @return
	 */
	@RequestMapping(value = "deleteOrg")
	public ResponseModel<Integer> deleteOrg(Long oId) {
		ResponseModel<Integer> rm = new ResponseModel<Integer>();
		try {
			rm.success("删除组织信息成功", orgService.deleteOrg(oId));
			logger.info(StrFormatterUtils.format("删除组织信息成功{}", JSON.toJSONString(oId)));
		} catch (Exception e) {
			rm.init("删除组织信息失败");
			logger.error("通过" + oId + "删除组织信息失败", e);
		}
		return rm;
	}

	/**
	 * 获取当前登录人的所属部门列表
	 * @return
	 */
	@RequestMapping(value = "getOrgByLogin")
	public ResponseModel<List<Org>> getOrgByLogin(HttpServletRequest request) {
		ResponseModel<List<Org>> rm = new ResponseModel<List<Org>>();
		logger.info("获取登录人所在部门列表");
		try {
			// 处理当前登录用户权限
			String user = (String) request.getSession().getAttribute("loginuser");
			Users loginUser = JSON.parseObject(user, Users.class);
			Long org1 = loginUser.getOrgId1();
			Long org2 = loginUser.getOrgId2();
			Long org3 = loginUser.getOrgId3();
			Map<String,Object> params=new HashMap<String, Object>();
			StringBuffer orgIds=new StringBuffer();
			if(org1!=null) {
				orgIds.append(org1);
				orgIds.append(",");
			}
			if(org2!=null) {
				orgIds.append(org2);
				orgIds.append(",");
			}
			if(org3!=null) {
				orgIds.append(org3);
				orgIds.append(",");
			}
			
			String q_oId = orgIds.toString();
			if (q_oId != null && q_oId.trim().length() > 0) {
				if (q_oId.endsWith(",")) {
					// 如果最后一个字符是，则把，删除掉
					q_oId = q_oId.substring(0, q_oId.length() - 1);
				}
			}
			params.put("orgIds", q_oId);
			rm.success("获取登录人所在部门列表成功", orgService.getOrgByLogin(params));
			logger.info("获取登录人所在部门列表");
		} catch (Exception e) {
			rm.init("获取登录人所在部门列表失败");
			logger.error("获取登录人所在部门列表失败", e);
		}
		return rm;
	}
}
