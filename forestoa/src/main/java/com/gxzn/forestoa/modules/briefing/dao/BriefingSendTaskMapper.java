package com.gxzn.forestoa.modules.briefing.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.briefing.entity.BriefingSendTask;

/**
 * 简报发文任务dao
 * @author HaiTao
 *
 */
public interface BriefingSendTaskMapper {
	/**
	 * 保存发文任务
	 * 
	 * @param sendTask
	 * @return
	 */
	Long saveSendTask(BriefingSendTask sendTask);

	/**
	 * 根据发文人员id获取发文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	List<Map<String, Object>> getSendTask(Long endPersonId);
	/**
	 * 查询回退人员
	 * @param map
	 * @return
	 */
	Long  getReturnPersonId(Map<String,Object> map);
	/**
	 * 根据发文任务id获取发文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	Map<String, Object> getSendByTaskId(Long taskId);


	/**
	 * 通过任务id查找开始人员
	 * 
	 * @param sendId
	 * @return
	 */
	BriefingSendTask getStartPersonId(Long sendId);
	/**
	 * 更新发文任务为已办
	 * 
	 * @param taskId
	 * @return
	 */
	Long updateCompleteTask(BriefingSendTask sendTask);

	/**
	 * 更新发文任务为退回
	 * 
	 * @param receiveTask
	 * @return
	 */
	Long updateReturnTask(BriefingSendTask sendTask);
	/**
	 * 删除发文任务
	 * @param sendId
	 * @return
	 */
	Long deleteBriefingSendTask(Long sendId);
	/**
	 * 查询发简报调用RTX提醒失败的信息
	 * 
	 * @param
	 * @return
	 */
	List<Map<String, Object>> selestErrorBriefing();
	/**
	 * 更发简报RTX提醒标志位
	 * 
	 * @param
	 * @return
	 */
	Long updateRTXMSG(Map<String, Object> sendTask);
}