package com.gxzn.forestoa.modules.briefing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gxzn.forestoa.modules.briefing.entity.BriefingReceive;

/**
 * 简报收文service
 * 
 * @author HaiTao
 *
 */
public interface BriefingReceiveService {
	/**
	 * 保存收文
	 * 
	 * @param receive
	 * @return
	 */
	Long saveReceive(BriefingReceive receive,@RequestParam("files") MultipartFile[] files);
	/**
	 * 保存退回收文
	 * 
	 * @param receive
	 * @return
	 */
	Long saveReturnReceive(BriefingReceive receive);

	/**
	 * 通过收文id获取收文详细信息
	 * 
	 * @param receiveId
	 * @return
	 */
	List<Map<String, Object>> getReceiveByReceiveId(Long receiveId);

	/**
	 * 根据收文任务id获取收文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	Map<String, Object> getReceiveByTaskId(Long taskId);

	/**
	 * 根据收文人员id获取收文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	List<Map<String, Object>> getReceiveTask(Long endPersonId);


	/**
	 * 删除收文
	 * 
	 * @return
	 */
	void deleteBriefingReceive(Long receiveId);
}
