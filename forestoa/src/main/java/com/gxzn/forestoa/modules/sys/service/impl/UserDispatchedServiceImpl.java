package com.gxzn.forestoa.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.forestoa.modules.sys.dao.UserDispatchedMapper;
import com.gxzn.forestoa.modules.sys.entity.UserDispatched;
import com.gxzn.forestoa.modules.sys.service.UserDispatchedService;

@Service("userDispatchedService")
public class UserDispatchedServiceImpl implements UserDispatchedService {

	@Autowired
	private UserDispatchedMapper userDispatchedDao;
	
	@Override
	public int insert(UserDispatched record) {
		int fasg=0;
		if(record.getUdId()==null) {
			//添加
			fasg=userDispatchedDao.insert(record);
		}else {
			//修改
			fasg=userDispatchedDao.update(record);
		}
		return fasg;
	}

	@Override
	public int update(UserDispatched record) {
		return userDispatchedDao.update(record);
	}

	@Override
	public UserDispatched getUserDispatched(Long uId) {
		return userDispatchedDao.getUserAssignedUid(uId);
	}
	@Override
	public int updateValid(UserDispatched userDispatched){
		
		return userDispatchedDao.updateValid(userDispatched);
	};

}
