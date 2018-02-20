package com.gxzn.forestoa.modules.sys.service;

import com.gxzn.forestoa.modules.sys.entity.UserDispatched;

public interface UserDispatchedService {


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
	 * 根据人员id获取有效的委派（一条）
	 * @param uId
	 * @return
	 */
	UserDispatched getUserDispatched(Long uId);

	int updateValid(UserDispatched userDispatched);

	
}
