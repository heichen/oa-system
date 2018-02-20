package com.gxzn.forestoa.modules.notice.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.notice.entity.UserNotice;
import com.gxzn.forestoa.modules.notice.service.UserNoticeService;
import com.gxzn.forestoa.modules.sys.entity.Users;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("userNotice")
public class UserNoticeController {
	// 日志
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired
		private UserNoticeService userNoticeService;
		
		/**
		 * 分页查询所有个人通知通告
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAll")
		public ResponseModel<DataTablesResult<UserNotice>> selectAll(HttpServletRequest request,UserNotice userNotice) {
			Users u = (Users) request.getSession().getAttribute(SessionContans.USER_KEY);
			userNotice.setUserId(u.getUserId());
			ResponseModel<DataTablesResult<UserNotice>> res = new ResponseModel<DataTablesResult<UserNotice>>();
			try {
				DataTablesResult<UserNotice> result = new DataTablesResult<>(request);
				userNoticeService.selectAll(result,userNotice);
				res.success("分页查询个人通知通告成功", result);
				logger.info("分页查询个人通知通告成功");
			} catch (Exception e) {
				res.init("分页查询个人通知通告失败");
				logger.error("分页查询个人通知通告失败", e);
			}
			return res;
		}
		
		/**
		 * 查询所有个人通知通告
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAll2")
		public ResponseModel<List<UserNotice>> selectAll2(HttpServletRequest request,UserNotice userNotice) {
			Users u = (Users) request.getSession().getAttribute(SessionContans.USER_KEY);
			userNotice.setUserId(u.getUserId());
			userNotice.setNoticeTitle("");
			
			ResponseModel<List<UserNotice>> res = new ResponseModel<List<UserNotice>>();
			try {
				res.success("分页查询个人通知通告成功", userNoticeService.selectAll2(userNotice));
				logger.info("分页查询个人通知通告成功");
			} catch (Exception e) {
				res.init("分页查询个人通知通告失败");
				logger.error("分页查询个人通知通告失败", e);
			}
			return res;
		}
		/**
		 * 分页查询所有个人通知通告
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAllByNId")
		public ResponseModel<DataTablesResult<UserNotice>> selectAllByNId(HttpServletRequest request,Long noticeId) {
			ResponseModel<DataTablesResult<UserNotice>> res = new ResponseModel<DataTablesResult<UserNotice>>();
			try {
				DataTablesResult<UserNotice> result = new DataTablesResult<>(request);
				userNoticeService.selectAllByNId(result,noticeId);
				res.success("分页查询个人通知通告成功", result);
				logger.info("分页查询个人通知通告成功");
			} catch (Exception e) {
				res.init("分页查询个人通知通告失败");
				logger.error("分页查询个人通知通告失败", e);
			}
			return res;
		}
		
		/**
		 * 根据个人通知通告Id进行查询
		 * 
		 * @param nId
		 * @return
		 */
		@RequestMapping(value = "selectByKey")
		public ResponseModel<UserNotice> selectByKey(Long userNoticeId) {
			ResponseModel<UserNotice> res = new ResponseModel<UserNotice>();
			try {
				
				res.success("根据个人通知通告Id进行物理删除成功", userNoticeService.selectByKey(userNoticeId));
				logger.info("根据个人通知通告Id进行物理删除划成功");
			} catch (Exception e) {
				
				res.init("根据个人通知通告Id进行物理删除失败");
				logger.error("根据个人通知通告Id进行物理删除失败",e);
			}
			return res;

		} 
		
		/**
		 * 根据个人通知通告Id进行物理删除
		 * 
		 * @param nId
		 * @return
		 */
		@RequestMapping(value = "delete")
		public ResponseModel<Integer> delete(Long userNoticeId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据个人通知通告Id进行物理删除成功", userNoticeService.delete(userNoticeId));
				logger.info("根据个人通知通告Id进行物理删除划成功");
			} catch (Exception e) {
				
				res.init("根据个人通知通告Id进行物理删除失败");
				logger.error("根据个人通知通告Id进行物理删除失败",e);
			}
			return res;

		}
		
		/**
		 * 根据个人通知通告Id进行逻辑删除
		 * 
		 * @param nId
		 * @return
		 */
		@RequestMapping(value = "delete2")
		public ResponseModel<Integer> delete2(Long userNoticeId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据个人通知通告Id进行逻辑删除成功", userNoticeService.delete2(userNoticeId));
				logger.info("根据个人通知通告Id进行逻辑删除成功");
			} catch (Exception e) {
				
				res.init("根据个人通知通告Id进行逻辑删除失败");
				logger.error("根据个人通知通告Id进行逻辑删除失败",e);
			}
			return res;

		}
		
		/**
		 * 个人通知通告的编辑
		 * 
		 * @param UserNotice
		 * @return
		 */
		@RequestMapping(value = "update")
		public ResponseModel<Integer> update(HttpServletRequest req,UserNotice userNotice) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			Users u = (Users) req.getSession().getAttribute(SessionContans.USER_KEY);
			userNotice.setUserId(u.getUserId());
			try {
				
				res.success("个人通知通告的编辑成功", userNoticeService.update(userNotice));
				logger.info("个人通知通告的编辑成功");
			} catch (Exception e) {
				
				res.init("个人通知通告的编辑失败");
				logger.error("个人通知通告的编辑失败");
			}
			return res;

		}
		

}
