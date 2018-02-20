package com.gxzn.forestoa.modules.sys.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.dao.MenuMapper;
import com.gxzn.forestoa.modules.sys.dao.RoleMapper;
import com.gxzn.forestoa.modules.sys.entity.Menu;
import com.gxzn.forestoa.modules.sys.entity.Role;
import com.gxzn.forestoa.modules.sys.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleDao;
	
	@Autowired
	private MenuMapper menuDao;

	@Override
	public Role selectByKey(Long rId) {
		return roleDao.selectByKey(rId);

	}

	@Override
	public void findByPage(DataTablesResult<Role> result) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Role> list = roleDao.findByPage();
		// 用PageInfo对结果进行包装
		PageInfo<Role> pageInfo = new PageInfo<Role>(list);
		
		
		List<Menu> menus=menuDao.getMenuListByrIdList(pageInfo.getList());
	/*	for (Role role : pageInfo.getList()) {
			//查询每个角色所拥有的操作菜单
			role.setMenus(menuDao.getMenuListByrId(role.getrId()));
		}*/
		for(Menu menu:menus) {
			for(Role role:pageInfo.getList()) {
				if(role.getrId()==menu.getrId()) {
					if(role.getMenus()!=null) {
						role.getMenus().add(menu);
					}else {
						List<Menu> rmenus=new ArrayList<>();
						rmenus.add(menu);
						role.setMenus(rmenus);
					}
					break;
				}
			}
		}
		//封装数据给DataTables  
		result.setDraw(result.getDraw());  
		result.setData(pageInfo.getList());    
		//数据库里总共记录数
		result.setRecordsTotal((int)pageInfo.getTotal());   
		//过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int)pageInfo.getTotal());
	}

	@Override
	public Long save(Role role) {
		role.setCreateTime(new Date());
		// 保存角色对象
		roleDao.save(role);
		//需要绑定的menu集合
		List<Menu> menus =new ArrayList<>();
		for (Menu menu : role.getMenus()) {
			if(menu.getBinDing()==1) {
				menu.setrId(role.getrId());
				menus.add(menu);
			}
		}
		if(menus.size()>0) {
			// 保存角色菜单关联
			roleDao.saveRoleMenu(menus);
		}
		
		return role.getrId();
	}

	@Override
	public Long delete(Long rId) {
		return roleDao.delete(rId);
	}

	@Override
	public Long update(Role role) {
		// 更新角色对象
		roleDao.update(role);
		
		//需要绑定的menu集合
		List<Menu> menus =new ArrayList<>();
		//需要删除的就得menu绑定id
		List<String> removermIdlist=new ArrayList<>();
		for (Menu menu : role.getMenus()) {
			String rmId = menu.getRmId();
			//判断是否绑定存在关系 存在是true，不存在是false
			boolean rmIdIsnull=(rmId!=null&&rmId.trim().length()!=0);
			int binDing = menu.getBinDing();
			if (rmIdIsnull&& binDing == 0) {
				// 存在绑定关系,binDing==0。则取消之前的绑定
				removermIdlist.add(menu.getRmId());
			} else if (!rmIdIsnull&& binDing == 1) {
				// 如果不存在绑定关系,binDing==1。则添加新的绑定关系
				menu.setrId(role.getrId());
				menus.add(menu);
			}
		}
		if(menus.size()>0) {
			// 保存角色菜单关联
			roleDao.saveRoleMenu(menus);
		}
		if(removermIdlist.size()>0) {
			//批量删除旧的的关联
			roleDao.deleteRoleMenuSByrmId(removermIdlist);
		}
		return role.getrId();
	}

	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		return roleDao.findByPage();
	}

}
