package com.gxzn.forestoa.modules.notice.dao;

import java.util.List;

import com.gxzn.forestoa.modules.notice.entity.UserNotice;



/**
 * 个人通告dao接口
 * 
 * @author wangchen
 *
 */
public interface UserNoticeMapper {
	/**
	 * 查询所有个人通知通告
	 * 
	 * @return
	 */
	public List<UserNotice> selectAll(UserNotice userNotice);
	/**
	 * 根据通知ID查询所有个人通知通告
	 * 
	 * @return
	 */
	public List<UserNotice> selectAllByNId(Long noticeId);
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
	/**
	 * 批量添加个人通知通告
	 * @param userNotice
	 * @return
	 */
	public int insertList(List<UserNotice> userNotice);
    
}