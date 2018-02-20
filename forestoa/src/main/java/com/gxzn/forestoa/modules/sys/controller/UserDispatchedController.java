package com.gxzn.forestoa.modules.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Role;
import com.gxzn.forestoa.modules.sys.entity.UserDispatched;
import com.gxzn.forestoa.modules.sys.entity.ZTree;
import com.gxzn.forestoa.modules.sys.service.UserDispatchedService;
import com.gxzn.forestoa.modules.sys.service.UsersService;

@RestController
@RequestMapping("dispatched")
public class UserDispatchedController {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
			
	@Autowired
	private UsersService usersService;
	
	@Resource(name="userDispatchedService")
	private UserDispatchedService userDispatchedService;
	
	@RequestMapping(value = "getUserDispatched")
	public ResponseModel<Map<String,Object>> getUserDispatched(Long uId) {
		ResponseModel<Map<String,Object>> res = new ResponseModel<>();
		Map<String,Object> map=new HashMap<>();
		try {
			UserDispatched userDispatched=userDispatchedService.getUserDispatched(uId);
			List<ZTree> userTree=usersService.getUsersTree();
			map.put("dispatched", userDispatched);//uid的委派信息
			map.put("userTree", userTree);//人员列表树
			res.success("获取人员委派信息成功", map);
			logger.info("获取人员委派信息成功");
		} catch (Exception e) {
			res.init("获取人员委派信息失败");
			logger.error("获取人员委派信息失败");
		}
		
		return res;
	}
 
	/**
	 * 添加*更新人员委派
	 * @param userDispatched
	 * @return
	 */
	@RequestMapping(value = "save")
	public ResponseModel<Integer> save(@RequestBody UserDispatched userDispatched) {
		ResponseModel<Integer> res = new ResponseModel<>();
		logger.info("开始保存人员委派");
		try {
			res.success("保存人员委派成功", userDispatchedService.insert(userDispatched));
			logger.info("保存人员委派成功");
		} catch (Exception e) {
			res.init("保存人员委派失败");
			logger.error("保存人员委派失败", e);
		}
		return res;
	}

	
	/**
	 * 一键收回所有委派
	 * @param userDispatched
	 * @return
	 */
	@RequestMapping(value = "updateValid")
	public ResponseModel<Integer> updateValid(UserDispatched userDispatched) {
		ResponseModel<Integer> res = new ResponseModel<>();
		try {
			res.success("一键收回所有委派成功", userDispatchedService.updateValid(userDispatched));
			logger.info("一键收回所有委派成功");
		} catch (Exception e) {
			res.init("一键收回所有委派失败");
			logger.error("一键收回所有委派失败", e);
		}
		return res;
	}
	
	
}
