package com.gxzn.forestoa.modules.notice.dao;

import java.util.List;

import com.gxzn.forestoa.modules.notice.entity.Notice;

/**
 * 通知通告dao接口
 * 
 * @author wangchen
 *
 */
public interface NoticeMapper {
	/**
	 * 查询所有通知通告
	 * 
	 * @return
	 */
	public List<Notice> selectAll(Notice notice);
	/**
	 * 根据通知通告Id查询单个工作计划
	 * @param nId
	 * @return
	 */
	public Notice selectByKey(Long noticeId);
	/**
	 * 根据通知通告标题查询工作计划
	 * @param temp
	 * @return
	 */
	public List<Notice> selectByTitle(String temp);
	/**
	 * 查询发送失败的提醒
	 * @param temp
	 * @return
	 */
	public List<Notice> selectSendError();
	
	/**
	 * 根据通知通告Id进行物理删除
	 * @param nId
	 * @return
	 */
	public int delete(Long noticeId);
	/**
	 * 根据通知通告Id进行逻辑删除
	 * @param nId
	 * @return
	 */
	public int delete2(Long noticeId);
	/**
	 * 通知通告的编辑
	 * @param notice
	 * @return
	 */
	public int update(Notice notice);
	/**
	 * 通知通告的添加
	 * @param notice
	 * @return
	 */
	public int insert(Notice notice);
    
}