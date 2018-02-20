package com.gxzn.forestoa.modules.sso.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.EncodeUtil;
import com.gxzn.forestoa.common.util.MenuTreeUtil;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.attendance.entity.Attendance;
import com.gxzn.forestoa.modules.attendance.service.AttendanceService;
import com.gxzn.forestoa.modules.sys.entity.Menu;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.sys.service.MenuService;
import com.gxzn.forestoa.modules.sys.service.UsersService;

@Controller
@RequestMapping("sso")
public class SsoController {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Resource(name = "menuService")
	private MenuService menuService;
	
	@RequestMapping(value = "toTask")
	public String toTask(HttpServletRequest req, HttpServletResponse resp) {
		String params=req.getParameter("params");
		String urlParams=EncodeUtil.decode(params);
		String [] para=urlParams.split("&");
		String numeber="";
		String pwd="";
		String url="";
		for(String tmp:para) {
			String [] keyval=tmp.split("=");
			if("number".equals(keyval[0])) {
				numeber=keyval[1];
			}else if("pwd".equals(keyval[0])) {
				pwd=keyval[1];
			}else if("url".equals(keyval[0])) {
				url=keyval[1]+"="+keyval[2];
			}
		}

		logger.info("开始用户：" + numeber + "的单点登录");
	
		Users users=new Users();
		users.setUserNumber(numeber);
		users.setLoginPassword(pwd);
		Users u=usersService.login(users);
		if(u!=null&&u.getLoginPassword().equals(users.getLoginPassword())) {
			req.getSession().setAttribute(SessionContans.USER_KEY,u);
			List<Menu> menus=new ArrayList<>();
			if(Integer.parseInt(u.getUserType())==1) {
				//如果是超级管理员。获取全部
				menus=menuService.getMenuListAll();
			}else {
				//不是超级管理员。先从登录用户中获取改用的角色。role1、role2、role3，通过role列表获取菜单
				List<Long> roles=new ArrayList<>();
				if(u.getRoleId1()!=null) {
					roles.add(u.getRoleId1());
				}
				if(u.getRoleId2()!=null) {
					roles.add(u.getRoleId2());
				}
				if(u.getRoleId3()!=null) {
					roles.add(u.getRoleId3());
				}
				menus=menuService.getMenuListByrIds(roles);
			}
			MenuTreeUtil menuTreeUtil=new MenuTreeUtil();
			u.setReandmenus(menuTreeUtil.menuList(menus));
			req.getSession().setAttribute("loginuser",JSON.toJSONString(u));
			logger.info("用户:"+numeber+"====单点登录成功");
			return "redirect:/Filehandle?url="+url;
		}else {
			logger.info("用户:"+numeber+"****单点登录失败");
			return "redirect:/toLogin";
		}
	}
	
	
	
	/**
	 * 添加考勤记录
	 * 
	 * @param notice
	 * @return
	 */
	@RequestMapping(value = "putAttendance")
	@ResponseBody
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
