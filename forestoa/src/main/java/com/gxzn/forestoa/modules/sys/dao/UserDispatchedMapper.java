package com.gxzn.forestoa.modules.sys.dao;

import java.util.List;

import com.gxzn.forestoa.modules.sys.entity.UserDispatched;

/**
 * 人员委派
 * @author jiabo
 *
 */
public interface UserDispatchedMapper {

	/**
	 * 添加人员委派
	 * @param record
	 * @return
	 */
	int insert(UserDispatched record);
	
	/**
	 * 更新人员委派
	 * @param record
	 * @return
	 */
	int update(UserDispatched record);
	
	/**
	 * 委派人id查询委派信息(一个人同时最多只能委派给一个人A->B)
	 * @param uId
	 * @return
	 */
	UserDispatched getUserAssignedUid(Long uId);
	
	/**
	 * 根据授权人，查找委派人列表。一个人可能会被多个人授权(B->A)
	 * @param uId
	 * @return
	 */
	List<UserDispatched> getUserAcceptUid(Long uId);
	
	/**
	 * assignedUid人员的所有委派,设置为无效
	 * @param assignedUid 人员id
	 * @return
	 */
	int updateValid(UserDispatched userDispatched);
}
