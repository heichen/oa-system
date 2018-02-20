package com.gxzn.forestoa.modules.sys.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.sys.entity.Menu;

public interface MenuService {

	/**
	 * 根据节点id获取从这个节点开始的菜单树
	 * 
	 * @param mId
	 * @return
	 */
	List<Menu> getMenuTree(Long mId);

	/**
	 * 根据角色id获取菜单。全部的菜单以及角色是否与菜单绑定的字段rId
	 * 
	 * @param rId
	 * @return
	 */
	List<Menu> getMenuTreeByrId(Long rId);

	/**
	 * 根据角色id集合获取角色所拥有的菜单
	 * 
	 * @param roles
	 * @return
	 */
	List<Menu> getMenuListByrIds(List<Long> roles);

	/**
	 * 获取全部菜单
	 * 
	 * @return
	 */
	List<Menu> getMenuListAll();
}
