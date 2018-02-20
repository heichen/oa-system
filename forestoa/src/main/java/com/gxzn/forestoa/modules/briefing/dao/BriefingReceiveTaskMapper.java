package com.gxzn.forestoa.modules.briefing.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.briefing.entity.BriefingReceiveTask;

/**
 * 简报收文任务dao
 * 
 * @author HaiTao
 *
 */
public interface BriefingReceiveTaskMapper {
	/**
	 * 保存收文任务
	 * 
	 * @param receiveTask
	 * @return
	 */
	Long saveReceiveTask(BriefingReceiveTask receiveTask);

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
	Long updateCompleteTask(BriefingReceiveTask receiveTask);

	/**
	 * 更新收文任务为退回
	 * 
	 * @param receiveTask
	 * @return
	 */
	Long updateReturnTask(BriefingReceiveTask receiveTask);

	/**
	 * 通过收文id查找开始人员
	 * 
	 * @param receiveId
	 * @return
	 */
	BriefingReceiveTask getStartPersonId(Long receiveId);
	/**
	 * 删除收文任务
	 * @param receiveId
	 * @return
	 */
	Long deleteBriefingReceiveTask(Long receiveId);
	/**
	 * 查询收简报调用RTX提醒失败的信息
	 * 
	 * @param
	 * @return
	 */
	List<Map<String, Object>> selestErrorBriefing();
	/**
	 * 更新收简报RTX提醒标志位
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