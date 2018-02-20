package com.gxzn.forestoa.modules.unitManage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.unitManage.entity.Unit;
import com.gxzn.forestoa.modules.unitManage.service.UnitService;

/**
 * 收发单位控制类
 * 
 * @author wangchen
 * @CrossOrigin(origins = "*") 解决跨域问题 
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("unit")
public class UnitController {
	// 日志
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired
		private UnitService unitService;
		
		/**
		 * 查询所有收发单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAll")
		public ResponseModel<DataTablesResult<Unit>> selectAll(HttpServletRequest request,String status) {

			ResponseModel<DataTablesResult<Unit>> res = new ResponseModel<DataTablesResult<Unit>>();
			try {
				DataTablesResult<Unit> result = new DataTablesResult<>(request);
				unitService.selectAll(result,status);
				res.success("分页查询收发单位成功", result);
				logger.info("分页查询收发单位成功");
			} catch (Exception e) {
				res.init("分页查询收发单位失败");
				logger.error("分页查询收发单位失败", e);
			}
			return res;
		}
		/**
		 * 查询所有来文单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectByLAI")
		public ResponseModel<List<Unit>> selectByLAI(HttpServletRequest request) {

			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("查询来文单位成功", unitService.selectByLAI());
				logger.info("查询来文单位成功");
			} catch (Exception e) {
				res.init("查询来文单位失败");
				logger.error("查询来文单位失败", e);
			}
			return res;
		}
		/**
		 * 查询所有抄送单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectByCHAO")
		public ResponseModel<List<Unit>> selectByCHAO(HttpServletRequest request) {

			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("查询抄送单位成功", unitService.selectByCHAO());
				logger.info("查询抄送单位成功");
			} catch (Exception e) {
				res.init("查询抄送单位失败");
				logger.error("查询抄送单位失败", e);
			}
			return res;
		}
		/**
		 * 查询所有主送单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectByZHU")
		public ResponseModel<List<Unit>> selectByZHU(HttpServletRequest request) {

			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("查询主送单位成功", unitService.selectByZHU());
				logger.info("查询主送单位成功");
			} catch (Exception e) {
				res.init("查询主送单位失败");
				logger.error("查询主送单位失败", e);
			}
			return res;
		}
		/**
		 * 通过Id查询抄送单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectCHAOAIById")
		public ResponseModel<List<Unit>> selectCHAOAIById(Long unitId) {

			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("通过Id查询抄送单位成功", unitService.selectCHAOAIById(unitId));
				logger.info("通过Id查询抄送单位成功");
			} catch (Exception e) {
				res.init("通过Id查询抄送单位失败");
				logger.error("通过Id查询来文单位失败", e);
			}
			return res;
		}
		/**
		 * 通过Id查询来文单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectLAIById")
		public ResponseModel<List<Unit>> selectLAIById(Long unitId) {

			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("通过Id查询来文单位成功", unitService.selectLAIById(unitId));
				logger.info("通过Id查询来文单位成功");
			} catch (Exception e) {
				res.init("通过Id查询来文单位失败");
				logger.error("通过Id查询来文单位失败", e);
			}
			return res;
		}
		/**
		 * 通过Id查询主送单位
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectZHUAIById")
		public ResponseModel<List<Unit>> selectZHUAIById(Long unitId) {

			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("通过Id查询主送单位成功", unitService.selectZHUAIById(unitId));
				logger.info("通过Id查询主送单位成功");
			} catch (Exception e) {
				res.init("通过Id查询主送单位失败");
				logger.error("通过Id查询主送单位失败", e);
			}
			return res;
		}
		
		
		/**
		 * 根据收发单位Id进行查询
		 * 
		 * @param wId
		 * @return
		 */
		@RequestMapping(value = "selectByKey")
		public ResponseModel<Unit> selectByKey(Long unitId) {
			ResponseModel<Unit> res = new ResponseModel<Unit>();
			try {
				res.success("根据收发单位Id进行查询成功",unitService.selectByKey(unitId));
				logger.info("根据收发单位Id进行查询成功");
			} catch (Exception e) {
				
				res.init("根据收发单位Id进行查询失败");
				logger.error("根据收发单位Id进行查询失败",e);
			}
			return res;
		} 
		
		/**
		 * 根据收发单位标题查询收发单位
		 * 
		 * @param temp
		 * @return
		 */
		@RequestMapping(value = "selectByName")
		public ResponseModel<List<Unit>> selectByTitle(String temp) {
			ResponseModel<List<Unit>> res = new ResponseModel<List<Unit>>();
			try {
				
				res.success("根据收发单位标题查询收发单位成功", unitService.selectByTitle(temp));
				logger.info(StrFormatterUtils.format("根据收发单位标题查询收发单位成功", temp));
			} catch (Exception e) {
				
				res.init("根据收发单位标题查询收发单位失败");
				logger.error("根据收发单位标题查询收发单位失败",e);
			}
			return res;

		}
		
		/**
		 * 根据收发单位Id进行物理删除
		 * 
		 * @param wId
		 * @return
		 */
		@RequestMapping(value = "delete")
		public ResponseModel<Integer> delete(Long unitId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据收发单位Id进行物理删除成功", unitService.delete(unitId));
				logger.info("根据收发单位Id进行物理删除划成功");
			} catch (Exception e) {
				
				res.init("根据收发单位Id进行物理删除失败");
				logger.error("根据收发单位Id进行物理删除失败",e);
			}
			return res;

		}
		
		/**
		 * 根据收发单位Id进行逻辑删除
		 * 
		 * @param wId
		 * @return
		 */
		@RequestMapping(value = "delete2")
		public ResponseModel<Integer> delete2(Long unitId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据收发单位Id进行逻辑删除成功", unitService.delete2(unitId));
				logger.info("根据收发单位Id进行逻辑删除成功");
			} catch (Exception e) {
				
				res.init("根据收发单位Id进行逻辑删除失败");
				logger.error("根据收发单位Id进行逻辑删除失败",e);
			}
			return res;

		}
		
		/**
		 * 收发单位的编辑
		 * 
		 * @param Unit
		 * @return
		 */
		@RequestMapping(value = "update")
		public ResponseModel<Integer> update(Unit Unit) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("收发单位的编辑成功", unitService.update(Unit));
				logger.info("收发单位的编辑成功");
			} catch (Exception e) {
				
				res.init("收发单位的编辑失败");
				logger.error("收发单位的编辑失败",e);
			}
			return res;

		}
		
		/**
		 * 收发单位的添加
		 * 
		 * @param Unit
		 * @return
		 */
		@RequestMapping(value = "insert")
		public ResponseModel<Integer> insert(Unit Unit) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("收发单位的添加成功", unitService.insert(Unit));
				logger.info("收发单位的添加成功");
			} catch (Exception e) {
				
				res.init("收发单位的添加失败");
				logger.error("收发单位的添加失败",e);
			}
			return res;

}
		}
