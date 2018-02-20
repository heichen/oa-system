package com.gxzn.forestoa.modules.document.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gxzn.forestoa.modules.document.entity.DocumentSend;
import com.gxzn.forestoa.modules.document.entity.DocumentSendTask;
import com.gxzn.forestoa.modules.document.entity.SendNumber;

/**
 * 公文发文service
 * 
 * @author HaiTao
 *
 */
public interface DocumentSendService {
	/**
	 * 保存
	 * 
	 * @param Send
	 * @return
	 * @throws IOException
	 */
	Long saveSend(DocumentSend send, @RequestParam("files") MultipartFile[] files) throws IOException;

	/**
	 * 回退
	 * 
	 * @param Send
	 * @return
	 * @throws IOException
	 */
	Long updatereturnSend(DocumentSend send, @RequestParam("files") MultipartFile[] files) throws IOException;

	/**
	 * 保存草稿
	 * 
	 * @param send
	 * @param files
	 * @return
	 * @throws IOException 
	 */
	Long saveDraft(DocumentSend send, @RequestParam("files") MultipartFile[] files) throws IOException;

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
	 * 通过任务id查找开始人员
	 * 
	 * @param sendId
	 * @return
	 */
	DocumentSendTask getStartPersonId(Long sendId);
	/**
	 * 删除发文
	 * 
	 * @return
	 */
	void deleteDocumentSend(Long sendId);
	/**
	 * 获取发文文号
	 * @param sendNumber
	 * @return
	 */
	Long saveSendNumber(SendNumber sendNumber);
}
