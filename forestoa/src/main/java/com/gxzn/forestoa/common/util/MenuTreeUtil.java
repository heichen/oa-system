package com.gxzn.forestoa.common.util;

import java.util.ArrayList;
import java.util.List;

import com.gxzn.forestoa.modules.sys.entity.Menu;
/**
 * 菜单树，返回树形结构
 * @author jiabo
 *
 */
public class MenuTreeUtil {
	public List<Menu> menuCommon;

	public List<Menu> list = new ArrayList<Menu>();

	public List<Menu> menuList(List<Menu> menus) {
		menuCommon = menus;
		for (Menu menu : menuCommon) {
			if (menu.getParenteId()== 0) {
				menu.setChildMenus(menuChild(menu.getmId()));
				list.add(menu);
			}
		}
		return list;
	}

	public List<Menu> menuChild(Long id) {
		List<Menu> childList = new ArrayList<Menu>();
		for (Menu menu : menuCommon) {
			if (menu.getParenteId() == id) {
				menu.setChildMenus(menuChild(menu.getmId()));
				childList.add(menu);
			}
		}
		return childList;
	}
}
