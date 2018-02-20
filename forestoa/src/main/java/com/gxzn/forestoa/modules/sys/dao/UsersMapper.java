package com.gxzn.forestoa.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.entity.Users;

/**
 * 人员管理mapper接口
 * 
 * @author wangchen
 *
 */
public interface UsersMapper {
	/**
	 * 查询所有人员
	 * 
	 * @return
	 */
	public List<Users> selectAll();
	/**
	 * 查询所有人员(除了登录者)
	 * 
	 * @return
	 */
	public List<Users> selectAllE(Users user);
	/**
	 * 根据组织去查找人
	 * 
	 * @return
	 */
	public List<Users> selectAllByOrg(Map<String, Object> params);
	/**
	 * 查询所有人员(参数查询)
	 * 
	 * @return
	 */
	public List<Users> selectAll2(Users user);
	
	
	
	/**
	 * 根据人员管理Id查询单个人员管理
	 * @param userId
	 * @return
	 */
	public Users selectByKey(Long userId);
	/**
	 * 根据用户工号查询单个用户信息
	 * @param uNumber
	 * @return
	 */
	public Users selectByUnumber(Users user);
	/**
	 * 根据人员标题查询工作计划
	 * @param temp
	 * @return
	 */
	public List<Users> selectByTitle(String temp);
	
	/**
	 * 根据人员Id进行物理删除
	 * @param userId
	 * @return
	 */
	public int delete(Long userId);
	/**
	 * 根据人员Id进行逻辑删除
	 * @param userId
	 * @return
	 */
	public int delete2(Long userId);
	/**
	 * 修改密码
	 * @param Users
	 * @return
	 */
	public int updatePassword(Users Users);
	/**
	 * 人员的编辑
	 * @param Users
	 * @return
	 */
	public int update(Users Users);
	/**
	 * 人员的添加
	 * @param Users
	 * @return
	 */
	public int insert(Users Users);
	/**
	 * 用户登录
	 * @param users
	 * @return
	 */
	public Users login(Users users);
	
	/**
	 * 根据角色查询人员列表
	 * @param rId
	 * @return
	 */
	public List<Users> selectUserByRoleId(Long rId);

}
