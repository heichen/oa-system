package com.gxzn.forestoa.modules.document.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.document.entity.SendNumber;
import com.gxzn.forestoa.modules.document.service.SendNumberService;
import com.gxzn.forestoa.modules.sys.entity.Users;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("sendNumber")
public class SendNumberController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private SendNumberService sendNumberService;

	@RequestMapping(value = "selectAll")
	public ResponseModel<List<Map<String,Object>>> selectAll() {
		ResponseModel<List<Map<String,Object>>> res = new ResponseModel<List<Map<String,Object>>>();
		List<Map<String,Object>> list = sendNumberService.selectAll();
		try {
			
				res.success("查询文号成功", list);
				logger.info("查询文号成功");
			
		} catch (Exception e) {
			res.init("查询文号失败");
			logger.error("查询文号失败", e);
		}

		return res;
	}
	
	
	@RequestMapping(value = "update")
	public ResponseModel<Integer> update(SendNumber sendNumber) {
		ResponseModel<Integer> res = new ResponseModel<Integer>();
		try {
			
				res.success("更新文号成功", sendNumberService.update(sendNumber));
				logger.info("更新文号成功");
			
		} catch (Exception e) {
			res.init("更新文号失败");
			logger.error("更新文号失败", e);
		}

		return res;
	}
	
	
	@RequestMapping(value = "selectById")
	public ResponseModel<SendNumber> selectById(Long ID) {
		ResponseModel<SendNumber> res = new ResponseModel<SendNumber>();
		try {
			
				res.success("根据ID文号成功", sendNumberService.selectById(ID));
				logger.info("根据ID文号成功");
			
		} catch (Exception e) {
			res.init("根据ID文号失败");
			logger.error("根据ID文号失败", e);
		}

		return res;
	}
	
	
}
