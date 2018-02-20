package com.gxzn.forestoa.modules.sys.service;

import java.util.List;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.entity.Role;

/**
 * 角色service
 * @author jiabo
 *
 */
public interface RoleService {

	/**
	 * 根据角色Id查询单个角色信息
	 * @param rId
	 * @return
	 */
	public Role selectByKey(Long rId);

	/**
	 * 分页查询角色列表
	 * @param role
	 * @return
	 */
	public void findByPage(DataTablesResult<Role> result);

	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public Long save(Role role);

	/**
	 * 删除角色
	 * @param rId
	 * @return
	 */
	public Long delete(Long rId);

	/**
	 * 更新角色
	 * @param role
	 * @return
	 */
	public Long update(Role role);
	
	/**
	 * 获取全部角色
	 * @return
	 */
	public List<Role> findAll();

}
