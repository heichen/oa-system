package com.gxzn.forestoa.modules.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.search.service.SearchService;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.sys.service.UsersService;
import com.gxzn.forestoa.modules.task.service.WorkTaskService;

/**
 * 统计查询
 * 
 * @author jiabo
 *
 */
	@RestController
@RequestMapping("search")
public class SearchController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "searchService")
	private SearchService searchService;

	@Resource(name = "UsersService")
	private UsersService usersService;

	/**
	 * 统计查询-分权限
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "myDocBfByPage")
	public ResponseModel<DataTablesResult<Map<String, Object>>> myDocBfByPage(HttpServletRequest request) {

		ResponseModel<DataTablesResult<Map<String, Object>>> res = new ResponseModel<>();
		logger.info("开始统计查询");
		try {
			DataTablesResult<Map<String, Object>> result = new DataTablesResult<>(request);
			Map<String, Object> params = new HashMap<String, Object>();
			// 处理当前登录用户权限
			String user = (String) request.getSession().getAttribute("loginuser");
			Users loginUser = JSON.parseObject(user, Users.class);
			Long roleId1 = loginUser.getRoleId1();
			Long roleId2 = loginUser.getRoleId2();
			Long roleId3 = loginUser.getRoleId3();
			String orgs = loginUser.getOrgs();// 下属组织
			Long org1 = loginUser.getOrgId1();
			Long org2 = loginUser.getOrgId2();
			Long org3 = loginUser.getOrgId3();
			if (Integer.parseInt(loginUser.getUserType()) == 1 || (roleId1 != null && roleId1 == 1)|| (roleId2 != null && roleId2 == 1) || (roleId3 != null && roleId3 == 1)) {
				// 如果是超级管理员和主管领导，不做权限处理
				params.put("q_uId", "");
			} else if ((roleId1 != null && roleId1 > 9) && (roleId2 != null && roleId2 > 9)&& (roleId3 != null && roleId3 > 9)) {
				// 如果只是普通职员。只查询自己的
				params.put("q_uId", loginUser.getUserId());
			} else {
				StringBuffer q_uId = new StringBuffer();
				q_uId.append(loginUser.getUserId());// 先把当前用户加入到查询人员列表中
				StringBuffer q_oId = new StringBuffer();
				// 存在分管领导或科室负责人的情况
				if (roleId1 != null && roleId1 == 3) {
					// 角色1是分管领导则orgs才有效
					if (orgs != null && orgs.trim().length() > 0) {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							q_oId.append(org[i]);
							q_oId.append(",");
						}
					}
				} else if (roleId1 != null && roleId1 == 9) {
					// 角色1是科室负责人
					q_oId.append(org1);
					q_oId.append(",");
				}

				if (roleId2 != null && roleId2 == 3) {
					// 角色2是分管领导则orgs才有效
					if (orgs != null && orgs.trim().length() > 0) {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							q_oId.append(org[i]);
							q_oId.append(",");
						}
					}
				} else if (roleId2 != null && roleId2 == 9) {
					// 角色2是科室负责人
					q_oId.append(org2);
					q_oId.append(",");
				}

				if (roleId3 != null && roleId3 == 3) {
					// 角色3是分管领导则orgs才有效
					if (orgs != null && orgs.trim().length() > 0) {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							q_oId.append(org[i]);
							q_oId.append(",");
						}
					}
				} else if (roleId3 != null && roleId3 == 9) {
					// 角色3是科室负责人
					q_oId.append(org3);
					q_oId.append(",");
				}
				String q_Id = q_oId.toString();
				if (q_Id != null && q_Id.trim().length() > 0) {
					if (q_Id.endsWith(",")) {
						// 如果最后一个字符是，则把，删除掉
						q_Id = q_Id.substring(0, q_Id.length() - 1);
					}
					// 查询当前用户可见的的所有人员
					Map<String, Object> map = new HashMap<>();
					map.put("q_oId", q_Id);
					List<Users> users = usersService.selectAllByOrg(map);
					for (Users tmp : users) {
						q_uId.append(",");
						q_uId.append(tmp.getUserId());
					}
				}
				params.put("q_uId", q_uId.toString());
			}
			String q_title = request.getParameter("q_title");
			String q_number = request.getParameter("q_number");
			String q_status = request.getParameter("q_status");
			String logmin = request.getParameter("logmin");
			String logmax = request.getParameter("logmax");
			String q_mark = request.getParameter("q_mark");
			params.put("q_title", q_title);
			params.put("q_number", q_number);
			params.put("q_status", q_status);
			params.put("logmin", logmin);
			params.put("logmax", logmax);
			params.put("q_mark", q_mark);
			searchService.myDocBfByPage(result, params);
			res.success("统计查询成功", result);
			logger.info("统计查询成功");
		} catch (Exception e) {
			res.init("统计查询失败");
			logger.error("统计查询失败", e);
		}
		return res;
	}

	/**
	 * 回退统计
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "myDocBfBackByPage")
	public ResponseModel<DataTablesResult<Map<String, Object>>> myDocBfBackByPage(HttpServletRequest request) {

		ResponseModel<DataTablesResult<Map<String, Object>>> res = new ResponseModel<>();
		logger.info("开始回退查询");
		try {
			DataTablesResult<Map<String, Object>> result = new DataTablesResult<>(request);
			Map<String, Object> params = new HashMap<String, Object>();
			// 处理当前登录用户权限
			String user = (String) request.getSession().getAttribute("loginuser");
			Users loginUser = JSON.parseObject(user, Users.class);
			Long roleId1 = loginUser.getRoleId1();
			Long roleId2 = loginUser.getRoleId2();
			Long roleId3 = loginUser.getRoleId3();
			String orgs = loginUser.getOrgs();// 下属组织
			Long org1 = loginUser.getOrgId1();
			Long org2 = loginUser.getOrgId2();
			Long org3 = loginUser.getOrgId3();
			if (Integer.parseInt(loginUser.getUserType()) == 1 || (roleId1 != null && roleId1 == 1)|| (roleId2 != null && roleId2 == 1) || (roleId3 != null && roleId3 == 1)) {
				// 如果是超级管理员和主管领导，不做权限处理
				params.put("q_uId", "");
			} else if ((roleId1 != null && roleId1 > 9) && (roleId2 != null && roleId2 > 9)&& (roleId3 != null && roleId3 > 9)) {
				// 如果只是普通职员。只查询自己的
				params.put("q_uId", loginUser.getUserId());
			} else {
				StringBuffer q_uId = new StringBuffer();
				q_uId.append(loginUser.getUserId());// 先把当前用户加入到查询人员列表中
				StringBuffer q_oId = new StringBuffer();
				// 存在分管领导或科室负责人的情况
				if (roleId1 != null && roleId1 == 3) {
					// 角色1是分管领导则orgs才有效
					if (orgs != null && orgs.trim().length() > 0) {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							q_oId.append(org[i]);
							q_oId.append(",");
						}
					}
				} else if (roleId1 != null && roleId1 == 9) {
					// 角色1是科室负责人
					q_oId.append(org1);
					q_oId.append(",");
				}

				if (roleId2 != null && roleId2 == 3) {
					// 角色2是分管领导则orgs才有效
					if (orgs != null && orgs.trim().length() > 0) {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							q_oId.append(org[i]);
							q_oId.append(",");
						}
					}
				} else if (roleId2 != null && roleId2 == 9) {
					// 角色2是科室负责人
					q_oId.append(org2);
					q_oId.append(",");
				}

				if (roleId3 != null && roleId3 == 3) {
					// 角色3是分管领导则orgs才有效
					if (orgs != null && orgs.trim().length() > 0) {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							q_oId.append(org[i]);
							q_oId.append(",");
						}
					}
				} else if (roleId3 != null && roleId3 == 9) {
					// 角色3是科室负责人
					q_oId.append(org3);
					q_oId.append(",");
				}
				String q_Id = q_oId.toString();
				if (q_Id != null && q_Id.trim().length() > 0) {
					if (q_Id.endsWith(",")) {
						// 如果最后一个字符是，则把，删除掉
						q_Id = q_Id.substring(0, q_Id.length() - 1);
					}
					// 查询当前用户可见的的所有人员
					Map<String, Object> map = new HashMap<>();
					map.put("q_oId", q_Id);
					List<Users> users = usersService.selectAllByOrg(map);
					for (Users tmp : users) {
						q_uId.append(",");
						q_uId.append(tmp.getUserId());
					}
				}
				params.put("q_uId", q_uId.toString());
			}
			String logmin = request.getParameter("logmin");
			String logmax = request.getParameter("logmax");
			String q_oId = request.getParameter("q_oId");
			String userName = request.getParameter("userName");
			params.put("userName", userName);
			params.put("logmin", logmin);
			params.put("logmax", logmax);
			params.put("q_oId", q_oId);

			searchService.myDocBfBackByPage(result, params);
			res.success("回退查询成功", result);
			logger.info("回退查询成功");
		} catch (Exception e) {
			res.init("统计查询失败");
			logger.error("回退查询失败", e);
		}
		return res;
	}
	
	
	/**
	 * 回退详情，根据人员id查询该人员的回退列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "myDocBfBackDatailByPage")
	public ResponseModel<DataTablesResult<Map<String, Object>>> myDocBfBackDatailByPage(HttpServletRequest request) {
		ResponseModel<DataTablesResult<Map<String, Object>>> res = new ResponseModel<>();
		logger.info("开始查询回退详情");
		try {
			DataTablesResult<Map<String, Object>> result = new DataTablesResult<>(request);
			Map<String, Object> params = new HashMap<String, Object>();
			String logmin = request.getParameter("logmin");
			String logmax = request.getParameter("logmax");
			String uId = request.getParameter("uId");
			params.put("logmin", logmin);
			params.put("logmax", logmax);
			params.put("uId", uId);
			searchService.myDocBfBackDatailByPage(result, params);
			res.success("查询回退详情成功", result);
			logger.info("查询回退详情成功");
		} catch (Exception e) {
			res.init("查询回退详情失败");
			logger.error("查询回退详情失败", e);
		}
		return res;

	}
	
}
