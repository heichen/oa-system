package com.gxzn.forestoa.modules.document.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.document.entity.DocumentReceiveTask;

/**
 * 公文收文任务dao
 * 
 * @author HaiTao
 *
 */
public interface DocumentReceiveTaskMapper {
	/**
	 * 保存收文任务
	 * 
	 * @param receiveTask
	 * @return
	 */
	Long saveReceiveTask(DocumentReceiveTask receiveTask);

	/**
	 * 根据收文人员id获取收文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	List<Map<String, Object>> getReceiveTask(Long endPersonId);

	/**
	 * 根据收文任务id获取收文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	Map<String, Object> getReceiveByTaskId(Long taskId);

	/**
	 * 更新收文任务为已办
	 * 
	 * @param taskId
	 * @return
	 */
	Long updateCompleteTask(DocumentReceiveTask receiveTask);

	/**
	 * 更新收文任务为退回
	 * 
	 * @param receiveTask
	 * @return
	 */
	Long updateReturnTask(DocumentReceiveTask receiveTask);

	/**
	 * 通过收文id查找开始人员
	 * 
	 * @param receiveId
	 * @return
	 */
	DocumentReceiveTask getStartPersonId(Long receiveId);
	/**
	 * 删除收文任务
	 * @param receiveId
	 * @return
	 */
	Long deleteDocumentReceiveTask(Long receiveId);
	/**
	 * 查询收文调用RTX提醒失败的信息
	 * 
	 * @param
	 * @return
	 */
	List<Map<String, Object>> selestErrorReceive();
	/**
	 * 更新收文RTX提醒标志位
	 * 
	 * @param
	 * @return
	 */
	Long updateRTXMSG(Map<String, Object> receiveTask);
	/**
	 * 查询当前id所有任务状态
	 * @param map
	 * @return
	 */
	Long getCompleteStatus(Long receiveId);
}