package com.gxzn.forestoa.modules.briefing.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.briefing.entity.BriefingReceive;
import com.gxzn.forestoa.modules.briefing.service.BriefingReceiveService;

/**
 * 简报收文controller
 * 
 * @author HaiTao
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/briefingReceive")
public class BriefingReceiveController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "briefingReceiveService")
	private BriefingReceiveService receiveService;

	/**
	 * 保存收文 点击提交按钮
	 * 
	 * @param receive
	 * @return
	 */
	@RequestMapping(value = "saveReceive")
	public ResponseModel<Long> saveReceive(BriefingReceive receive,@RequestParam("files") MultipartFile[] files) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			rm.success("保存收文信息成功", receiveService.saveReceive(receive,files));
			logger.info(StrFormatterUtils.format("保存收文信息成功{}", receive));
		} catch (Exception e) {
			rm.init("保存收文信息失败");
			logger.error("保存收文" + receive + "信息失败", e);
		}
		return rm;
	}

	/**
	 * 通过收文任务id获取收文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	@RequestMapping(value = "getReceiveByTaskId")
	public ResponseModel<Map<String, Object>> getReceiveByTaskId(Long taskId) {
		ResponseModel<Map<String, Object>> rm = new ResponseModel<Map<String, Object>>();
		try {
			rm.success("根据收文任务id获取收文详细信息成功", receiveService.getReceiveByTaskId(taskId));
			logger.info(StrFormatterUtils.format("根据收文任务id获取收文详细信息成功{}", JSON.toJSONString(taskId)));
		} catch (Exception e) {
			rm.init("根据收文任务id获取收文详细信息失败");
			logger.error("根据收文任务id" + taskId + "获取收文详细信息失败", e);
		}
		return rm;
	}
	/**
	 * 通过收文id获取收文详细信息
	 * 
	 * @param taskId
	 * @return
	 */
	@RequestMapping(value = "getReceiveByReceiveId")
	public ResponseModel<List<Map<String, Object>>> getReceiveByReceiveId(Long receiveId) {
		ResponseModel<List<Map<String, Object>>> rm = new ResponseModel<List<Map<String, Object>>>();
		try {
			rm.success("根据收文id获取收文详细信息成功", receiveService.getReceiveByReceiveId(receiveId));
			logger.info(StrFormatterUtils.format("根据收文id获取收文详细信息成功{}", JSON.toJSONString(receiveId)));
		} catch (Exception e) {
			rm.init("根据收文id获取收文详细信息失败");
			logger.error("根据收文id" + receiveId + "获取收文详细信息失败", e);
		}
		return rm;
	}
	/**
	 * 根据收文人员id获取待办包括退回收文任务
	 * 
	 * @param endPersonId
	 * @return
	 */
	@RequestMapping(value = "getReceiveTask")
	public ResponseModel<List<Map<String, Object>>> getReceiveTask(Long endPersonId) {
		ResponseModel<List<Map<String, Object>>> rm = new ResponseModel<List<Map<String, Object>>>();
		try {
			rm.success("根据收文人员id获取收文待办任务成功", receiveService.getReceiveTask(endPersonId));
			logger.info(StrFormatterUtils.format("根据收文人员id获取待办收文任务成功{}", JSON.toJSONString(endPersonId)));
		} catch (Exception e) {
			rm.init("根据收文人员id获取收文待办任务失败");
			logger.error("根据收文人员id" + endPersonId + "获取收文待办任务失败", e);
		}
		return rm;
	}

	/**
	 * 根据收文id删除收文
	 * 
	 * @param receiveId
	 * @return
	 */
	@RequestMapping(value = "deleteBriefingReceive")
	public ResponseModel<Long> deleteBriefingReceive(Long receiveId) {
		ResponseModel<Long> rm = new ResponseModel<Long>();
		try {
			receiveService.deleteBriefingReceive(receiveId);
			rm.success("根据收文id删除收文成功", receiveId);
			logger.info(StrFormatterUtils.format("根据收文id删除收文成功{}", JSON.toJSONString(receiveId)));
		} catch (Exception e) {
			rm.init("根据收文id删除收文失败");
			logger.error("根据收文id" + receiveId + "删除收文失败", e);
		}
		return rm;
	}
}
