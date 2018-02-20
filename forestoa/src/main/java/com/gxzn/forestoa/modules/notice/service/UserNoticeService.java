package com.gxzn.forestoa.modules.notice.service;


import java.util.List;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.notice.entity.UserNotice;

/**
 * 个人通知提醒service接口
 * 
 * @author HaiTao
 *
 */
public interface UserNoticeService {
	/**
	 * 分页查询所有个人通知通告
	 * 
	 * @return
	 */
	public void selectAll(DataTablesResult<UserNotice> result,UserNotice userNotice);
	/**
	 * 根据通知ID查询所有个人通知通告
	 * 
	 * @return
	 */
	public void selectAllByNId(DataTablesResult<UserNotice> result,Long noticeId);
	/**
	 * 查询所有个人通知通告
	 * 
	 * @return
	 */
	public List<UserNotice> selectAll2(UserNotice userNotice);
	/**
	 * 根据个人通知通告Id查询单个工作计划
	 * @param nId
	 * @return
	 */
	public UserNotice selectByKey(Long userNoticeId);
	
	/**
	 * 根据个人通知通告Id进行物理删除
	 * @param nId
	 * @return
	 */
	public int delete(Long userNoticeId);
	/**
	 * 根据个人通知通告Id进行逻辑删除
	 * @param nId
	 * @return
	 */
	public int delete2(Long userNoticeId);
	/**
	 * 个人通知通告的编辑
	 * @param 
	 * @return
	 */
	public int update(UserNotice userNotice);
	/**
	 * 个人通知通告的添加
	 * @param 
	 * @return
	 */
	public int insert(UserNotice userNotice);
    
	

}
