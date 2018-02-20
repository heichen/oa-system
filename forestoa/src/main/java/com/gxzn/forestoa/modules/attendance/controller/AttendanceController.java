package com.gxzn.forestoa.modules.attendance.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.attendance.entity.Attendance;
import com.gxzn.forestoa.modules.attendance.service.AttendanceService;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Users;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("attendance")
public class AttendanceController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AttendanceService attendanceService;
	@Autowired
	private UsersMapper usersMapper;

	/**
	 * 查询所有考勤
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "selectAll")
	public ResponseModel<DataTablesResult<Attendance>> selectAll(HttpServletRequest request,Users user) throws ParseException {
		String userName = request.getParameter("userName");
		String attenceStarttime = request.getParameter("attenceStarttime");
		String attenceEndtime = request.getParameter("attenceEndtime");
		Users loginUser = (Users) request.getSession().getAttribute(SessionContans.USER_KEY);
		ResponseModel<DataTablesResult<Attendance>> res = new ResponseModel<DataTablesResult<Attendance>>();
		try {

			List<Users> users = null;
			Map<String, Object> params = new HashMap<String, Object>();
			StringBuffer q_oId = new StringBuffer();
			params.put("attenceStarttime", attenceStarttime);
			params.put("attenceEndtime", attenceEndtime);
			params.put("userName", userName);
			params.put("orgId", user.getOrgId());
			Long roleId1 = loginUser.getRoleId1();
			Long roleId2 = loginUser.getRoleId2();
			Long roleId3 = loginUser.getRoleId3();

			if (Integer.parseInt(loginUser.getUserType()) == 1 || (roleId1 != null && roleId1 == 1)
					|| (roleId2 != null && roleId2 == 1) || (roleId3 != null && roleId3 == 1)) {
				// 如果是超级管理员和主管领导，不做权限处理
				params.put("q_oId", "");
				params.put("q_oId", q_oId.toString());

				users = usersMapper.selectAllByOrg(params);
				StringBuffer q_uId = new StringBuffer();
				for (int i = 0; i < users.size(); i++) {
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
					if (roleId3 != null && roleId3 == 3) {
						q_oId.append(org3);
						q_oId.append(",");
					}
					// 如果角色中有3，即分管领导的角色。则orgs才有效
					if (orgs != "") {
						String[] org = orgs.split(",");// 拆分后的各个部门id
						for (int i = 0; i < org.length; i++) {

							q_oId.append(org[i]);
							q_oId.append(",");

						}

					}
					params.put("q_oId", (q_oId.toString()).substring(0, (q_oId.toString()).length() - 1));

					users = usersMapper.selectAllByOrg(params);
					StringBuffer q_uId = new StringBuffer();
					for (int i = 0; i < users.size(); i++) {
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
						if (roleId1 != null && roleId1 == 9) {
							q_oId.append(org1);
							q_oId.append(",");
						}
						if (roleId2 != null && roleId2 == 9) {
							q_oId.append(org2);
							q_oId.append(",");
						}
						if (roleId3 != null && roleId3 == 9) {
							q_oId.append(org3);
							q_oId.append(",");
						}
						params.put("q_oId", (q_oId.toString()).substring(0, (q_oId.toString()).length() - 1));

						users = usersMapper.selectAllByOrg(params);
						StringBuffer q_uId = new StringBuffer();
						for (int i = 0; i < users.size(); i++) {
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

						params.put("workplanOwner", loginUser.getUserId());
					}

				}

			}

			DataTablesResult<Attendance> result = new DataTablesResult<>(request);
			attendanceService.selectAll(result, params);
			res.success("分页查询考勤成功", result);
			logger.info("分页查询考勤成功");
		} catch (Exception e) {
			res.init("分页查询考勤失败");
			logger.error("分页查询考勤失败", e);
		}
		return res;
	}

	/**
	 * 添加考勤记录
	 * 
	 * @param notice
	 * @return
	 */
	@RequestMapping(value = "putAttendance")
	public ResponseModel<Integer> insert(Attendance statisticsCheck) {
		ResponseModel<Integer> res = new ResponseModel<Integer>();
		try {

			res.success("添加考勤记录成功", attendanceService.insert(statisticsCheck));
			logger.info("添加考勤记录成功");
		} catch (Exception e) { 

			res.init("添加考勤记录失败");
			logger.error("添加考勤记录失败", e);
		}
		return res;

	}

}
