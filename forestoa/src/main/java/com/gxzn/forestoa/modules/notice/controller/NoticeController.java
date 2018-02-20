package com.gxzn.forestoa.modules.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.notice.entity.Notice;
import com.gxzn.forestoa.modules.notice.service.NoticeService;
import com.gxzn.forestoa.modules.sys.entity.Users;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("notice")
public class NoticeController {
	// 日志
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired
		private NoticeService noticeService;
		
		/**
		 * 查询所有通知通告
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAll")
		public ResponseModel<DataTablesResult<Notice>> selectAll(HttpServletRequest request,Notice notice) {

			ResponseModel<DataTablesResult<Notice>> res = new ResponseModel<DataTablesResult<Notice>>();
			try {
				DataTablesResult<Notice> result = new DataTablesResult<>(request);
				noticeService.selectAll(result,notice);
				res.success("分页查询通知通告成功", result);
				logger.info("分页查询通知通告成功");
			} catch (Exception e) {
				res.init("分页查询通知通告失败");
				logger.error("分页查询通知通告失败", e);
			}
			return res;
		}
		
		/**
		 * 根据通知通告Id进行查询
		 * 
		 * @param nId
		 * @return
		 */
		@RequestMapping(value = "selectByKey")
		public ResponseModel<Notice> selectByKey(Long noticeId) {
			ResponseModel<Notice> res = new ResponseModel<Notice>();
			try {
				res.success("根据通知通告Id进行查询成功",noticeService.selectByKey(noticeId));
				logger.info("根据通知通告Id进行查询成功");
			} catch (Exception e) {
				
				res.init("根据通知通告Id进行查询失败");
				logger.error("根据通知通告Id进行查询失败",e);
			}
			return res;
		} 
		
		/**
		 * 根据通知通告标题查询通知通告
		 * 
		 * @param temp
		 * @return
		 */
		@RequestMapping(value = "selectByTitle")
		public ResponseModel<List<Notice>> selectByTitle(String temp) {
			ResponseModel<List<Notice>> res = new ResponseModel<List<Notice>>();
			try {
				
				res.success("根据通知通告标题查询通知通告成功", noticeService.selectByTitle(temp));
				logger.info(StrFormatterUtils.format("根据通知通告标题查询通知通告成功", temp));
			} catch (Exception e) {
				
				res.init("根据通知通告标题查询通知通告失败");
				logger.error("根据通知通告标题查询通知通告失败",e);
			}
			return res;

		}
		
		/**
		 * 根据通知通告Id进行物理删除
		 * 
		 * @param nId
		 * @return
		 */
		@RequestMapping(value = "delete")
		public ResponseModel<Integer> delete(Long noticeId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据通知通告Id进行物理删除成功", noticeService.delete(noticeId));
				logger.info("根据通知通告Id进行物理删除划成功");
			} catch (Exception e) {
				
				res.init("根据通知通告Id进行物理删除失败");
				logger.error("根据通知通告Id进行物理删除失败",e);
			}
			return res;

		}
		
		/**
		 * 根据通知通告Id进行逻辑删除
		 * 
		 * @param nId
		 * @return
		 */
		@RequestMapping(value = "delete2")
		public ResponseModel<Integer> delete2(Long noticeId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据通知通告Id进行逻辑删除成功", noticeService.delete2(noticeId));
				logger.info("根据通知通告Id进行逻辑删除成功");
			} catch (Exception e) {
				
				res.init("根据通知通告Id进行逻辑删除失败");
				logger.error("根据通知通告Id进行逻辑删除失败",e);
			}
			return res;

		}
		
		/**
		 * 通知通告的编辑
		 * 
		 * @param notice
		 * @return
		 */
		@RequestMapping(value = "update")
		public ResponseModel<Integer> update(Notice notice) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("通知通告的编辑成功", noticeService.update(notice));
				logger.info("通知通告的编辑成功");
			} catch (Exception e) {
				
				res.init("通知通告的编辑失败");
				logger.error("通知通告的编辑失败");
			}
			return res;

		}
		
		/**
		 * 通知通告的添加
		 * 
		 * @param notice
		 * @return
		 */
		@RequestMapping(value = "insert")
		public ResponseModel<String> insert(HttpServletRequest req,Notice notice) {
			ResponseModel<String> res = new ResponseModel<String>();
			
			Users loginUser=(Users) req.getSession().getAttribute(SessionContans.USER_KEY);
			
			try {
				
				res.success("通知通告的添加成功", noticeService.insert(notice,loginUser));
				logger.info("通知通告的添加成功");
			} catch (Exception e) {
				
				res.init("通知通告的添加失败");
				logger.error("通知通告的添加失败",e);
			}
			return res;

		}
		
		@RequestMapping(value = "webMessage")
		public ResponseModel<Map<String,Object>> webMessage(HttpServletRequest req) {
			ResponseModel<Map<String,Object>> res = new ResponseModel<Map<String,Object>>();
			
			Users loginUser=(Users) req.getSession().getAttribute(SessionContans.USER_KEY);
			
			try {
				
				res.success("通知通告的添加成功", noticeService.webMessage());
				logger.info("通知通告的添加成功");
			} catch (Exception e) {
				
				res.init("通知通告的添加失败");
				logger.error("通知通告的添加失败",e);
			}
			return res;

		}
		
		@RequestMapping(value = "show")
		public String show(String title,String description,String type) {
			
			System.out.println("title="+title+"description="+description+"type="+type);
			
			return "成功";

		}
		
		

}
