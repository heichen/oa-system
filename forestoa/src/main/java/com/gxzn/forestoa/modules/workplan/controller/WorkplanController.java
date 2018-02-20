package com.gxzn.forestoa.modules.workplan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.workplan.entity.Workplan;
import com.gxzn.forestoa.modules.workplan.service.WorkplanService;

/**
 * 工作计划控制类
 * 
 * @author wangchen
 * @CrossOrigin(origins = "*") 解决跨域问题
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("workplan")
public class WorkplanController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WorkplanService workplanService;
	@Autowired
	private UsersMapper usersMapper;

	/**
	 * 查询所有工作计划
	 * 
	 * @param
	 * @return
	 */
	 @RequestMapping(value = "selectAll")
	 public ResponseModel<DataTablesResult<Workplan>> selectAll(Workplan
	 workplan,HttpServletRequest req, HttpServletResponse resp) {
	 ResponseModel<DataTablesResult<Workplan>> res = new ResponseModel<DataTablesResult<Workplan>>();
	 Users loginUser=(Users) req.getSession().getAttribute(SessionContans.USER_KEY);
	 try {
		 List<Workplan> list=new ArrayList<>();
			List<Users> users=new ArrayList<>();
			Map<String, Object> params = new HashMap<String, Object>();
			StringBuffer q_oId = new StringBuffer();
			params.put("workplanStarttime", workplan.getWorkplanStarttime());
			params.put("workplanEndtime", workplan.getWorkplanEndtime());
			params.put("workplanTitle", workplan.getWorkplanTitle());
			params.put("status", workplan.getStatus());
			Long roleId1 = loginUser.getRoleId1();
			Long roleId2 = loginUser.getRoleId2();
			Long roleId3 = loginUser.getRoleId3();
		 
		 if (Integer.parseInt(loginUser.getUserType()) == 1 || (roleId1 != null && roleId1 == 1)
					|| (roleId2 != null && roleId2 == 1) || (roleId3 != null && roleId3 == 1)) {
				// 如果是超级管理员和主管领导，不做权限处理
				params.put("q_oId", "");
				params.put("q_oId", q_oId.toString());
					
				users=usersMapper.selectAllByOrg(params);
				StringBuffer q_uId = new StringBuffer();
				for(int i=0;i<users.size();i++){
					if (i != (users.size() - 1)) {
						// 如果不是最后一个元素，加完之后加上，
						q_uId.append(users.get(i).getUserId());
						q_uId.append(",");
					} else {
						q_uId.append(users.get(i).getUserId());
					}
					
				}
				params.put("workplanOwner", q_uId.toString());
				
			} else {
				
				String orgs = loginUser.getOrgs();// 下属组织
				Long org1 = loginUser.getOrgId1();
				Long org2 = loginUser.getOrgId2();
				Long org3 = loginUser.getOrgId3();

				if ((roleId1 != null && roleId1 == 3) || (roleId2 != null && roleId2 == 3)
						|| (roleId3 != null && roleId3 == 3)) {
					if (roleId1 != null && roleId1 == 3) {
						q_oId.append(org1);
						q_oId.append(",");
					}
					if (roleId2 != null && roleId2 == 3) {
						q_oId.append(org2);
						q_oId.append(",");
					}
					if (roleId3 != null &&roleId3 == 3) {
						q_oId.append(org3);
						q_oId.append(",");
					}
					// 如果角色中有3，即分管领导的角色。则orgs才有效
					if(orgs!="") {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							
								q_oId.append(org[i]);
								q_oId.append(",");
							
						}
						
					}
					
					//buf.substring(0, buf.length()-1)
					params.put("q_oId", (q_oId.toString()).substring(0, (q_oId.toString()).length()-1));
						
					users=usersMapper.selectAllByOrg(params);
					StringBuffer q_uId = new StringBuffer();
					for(int i=0;i<users.size();i++){
						if (i != (users.size() - 1)) {
							// 如果不是最后一个元素，加完之后加上，
							q_uId.append(users.get(i).getUserId());
							q_uId.append(",");
						} else {
							q_uId.append(users.get(i).getUserId());
						}
						
					}
					params.put("workplanOwner", q_uId.toString());
					
					
				} else {
					if ((roleId1 != null && roleId1 == 9) || (roleId2 != null && roleId2 == 9)
							|| (roleId3 != null && roleId3 == 9)) {
						// 如果角色中有9，即为科室负责人。
						if (roleId1 != null &&roleId1 == 9) {
							q_oId.append(org1);
							q_oId.append(",");
						}
						if (roleId2 != null &&roleId2 == 9) {
							q_oId.append(org2);
							q_oId.append(",");
						}
						if (roleId3 != null &&roleId3 == 9) {
							q_oId.append(org3);
							q_oId.append(",");
						}
						params.put("q_oId", (q_oId.toString()).substring(0, (q_oId.toString()).length()-1));
						//params.put("q_oId", q_oId.toString());
							
						users=usersMapper.selectAllByOrg(params);
						StringBuffer q_uId = new StringBuffer();
						for(int i=0;i<users.size();i++){
							if (i != (users.size() - 1)) {
								// 如果不是最后一个元素，加完之后加上，
								q_uId.append(users.get(i).getUserId());
								q_uId.append(",");
							} else {
								q_uId.append(users.get(i).getUserId());
							}
							
						}
						params.put("workplanOwner", q_uId.toString());
					}else {
						
						params.put("workplanOwner", loginUser.getUserId());
						
					}

				}
				
			}
		 

		 
	 DataTablesResult<Workplan> result = new DataTablesResult<>(req);
	 workplanService.selectAll(result,params);
	 res.success("分页查询工作计划成功", result);
	 logger.info("分页查询工作计划成功");
	 } catch (Exception e) {
	 res.init("分页查询工作计划失败");
	 logger.error("分页查询工作计划失败", e);
	 }
	 return res;
	 }
	 
	 
	 
	 @RequestMapping(value = "selectWPNumber")
		public List<Workplan> selectWPNumber(Workplan workplan,HttpServletRequest req, HttpServletResponse resp) {
		 Users loginUser=(Users) req.getSession().getAttribute(SessionContans.USER_KEY);
		 StringBuffer q_oId = new StringBuffer();
		 List<Workplan> list = new ArrayList<>();
		 Map<String, Object> params = new HashMap<String, Object>();
		 List<Users> users=new ArrayList<>();
			params.put("workplanStarttime", workplan.getWorkplanStarttime());
			params.put("workplanEndtime", workplan.getWorkplanEndtime());
			params.put("workplanTitle", workplan.getWorkplanTitle());
			params.put("status", workplan.getStatus());
			Long roleId1 = loginUser.getRoleId1();
			Long roleId2 = loginUser.getRoleId2();
			Long roleId3 = loginUser.getRoleId3();
			
			
			if (Integer.parseInt(loginUser.getUserType()) == 1 || (roleId1 != null && roleId1 == 1)
					|| (roleId2 != null && roleId2 == 1) || (roleId3 != null && roleId3 == 1)) {
				// 如果是超级管理员和主管领导，不做权限处理
				params.put("q_oId", "");
				params.put("q_oId", q_oId.toString());
					
				users=usersMapper.selectAllByOrg(params);
				StringBuffer q_uId = new StringBuffer();
				for(int i=0;i<users.size();i++){
					if (i != (users.size() - 1)) {
						// 如果不是最后一个元素，加完之后加上，
						q_uId.append(users.get(i).getUserId());
						q_uId.append(",");
					} else {
						q_uId.append(users.get(i).getUserId());
					}
					
				}
				params.put("workplanOwner", q_uId.toString());
				
			} else {
				
				String orgs = loginUser.getOrgs();// 下属组织
				Long org1 = loginUser.getOrgId1();
				Long org2 = loginUser.getOrgId2();
				Long org3 = loginUser.getOrgId3();

				if ((roleId1 != null && roleId1 == 3) || (roleId2 != null && roleId2 == 3)
						|| (roleId3 != null && roleId3 == 3)) {
					if (roleId1 != null && roleId1 == 3) {
						q_oId.append(org1);
						q_oId.append(",");
					}
					if (roleId2 != null && roleId2 == 3) {
						q_oId.append(org2);
						q_oId.append(",");
					}
					if (roleId3 != null &&roleId3 == 3) {
						q_oId.append(org3);
						q_oId.append(",");
					}
					// 如果角色中有3，即分管领导的角色。则orgs才有效
					if(orgs!="") {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {
							
								q_oId.append(org[i]);
								q_oId.append(",");
							
						}
						
					}
					
					//buf.substring(0, buf.length()-1)
					params.put("q_oId", (q_oId.toString()).substring(0, (q_oId.toString()).length()-1));
						
					users=usersMapper.selectAllByOrg(params);
					StringBuffer q_uId = new StringBuffer();
					for(int i=0;i<users.size();i++){
						if (i != (users.size() - 1)) {
							// 如果不是最后一个元素，加完之后加上，
							q_uId.append(users.get(i).getUserId());
							q_uId.append(",");
						} else {
							q_uId.append(users.get(i).getUserId());
						}
						
					}
					params.put("workplanOwner", q_uId.toString());
					
					
				} else {
					if ((roleId1 != null && roleId1 == 9) || (roleId2 != null && roleId2 == 9)
							|| (roleId3 != null && roleId3 == 9)) {
						// 如果角色中有9，即为科室负责人。
						if (roleId1 != null &&roleId1 == 9) {
							q_oId.append(org1);
							q_oId.append(",");
						}
						if (roleId2 != null &&roleId2 == 9) {
							q_oId.append(org2);
							q_oId.append(",");
						}
						if (roleId3 != null &&roleId3 == 9) {
							q_oId.append(org3);
							q_oId.append(",");
						}
						params.put("q_oId", (q_oId.toString()).substring(0, (q_oId.toString()).length()-1));
						//params.put("q_oId", q_oId.toString());
							
						users=usersMapper.selectAllByOrg(params);
						StringBuffer q_uId = new StringBuffer();
						for(int i=0;i<users.size();i++){
							if (i != (users.size() - 1)) {
								// 如果不是最后一个元素，加完之后加上，
								q_uId.append(users.get(i).getUserId());
								q_uId.append(",");
							} else {
								q_uId.append(users.get(i).getUserId());
							}
							
						}
						params.put("workplanOwner", q_uId.toString());
					}else {
						
						params.put("workplanOwner", loginUser.getUserId());
						
					}

				}
				
			}
			
			
			
			try {
				list=workplanService.selectWPNumber(params);
				logger.info("根据工作计划Id进行查询成功");
			} catch (Exception e) {

				logger.error("根据工作计划Id进行查询失败", e);
			}
			return list;
		}
	 
	 
	
	/**
	 * 根据工作计划Id进行查询
	 * 
	 * @param workplan
	 * @return
	 */
	@RequestMapping(value = "selectByKey")
	public ResponseModel<Workplan> selectByKey(Long workplanId) {
		ResponseModel<Workplan> res = new ResponseModel<Workplan>();
		try {
			res.success("根据工作计划Id进行查询成功", workplanService.selectByKey(workplanId));
			logger.info("根据工作计划Id进行查询成功");
		} catch (Exception e) {

			res.init("根据工作计划Id进行查询失败");
			logger.error("根据工作计划Id进行查询失败", e);
		}
		return res;
	}

	/**
	 * 根据工作计划标题查询工作计划
	 * 
	 * @param temp
	 * @return
	 */
	@RequestMapping(value = "selectByTitle")
	public ResponseModel<List<Workplan>> selectByTitle(String temp) {
		ResponseModel<List<Workplan>> res = new ResponseModel<List<Workplan>>();
		try {

			res.success("根据工作计划标题查询工作计划成功", workplanService.selectByTitle(temp));
			logger.info(StrFormatterUtils.format("根据工作计划标题查询工作计划成功", temp));
		} catch (Exception e) {

			res.init("根据工作计划标题查询工作计划失败");
			logger.error("根据工作计划标题查询工作计划失败", e);
		}
		return res;

	}

	/**
	 * 根据工作计划Id进行物理删除
	 * 
	 * @param workplan
	 * @return
	 */
	@RequestMapping(value = "delete")
	public ResponseModel<Integer> delete(Long workplanId) {
		ResponseModel<Integer> res = new ResponseModel<Integer>();
		try {

			res.success("根据工作计划Id进行物理删除成功", workplanService.delete(workplanId));
			logger.info("根据工作计划Id进行物理删除划成功");
		} catch (Exception e) {

			res.init("根据工作计划Id进行物理删除失败");
			logger.error("根据工作计划Id进行物理删除失败", e);
		}
		return res;

	}

	/**
	 * 根据工作计划Id进行逻辑删除
	 * 
	 * @param workplan
	 * @return
	 */
	@RequestMapping(value = "delete2")
	public ResponseModel<Integer> delete2(Long workplanId) {
		ResponseModel<Integer> res = new ResponseModel<Integer>();
		try {

			res.success("根据工作计划Id进行逻辑删除成功", workplanService.delete2(workplanId));
			logger.info("根据工作计划Id进行逻辑删除成功");
		} catch (Exception e) {

			res.init("根据工作计划Id进行逻辑删除失败");
			logger.error("根据工作计划Id进行逻辑删除失败", e);
		}
		return res;

	}

	/**
	 * 工作计划的编辑
	 * 
	 * @param workplan
	 * @return
	 */
	@RequestMapping(value = "update")
	public ResponseModel<Integer> update(Workplan workplan) {
		ResponseModel<Integer> res = new ResponseModel<Integer>();
		try {

			res.success("工作计划的编辑成功", workplanService.update(workplan));
			logger.info("工作计划的编辑成功");
		} catch (Exception e) {

			res.init("工作计划的编辑失败");
			logger.error("工作计划的编辑失败", e);
		}
		return res;

	}

	/**
	 * 工作计划的添加
	 * 
	 * @param workplan
	 * @return
	 */
	@RequestMapping(value = "insert")
	public ResponseModel<Integer> insert(Workplan workplan, HttpServletRequest req) {
		Users u = (Users) req.getSession().getAttribute(SessionContans.USER_KEY);
		workplan.setWorkplanOwner(u.getUserId());
		ResponseModel<Integer> res = new ResponseModel<Integer>();
		try {

			res.success("工作计划的添加成功", workplanService.insert(workplan));
			logger.info("工作计划的添加成功");
		} catch (Exception e) {

			res.init("工作计划的添加失败");
			logger.error("工作计划的添加失败", e);
		}
		return res;

	}

}
