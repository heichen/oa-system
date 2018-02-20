package com.gxzn.forestoa.modules.sys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.MenuTreeUtil;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Menu;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.sys.service.MenuService;

/**
 * 菜单
 * 
 * @author jiabo
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("menu")
public class MenuController {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "menuService")
	private MenuService menuService;

	/**
	 * 查询从mId节点下属的菜单树
	 * 
	 * @param mId
	 * @return
	 */
	@RequestMapping(value = "getMenuTree")
	public ResponseModel<List<Menu>> findByPage(Long mId) {
		mId = mId == null ? 0L : mId;
		logger.info("开始查询" + mId + "节点下属的菜单树");
		ResponseModel<List<Menu>> res = new ResponseModel<>();
		try {
			List<Menu> menuTree = menuService.getMenuTree(mId);
			res.success("获取菜单树成功", menuTree);
			logger.info(StrFormatterUtils.format("获取菜单树成功{}", JSON.toJSONString(menuTree)));
		} catch (Exception e) {
			res.init("获取菜单树失败");
			logger.error("获取" + mId + "节点下属菜单树失败", e);
		}
		return res;
	}
	
}
