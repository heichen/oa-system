package com.gxzn.forestoa.modules.notice.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.notice.entity.Notice;
import com.gxzn.forestoa.modules.sys.entity.Users;

/**
 * 通知提醒service接口
 * 
 * @author HaiTao
 *
 */
public interface NoticeService {
	/**
	 * 查询所有通知通告
	 * 
	 * @return
	 */
	public void selectAll(DataTablesResult<Notice> result,Notice notice);
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
	public String insert(Notice notice,Users user);
	
	public Map<String,Object> webMessage();
	

}
