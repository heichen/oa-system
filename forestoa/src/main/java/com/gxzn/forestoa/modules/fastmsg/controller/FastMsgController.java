package com.gxzn.forestoa.modules.fastmsg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gxzn.forestoa.modules.fastmsg.entity.Group;
import com.gxzn.forestoa.modules.fastmsg.entity.Msg;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.sys.entity.Org;
import com.gxzn.forestoa.modules.sys.entity.Users;

@RestController
@RequestMapping("/msg")
public class FastMsgController {

	@RequestMapping(value = "addUser")
	public String addUser(HttpServletRequest req, HttpServletResponse resp) {
		Users user = new Users();
		user.setUserId(111L);
		user.setUserNumber("test456");
		user.setUserName("肖红");
		user.setSex("女");
		user.setLoginPassword("123456");
		FastMsgUtil fastMsg = new FastMsgUtil();
		return FastMsgUtil.ERRORCODE[fastMsg.addUser(user)];
	}
	
	@RequestMapping(value = "addDepartment")
	public String AddDepartment(HttpServletRequest req, HttpServletResponse resp) {
		Org org=new Org();
		org.setoId(1L);
		org.setoName("测试组");
		FastMsgUtil fastMsg = new FastMsgUtil();
		return FastMsgUtil.ERRORCODE[fastMsg.AddDepartment(org)];
	}
	
	@RequestMapping(value = "SendMsg")
	public String SendMsg(HttpServletRequest req, HttpServletResponse resp) {
		Msg msg=new Msg();
		msg.setSender("110");
		msg.setReceiver("111");
		msg.setContent("你好啊！！！");
		FastMsgUtil fastMsg = new FastMsgUtil();
		return FastMsgUtil.ERRORCODE[fastMsg.SendMsg(msg)];
	}
	
	@RequestMapping(value = "AddGroup")
	public String AddGroup(HttpServletRequest req, HttpServletResponse resp) {
		Group group=new Group();
		group.setWorkgroupid(2);
		group.setGroupname("测试工作组");
		group.setCreator("1");
		group.setMembers("110,111");
		group.setGrouptype(1);
		
		FastMsgUtil fastMsg = new FastMsgUtil();
		return FastMsgUtil.ERRORCODE[fastMsg.AddGroup(group)];
	}
	
	@RequestMapping(value = "SendGroupMsg")
	public String SendGroupMsg(HttpServletRequest req, HttpServletResponse resp) {
		FastMsgUtil fastMsg = new FastMsgUtil();
		return FastMsgUtil.ERRORCODE[fastMsg.SendGroupMsg(1,"admin","大家好，这是测试组。")];
	}
	
	@RequestMapping(value = "SendSysMsg")
	public String SendSysMsg(HttpServletRequest req, HttpServletResponse resp) {
		SysMsg sysMsg=new SysMsg();
		sysMsg.setTitle("晚饭安排");
		sysMsg.setCategory("日常");
		sysMsg.setContent("XXXX吃饭");
		sysMsg.setForusertype(1);//指定用户类型内部用户
		//sysMsg.setForonlineusers(1);
		sysMsg.setReceivers("user_38");
		FastMsgUtil fastMsg = new FastMsgUtil();
		return FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(sysMsg)];
	}
}
