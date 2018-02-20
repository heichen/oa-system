package com.gxzn.forestoa.modules.briefing.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gxzn.forestoa.modules.briefing.entity.BriefingSend;
import com.gxzn.forestoa.modules.document.entity.DocumentSend;

/**
 * 简报发文service
 * 
 * @author HaiTao
 *
 */
public interface BriefingSendService {
	/**
	 * 保存
	 * 
	 * @param Send
	 * @return
	 * @throws IOException 
	 */
	Long saveSend(BriefingSend send) throws IOException ;
	/**
	 * 回退
	 * 
	 * @param Send
	 * @return
	 * @throws IOException 
	 */
	Long updatereturnSend(BriefingSend send, @RequestParam("files") MultipartFile[] files) throws IOException;

	/**
	 * 通过发文id获取发文详细信息
	 * 
	 * @param SendId
	 * @return
	 */
	List<Map<String, Object>> getSendBySendId(Long sendId);

	/**
	 * 根据发文任务id获取发文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	Map<String, Object> getSendByTaskId(Long taskId);

	/**
	 * 根据发文人员id获取发文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	List<Map<String, Object>> getSendTask(Long endPersonId);

	/**
	 * 根据发文类型,获取最大的发文文号
	 * 
	 * @return
	 */
	Long getMaxNumber(String type);

	/**
	 * 删除发文
	 * 
	 * @return
	 */
	void deleteBriefingSend(Long sendId);
}
