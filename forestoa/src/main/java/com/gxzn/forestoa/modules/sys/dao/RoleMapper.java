package com.gxzn.forestoa.modules.sys.dao;

import java.util.List;

import com.gxzn.forestoa.modules.sys.entity.Menu;
import com.gxzn.forestoa.modules.sys.entity.Role;

/**
 * 角色Dao
 * @author jiabo
 *
 */
public interface RoleMapper {
	
	/**
	 * 根据id查询角色
	 * @param rId
	 * @return
	 */
	Role selectByKey(Long rId);

	/**
	 * 分页查询角色列表
	 * @return
	 */
	List<Role> findByPage();

	/**
	 * 添加单个角色对象
	 * @param role
	 */
	Long save(Role role);
	
	/**
	 * 批量添加角色菜单关联
	 * @param role
	 * @return
	 */
	Long saveRoleMenu(List<Menu> menus);

	/**
	 * 删除角色
	 * @param rId
	 * @return
	 */
	Long delete(Long rId);

	/**
	 * 更新角色对象
	 * @param role
	 * @return
	 */
	Long update(Role role);

	/**
	 * 批量删除角色菜单关联
	 * @param rmIds 关联id集合
	 * @return
	 */
	Long deleteRoleMenuSByrmId(List<String> rmIds);
	
}