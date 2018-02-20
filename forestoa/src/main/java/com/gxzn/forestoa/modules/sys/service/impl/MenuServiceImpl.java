package com.gxzn.forestoa.modules.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.forestoa.modules.sys.dao.MenuMapper;
import com.gxzn.forestoa.modules.sys.entity.Menu;
import com.gxzn.forestoa.modules.sys.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuDao;

	@Override
	public List<Menu> getMenuTree(Long mId) {
		return menuDao.getMenuTree(mId);
	}

	@Override
	public List<Menu> getMenuTreeByrId(Long rId) {
		return menuDao.getMenuTreeByrId(rId);
	}

	@Override
	public List<Menu> getMenuListByrIds(List<Long> roles) {
		return menuDao.getMenuListByrIds(roles);
	}

	@Override
	public List<Menu> getMenuListAll() {
		return menuDao.getMenuListAll();
	}

}
