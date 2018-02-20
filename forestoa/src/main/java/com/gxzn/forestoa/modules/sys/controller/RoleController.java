package com.gxzn.forestoa.modules.sys.controller;

import java.util.HashMap;
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
import com.gxzn.forestoa.common.util.MenuTreeUtil;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Role;
import com.gxzn.forestoa.modules.sys.service.MenuService;
import com.gxzn.forestoa.modules.sys.service.OrgService;
import com.gxzn.forestoa.modules.sys.service.RoleService;

/**
 * 角色
 * 
 * @author jiabo
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("role")
public class RoleController {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Resource(name="roleService")
	private RoleService roleService;

	
	@Resource(name="menuService")
	private MenuService menuService;


	@Resource(name="orgService")
	private OrgService orgService;

	/**
	 * 根据角色Id查询角色
	 * 
	 * @param rId
	 * @return
	 */
	@RequestMapping(value = "selectByKey")
	public ResponseModel<Map<String, Object>> selectByKey(Long rId) {
		ResponseModel<Map<String, Object>> res = new ResponseModel<>();
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("开始查询rId=" + rId + "的角色");
		try {
			Role role = roleService.selectByKey(rId);
			// 获取角色对象
			map.put("role", role);
			// 根据角色id获取菜单树(全部菜单-角色与菜单关联标识字段rId)
			MenuTreeUtil menuTree = new MenuTreeUtil();
			map.put("menuTree", menuTree.menuList(menuService.getMenuTreeByrId(rId)));

			res.success("查询角色成功", map);
			logger.info(StrFormatterUtils.format("查询角色成功{}",JSON.toJSONString(role)));
		} catch (Exception e) {
			res.init("查询角色失败");
			logger.error("查询rId=" + rId + "角色失败", e);
		}
		return res;
	}

	/**
	 * 分页查询角色列表
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "findByPage")
	public ResponseModel<DataTablesResult<Role>> findByPage(HttpServletRequest request) {

		ResponseModel<DataTablesResult<Role>> res = new ResponseModel<DataTablesResult<Role>>();
		logger.info("开始分页查询角色");
		try {
			DataTablesResult<Role> result = new DataTablesResult<>(request);
			roleService.findByPage(result);
			res.success("分页查询角色成功", result);
			logger.info("分页查询角色成功");
		} catch (Exception e) {
			res.init("分页查询角色失败");
			logger.error("分页查询角色失败", e);
		}
		return res;
	}

	/**
	 * 添加角色
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "save")
	public ResponseModel<Long> save(@RequestBody Role role) {
		ResponseModel<Long> res = new ResponseModel<>();
		logger.info("开始添加角色");
		try {
			res.success("添加角色成功", roleService.save(role));
			logger.info("添加角色成功");
		} catch (Exception e) {
			res.init("添加角色失败");
			logger.error("添加角色失败", e);
		}
		return res;
	}

	/**
	 * 删除角色
	 * 
	 * @param rId
	 * @return
	 */
	@RequestMapping(value = "del")
	public ResponseModel<Long> deleteRole(Long rId) {
		ResponseModel<Long> res = new ResponseModel<>();
		logger.info("删除rId="+rId+"角色");
		try {
			res.success("删除角色成功", roleService.delete(rId));
			logger.info("删除rId="+rId+"角色成功");
		} catch (Exception e) {
			res.init("删除角色失败");
			logger.error("删除rId="+rId+"角色失败",e);
		}
		return res;
	}

	/**
	 * 更新角色
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "update")
	public ResponseModel<Long> update(@RequestBody Role role) {
		ResponseModel<Long> res = new ResponseModel<>();
		logger.info("开始更新角色");
		try {
			res.success("修改角色成功", roleService.update(role));
			logger.info(StrFormatterUtils.format("修改角色成功{}",JSON.toJSONString(role)));
		} catch (Exception e) {
			res.init("修改角色失败");
			logger.error(StrFormatterUtils.format("修改角色失败{}",JSON.toJSONString(role)));
		}
		return res;
	}


	/**
	 * 给添加角色页面查询全部菜单列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "selectMenuTree")
	public ResponseModel<Map<String, Object>> selectMenuTree() {
		ResponseModel<Map<String, Object>> res = new ResponseModel<>();
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("查询全部菜单列表");
		try {
			// 根据角色id获取菜单树(全部菜单-角色与菜单关联标识字段rId)
			MenuTreeUtil menuTree = new MenuTreeUtil();
			map.put("menuTree", menuTree.menuList(menuService.getMenuTree(0L)));

			res.success("查询全部菜单列表", map);
			logger.info(StrFormatterUtils.format("查询全部菜单列表{}",JSON.toJSONString(map)));
		} catch (Exception e) {
			res.init("查询全部菜单列表失败");
			logger.error("查询全部菜单列表失败",e);
		}
		return res;
	}
}
