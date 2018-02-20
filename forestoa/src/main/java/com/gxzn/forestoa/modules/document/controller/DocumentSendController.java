package com.gxzn.forestoa.modules.document.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.document.entity.DocumentSend;
import com.gxzn.forestoa.modules.document.entity.DocumentSendTask;
import com.gxzn.forestoa.modules.document.entity.SendNumber;
import com.gxzn.forestoa.modules.document.service.DocumentSendService;

/**
 * 公文发文controller
 * 
 * @author HaiTao
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/documentSend")
public class DocumentSendController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "documentSendService")
	private DocumentSendService sendService;

	/**
	 * 保存发文 点击提交按钮
	 * 
	 * @param send
	 * @param files
	 * @return
	 */
	@RequestMapping(value = "saveSend")
	public ResponseModel<Long> saveSend(DocumentSend send, @RequestParam("files") MultipartFile[] files) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			rm.success("保存发文信息成功", sendService.saveSend(send, files));
			logger.info(StrFormatterUtils.format("保存发文信息成功{}", send));
		} catch (Exception e) {
			rm.init("保存发文信息失败");
			logger.error("保存发文" + send + "信息失败", e);
		}
		return rm;
	}
	/**
	 * 发文回退
	 * @param send
	 * @param files
	 * @return
	 */
	@RequestMapping(value = "returnSend")
	public ResponseModel<Long> returnSend(DocumentSend send, @RequestParam("files") MultipartFile[] files) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			rm.success("保存回退信息成功", sendService.updatereturnSend(send, files));
			logger.info(StrFormatterUtils.format("保存回退信息成功{}", send));
		} catch (Exception e) {
			rm.init("保存回退信息失败");
			logger.error("保存发文" + send + "信息失败", e);
		}
		return rm;   
	}
	/**
	 * 保存草稿信息
	 * @param send
	 * @param files
	 * @return
	 */
	@RequestMapping(value = "saveDraft")
	public ResponseModel<Long> saveDraft(DocumentSend send, @RequestParam("files") MultipartFile[] files) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			rm.success("保存草稿信息成功", sendService.saveDraft(send, files));
			logger.info(StrFormatterUtils.format("保存草稿信息成功{}", send));
		} catch (Exception e) {
			rm.init("保存回退信息失败");
			logger.error("保存草稿" + send + "信息失败", e);
		}
		return rm;  
	}
	/**
	 * 通过发文任务id获取发文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	@RequestMapping(value = "getSendByTaskId")
	public ResponseModel<Map<String, Object>> getSendByTaskId(Long taskId) {
		ResponseModel<Map<String, Object>> rm = new ResponseModel<Map<String, Object>>();
		try {
			rm.success("根据发文任务id获取发文详细信息成功", sendService.getSendByTaskId(taskId));
			logger.info(StrFormatterUtils.format("根据发文任务id获取发文详细信息成功{}", JSON.toJSONString(taskId)));
		} catch (Exception e) {
			rm.init("根据发文任务id获取发文详细信息失败");
			logger.error("根据发文任务id" + taskId + "获取发文详细信息失败", e);
		}
		return rm;
	}

	/**
	 * 根据发文人员id获取待办包括退回发文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	@RequestMapping(value = "getSendTask")
	public ResponseModel<List<Map<String, Object>>> getSendTask(Long endPersonId) {
		ResponseModel<List<Map<String, Object>>> rm = new ResponseModel<List<Map<String, Object>>>();
		try {
			rm.success("根据发文人员id获取发文待办任务成功", sendService.getSendTask(endPersonId));
			logger.info(StrFormatterUtils.format("根据发文人员id获取待办发文任务成功{}", JSON.toJSONString(endPersonId)));
		} catch (Exception e) {
			rm.init("根据发文人员id获取发文待办任务失败");
			logger.error("根据发文人员id" + endPersonId + "获取发文待办任务失败", e);
		}
		return rm;
	}

	/**
	 * 根据发文id获取详细信息
	 * 
	 * @param sendId
	 * @return
	 */
	@RequestMapping(value = "getSendBySendId")
	public ResponseModel<List<Map<String, Object>>> getSendBySendId(Long sendId) {
		ResponseModel<List<Map<String, Object>>> rm = new ResponseModel<List<Map<String, Object>>>();
		try {
			rm.success("根据发文id获取详细信息成功", sendService.getSendBySendId(sendId));
			logger.info(StrFormatterUtils.format("根据发文id获取详细信息成功{}", JSON.toJSONString(sendId)));
		} catch (Exception e) {
			rm.init("根据发文id获取详细信息失败");
			logger.error("根据发文id" + sendId + "获取详细信息失败", e);
		}
		return rm;
	}
	/**
	 * 通过任务id查找开始人员
	 * 
	 * @param sendId
	 * @return
	 */
	@RequestMapping(value = "getStartPersonId")
	public ResponseModel<DocumentSendTask> getStartPersonId(Long sendId) {
		ResponseModel<DocumentSendTask> rm = new ResponseModel<DocumentSendTask>();
		try {
			rm.success("通过任务id查找开始人员成功", sendService.getStartPersonId(sendId));
			logger.info(StrFormatterUtils.format("通过任务id查找开始人员成功{}", JSON.toJSONString(sendId)));
		} catch (Exception e) {
			rm.init("通过任务id查找开始人员失败");
			logger.error("通过任务id" + sendId + "查找开始人员失败", e);
		}
		return rm;
	}
	/**
	 * 保存并获取最大发文文号 根据类型
	 * @param sendNumber
	 * @return
	 */
	@RequestMapping(value = "saveSendNumber")
	public ResponseModel<Long> saveSendNumber(@RequestBody SendNumber sendNumber) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			rm.success("保存并获取最大发文文号成功", sendService.saveSendNumber(sendNumber));
			logger.info(StrFormatterUtils.format("保存并获取最大发文文号成功{}", JSON.toJSONString(sendNumber)));
		} catch (Exception e) {
			rm.init("保存并获取最大发文文号失败");
			logger.error("保存" + sendNumber + "并获取最大发文文号失败", e);
		}
		return rm;
	}
	
	/**
	 * 根据发文id删除发文
	 * 
	 * @param sendId
	 * @return
	 */
	@RequestMapping(value = "deleteDocumentSend")
	public ResponseModel<Long> deleteDocumentSend(Long sendId) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			sendService.deleteDocumentSend(sendId);
			rm.success("根据发文id删除发文成功", sendId);
			logger.info(StrFormatterUtils.format("根据发文id删除发文成功{}", JSON.toJSONString(sendId)));
		} catch (Exception e) {
			rm.init("根据发文id删除发文失败");
			logger.error("根据发文id" + sendId + "删除发文失败", e);
		}
		return rm;
	}
}
