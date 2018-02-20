package com.gxzn.forestoa.modules.document.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.document.entity.DocumentSendTask;

/**
 * 公文发文任务dao
 * 
 * @author HaiTao
 *
 */
public interface DocumentSendTaskMapper {
	/**
	 * 保存发文任务
	 * 
	 * @param sendTask
	 * @return
	 */
	Long saveSendTask(DocumentSendTask sendTask);

	/**
	 * 根据发文人员id获取发文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	List<Map<String, Object>> getSendTask(Long endPersonId);

	/**
	 * 根据发文任务id获取发文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	Map<String, Object> getSendByTaskId(Long taskId);

	/**
	 * 通过id得到task任务
	 * 
	 * @param taskId
	 * @return
	 */
	DocumentSendTask getTaskById(Long taskId);

	/**
	 * 查询回退人员
	 * 
	 * @param map
	 * @return
	 */
	Long getReturnPersonId(Map<String, Object> map);

	/**
	 * 通过任务id查找开始人员
	 * 
	 * @param sendId
	 * @return
	 */
	DocumentSendTask getStartPersonId(Long sendId);

	/**
	 * 更新task
	 * 
	 */
	Long updateTask(DocumentSendTask sendTask);

	/**
	 * 更新发文任务为已办
	 * 
	 * @param taskId
	 * @return
	 */
	Long updateCompleteTask(DocumentSendTask sendTask);

	/**
	 * 更新发文任务为退回
	 * 
	 * @param receiveTask
	 * @return
	 */
	Long updateReturnTask(DocumentSendTask sendTask);

	/**
	 * 删除发文任务
	 * 
	 * @param sendId
	 * @return
	 */
	Long deleteDocumentSendTask(Long sendId);

	/**
	 * 查询发文调用RTX提醒失败的信息
	 * 
	 * @param
	 * @return
	 */
	List<Map<String, Object>> selestErrorSend();

	/**
	 * 更新发文RTX提醒标志位
	 * 
	 * @param
	 * @return
	 */
	Long updateRTXMSG(Map<String, Object> sendTask);
}