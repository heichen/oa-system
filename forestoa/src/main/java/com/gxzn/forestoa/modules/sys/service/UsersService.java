package com.gxzn.forestoa.modules.sys.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.entity.Users;
/**
 * 人员管理service接口
 * 
 * @author wangchen
 *
 */
import com.gxzn.forestoa.modules.sys.entity.ZTree;
public interface UsersService {
	/**
	 * 查询所有人员管理
	 * 
	 * @return
	 */
	public void selectAll(DataTablesResult<Users> result);
	/**
	 * 查询所有人员管理(参数查询)
	 * 
	 * @return
	 */
	public void selectAll2(DataTablesResult<Users> result,Users user);
	/**
	 * 根据人员管理Id查询单个工作计划
	 * @param userId
	 * @return
	 */
	public Users selectByKey(Long userId);
	
	/**
	 * 根据人员管理标题查询工作计划
	 * @param temp
	 * @return
	 */
	public List<Users> selectByTitle(String temp);
	
	/**
	 * 根据人员管理Id进行物理删除
	 * @param userId
	 * @return
	 */
	public int delete(Long userId);
	/**
	 * 根据人员管理Id进行逻辑删除
	 * @param userId
	 * @return
	 */
	public int delete2(Long userId);
	/**
	 * 人员管理的编辑
	 * @param Users
	 * @return
	 */
	public int update(Users users);
	/**
	 * 人员管理的添加
	 * @param Users
	 * @return
	 */
	public int insert(Users users);
	/**
	 * 用户登录
	 * @param users
	 * @return
	 */
	public Users login(Users users);
	/**
	 * 用户修改密码
	 * @param users
	 * @return
	 */
	public int updatePassword(Users users);
	
	/**
	 * 获取组织人员树
	 * @return
	 */
	public List<ZTree> getUsersTree();
	
	/**
	 * 根据角色id获取人员树
	 * @param rId 角色id
	 * @return
	 */
	public List<ZTree> selectUserByRoleId(Long rId);
	/**
	 * 根据角色id获取人员
	 * @param rId 角色id
	 * @return
	 */
	public List<Users> selectUserRId(Long rId);
	
	
	/**
	 * 根据组织去查找人
	 * 
	 * @return
	 */
	public List<Users> selectAllByOrg(Map<String, Object> params);

}
