package com.gxzn.forestoa.modules.task.dao;

import java.util.List;
import java.util.Map;

public interface WorkTaskMapper {

	/**
	 * 公文收文待办数
	 * @param userId
	 * @return
	 */
	int getDocReceiveTaskNum(Map<String,Object> params);
	
	/**
	 * 公文发文待办数
	 * @param userId
	 * @return
	 */
	int getDocSendTaskNum(Map<String,Object> params);
	
	/**
	 * 简报收文待办数
	 * @param userId
	 * @return
	 */
	int getBfReceiveTaskNum(Map<String,Object> params);
	
	/**
	 * 简报发文待办数
	 * @param userId
	 * @return
	 */
	int getBfSendTaskNum(Map<String,Object> params);

	/**
	 * 公文收文待办任务简要
	 * @param userId
	 * @return
	 */
	List<Map<String, Object>> getDocReceive(Map<String,Object> params);

	/**
	 * 公文发文待办任务简要
	 * @param userId
	 * @return
	 */
	List<Map<String, Object>> getDocSend(Map<String,Object> params);
	
	/**
	 * 简报收文待办任务简要
	 * @param userId
	 * @return
	 */
	List<Map<String, Object>> getBfReceive(Map<String,Object> params);
	
	/**
	 * 简报发文待办任务简要
	 * @param userId
	 * @return
	 */
	List<Map<String, Object>> getBfSend(Map<String,Object> params);

	/**
	 * 我的公文分页查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findMyDocBfByPage(Map<String, Object> params);

	/**
	 * 公文管理分页查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findMyDocBfByAllPage(Map<String, Object> params);
	
}
