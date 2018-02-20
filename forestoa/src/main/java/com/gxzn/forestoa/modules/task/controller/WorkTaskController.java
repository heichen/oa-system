package com.gxzn.forestoa.modules.task.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.task.service.WorkTaskService;

/**
 * 我的任务 公文管理 公文搜索
 * 
 * @author jiabo
 *
 */
@RestController
@RequestMapping("workTask")
public class WorkTaskController {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "workTaskService")
	private WorkTaskService workTaskService;

	/**
	 * 根据当前用户id获取代办理的任务数量
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "getToDoTaskNums")
	public ResponseModel<Integer> getToDoTaskNums(HttpServletRequest req, HttpServletResponse resp) {
		logger.info("开始查询代办理的任务数量");
		ResponseModel<Integer> res = new ResponseModel<>();
		try {
			String user = (String) req.getSession().getAttribute("loginuser");
			Users loginUser = JSON.parseObject(user, Users.class);
			res.success("开始查询代办理的任务数量成功", workTaskService.getToDoTaskNums(loginUser.getUserId()));
			logger.info("开始查询代办理的任务数量成功");
		} catch (Exception e) {
			res.init("开始查询代办理的任务数量失败");
			logger.error("开始查询代办理的任务数量失败", e);
		}
		return res;
	}

	/**
	 * 根据当前用户查询待办任务（公文收文、发文，简报收文、发文）
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "getToDoTask")
	public ResponseModel<Map<String, List<Map<String, Object>>>> getToDoTask(HttpServletRequest req,
			HttpServletResponse resp) {
		logger.info("开始查询代办理的任务");
		ResponseModel<Map<String, List<Map<String, Object>>>> res = new ResponseModel<>();
		try {
			String user = (String) req.getSession().getAttribute("loginuser");
			Users loginUser = JSON.parseObject(user, Users.class);
			res.success("开始查询代办理的任务成功", workTaskService.getToDoTask(loginUser.getUserId()));
			logger.info("开始查询代办理的任务成功");
		} catch (Exception e) {
			res.init("开始查询代办理的任务失败");
			logger.error("开始查询代办理的任务失败", e);
		}
		return res;
	}

	/**
	 * 我的公文分页查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "findMyDocBfByPage")
	public ResponseModel<DataTablesResult<Map<String, Object>>> findMyDocBfByPage(HttpServletRequest request) {

		ResponseModel<DataTablesResult<Map<String, Object>>> res = new ResponseModel<>();
		logger.info("开始分页查询我的公文");
		try {
			String user = (String) request.getSession().getAttribute("loginuser");
			Users loginUser = JSON.parseObject(user, Users.class);
			DataTablesResult<Map<String, Object>> result = new DataTablesResult<>(request);
			Map<String, Object> params = new HashMap<String, Object>();
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
			params.put("userId", loginUser.getUserId());
			workTaskService.findMyDocBfByPage(result, params);
			res.success("分页查询我的公文成功", result);
			logger.info("分页查询我的公文成功");
		} catch (Exception e) {
			res.init("分页查询我的公文失败");
			logger.error("分页查询我的公文失败", e);
		}
		return res;
	}

	/**
	 * 查看公文管理-查询全部（超级管理员的功能）
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "findMyDocBfByAllPage")
	public ResponseModel<DataTablesResult<Map<String, Object>>> findMyDocBfByAllPage(HttpServletRequest request) {

		ResponseModel<DataTablesResult<Map<String, Object>>> res = new ResponseModel<>();
		logger.info("开始分页查询公文管理");
		try {
			DataTablesResult<Map<String, Object>> result = new DataTablesResult<>(request);
			Map<String, Object> params = new HashMap<String, Object>();
			String q_title = request.getParameter("q_title");
			String q_number = request.getParameter("q_number");
			String q_status = request.getParameter("q_status");
			String logmin = request.getParameter("logmin");
			String logmax = request.getParameter("logmax");
			String q_mark = request.getParameter("q_mark");
			String q_oId = request.getParameter("q_oId");
			params.put("q_title", q_title);
			params.put("q_number", q_number);
			params.put("q_status", q_status);
			params.put("logmin", logmin);
			params.put("logmax", logmax);
			params.put("q_mark", q_mark);
			params.put("q_oId", q_oId);
			workTaskService.findMyDocBfByAllPage(result, params);
			res.success("分页查询公文管理成功", result);
			logger.info("分页查询公文管理成功");
		} catch (Exception e) {
			res.init("分页查询公文管理失败");
			logger.error("分页查询公文管理失败", e);
		}
		return res;
	}
}
