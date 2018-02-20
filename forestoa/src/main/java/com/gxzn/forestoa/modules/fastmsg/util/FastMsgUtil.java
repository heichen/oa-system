package com.gxzn.forestoa.modules.fastmsg.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.HttpRequestUtils;
import com.gxzn.ares.framework.utils.PropertiesLoader;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.ares.framework.xml.XmlElement;
import com.gxzn.ares.framework.xml.XmlParser;
import com.gxzn.ares.framework.xml.XmlParserFactory;
import com.gxzn.ares.framework.xml.parseinfo.ContentXmlParseInfo;
import com.gxzn.forestoa.modules.fastmsg.entity.Group;
import com.gxzn.forestoa.modules.fastmsg.entity.Msg;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.sys.entity.Org;
import com.gxzn.forestoa.modules.sys.entity.Users;

public class FastMsgUtil {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private String key;
	private String serverUrl;
	private String timeout;
	public static final String[] ERRORCODE = { "正确", "未知错误", "未知版本", "无效参数", "已存在", "不存在", "超时", "已登录", "未登录", "帐号不存在",
			"密码错误", "帐号已停用", "登录令牌错误", "超出最大值", "没有权限" };

	public FastMsgUtil() {
		PropertiesLoader propertiesLoader = new PropertiesLoader("application.properties");
		this.key = propertiesLoader.getProperty("FastMsg.key");
		this.serverUrl = propertiesLoader.getProperty("FastMsg.serverUrl");
		this.timeout = propertiesLoader.getProperty("FastMsg.timeout");
	}

	public static void main(String[] args) {
		Users user = new Users();
		user.setUserId(110L);
		user.setUserNumber("test123");
		user.setUserName("张三");
		user.setSex("男");
		user.setOrgId(44L);
		user.setRoleId1(3L);
		user.setPhone("11111111111");
		user.setEmail("123@123.com");
		user.setLoginPassword("123456");
		FastMsgUtil fastMsg = new FastMsgUtil();
		System.out.println(FastMsgUtil.ERRORCODE[fastMsg.addUser(user)]);
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	public int addUser(Users user) {
		int fast = 1;
		String url = serverUrl + "adduser";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始添加fastmsg用户");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("userid", user.getUserId());
			params.put("username", user.getUserNumber());// 用户名称，登录名称-警号
			/*if(user.getRoleId()<9||user.getRoleId1()<9||user.getRoleId2()<9) {
				//0: 普通用户; 1: 管理员
				params.put("userrole", 1);
			}*/
			params.put("userrole", user.getUserType());
			params.put("nickname", user.getUserName());// 用户昵称
			params.put("gender", "男".equals(user.getSex())?1:2);// 性别 0未设置，1男，2女，3保密
			params.put("mobile", user.getPhone());// 手机号
			params.put("email", user.getEmail());// 电子邮箱
			params.put("departid", user.getOrgId1());// 部门ID
			params.put("password", user.getLoginPassword());// 密码明文
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("添加Fastmsg用户:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("添加Fastmsg用户失败", e);
			//e.printStackTrace();
		}
		return fast;
	}

	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public int ModifyUser(Users user) {
		int fast = 1;
		String url = serverUrl + "modifyuser";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始修改fastmsg用户");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("useridorname", user.getUserId());//用户ID/用户名
			//params.put("username", user.getUserNumber());// 用户名称，登录名称-警号
			params.put("nickname", user.getUserName());// 用户昵称
			params.put("gender", user.getSex()=="男"?1:2);//性别 0未设置，1男，2女，3保密
			params.put("mobile", user.getPhone());// 手机号
			params.put("email", user.getEmail());// 电子邮箱
			params.put("departid", user.getOrgId1());// 部门ID
			//params.put("password", user.getLoginPassword());// 密码明文
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();	
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("修改Fastmsg用户:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("修改Fastmsg用户失败",e);
		}
		return fast;
	}
	
	/**
	 * 修改用户登录密码
	 * @param useridorname 用户ID/用户名
	 * @param password 登录密码(明文)
	 * @return
	 */
	public int ChangePassword(Long useridorname,String password) {
		int fast = 1;
		String url = serverUrl + "changepassword";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始修改fastmsg用户的登录密码");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("useridorname", useridorname);//用户ID/用户名
			params.put("password", password);// 密码明文
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("修改Fastmsg用户的登录密码:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("修改Fastmsg用户的登录密码失败",e);
		}
		return fast;
	}
	
	/**
	 * 验证用户的登录密码 
	 * @param useridorname 用户ID/用户名
	 * @param password 登录密码(明文)
	 * @return
	 */
	public int ValidatePassword(String useridorname,String password) {
		int fast = 1;
		String url = serverUrl + "validatepassword";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始验证fastmsg用户的登录密码");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("useridorname", useridorname);//用户ID/用户名
			params.put("password", password);// 密码明文
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("验证Fastmsg用户的登录密码:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("验证Fastmsg用户的登录密码失败",e);
		}
		return fast;
	}
	
	/**
	 * 删除用户
	 * @param uId
	 * @return
	 */
	public int RemoveUser(Long uId) {
		int fast = 1;
		String url = serverUrl + "removeuser";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始删除uId="+uId+"fastmsg用户");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("useridorname", uId);
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("删除Fastmsg用户:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("删除Fastmsg用户失败",e);
		}
		return fast;
	}
	
	/**
	 * 添加组织
	 * @param org
	 * @return
	 */
	public int AddDepartment(Org org) {
		int fast = 1;
		String url = serverUrl + "adddepartment";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始添加Fastmsg组织");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("departid", org.getoId());//部门ID
			params.put("departname", org.getoName());// 部门名字
			params.put("parentdepartid", org.getParenteId()!=null?org.getParenteId():0);// 父部门ID,0: 无上级部门;非0: 指定上级部门ID	
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("添加Fastmsg组织:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("删除Fastmsg组织Exception",e);
		}
		return fast;
	}
	
	/**
	 * 修改组织
	 * @param org
	 * @return
	 */
	public int ModifyDepartment(Org org) {
		int fast = 1;
		String url = serverUrl + "modifydepartment";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始修改Fastmsg组织");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("departid", org.getoId());//部门ID
			params.put("departname", org.getoName());// 部门名字
			//params.put("parentdepartid", org.getParenteId()!=null?org.getParenteId():0);// 父部门ID,0: 无上级部门;非0: 指定上级部门ID	
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("修改Fastmsg组织:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("修改Fastmsg组织失败",e);
		}
		return fast;
	}
	
	/**
	 * 删除部门
	 * @param oId
	 * @return
	 */
	public int RemoveDepartment(Long oId) {
		int fast = 1;
		String url = serverUrl + "removedepartment";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始删除oId="+oId+"Fastmsg组织");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("departid", oId);//部门ID
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("删除Fastmsg组织:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("删除Fastmsg组织失败",e);
		}
		return fast;
	}
	
	/**
	 * 发送消息
	 * @param msg
	 * @return
	 */
	public int SendMsg(Msg msg) {
		int fast = 1;
		String url = serverUrl + "sendmsg";
		Map<String, Object> params = new HashMap<>();
		logger.info(StrFormatterUtils.format("开的发送消息{}",JSON.toJSONString(msg)));
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("sender", msg.getSender());//发送者(用户ID/用户名)
			params.put("receiver", msg.getReceiver());//接收者(用户ID/用户名)
			params.put("content", msg.getContent());//内容
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("发送Fastmsg消息:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("发送Fastmsg消息失败",e);
		}
		return fast;
	}
	
	/**
	 * 添加群组
	 * @param group
	 * @return
	 */
	public int AddGroup(Group group) {
		int fast = 1;
		String url = serverUrl + "addgroup";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始添加Fastmsg群组");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("workgroupid", group.getWorkgroupid());// 工作组ID
			params.put("grouptype",group.getGrouptype() );// 群组类型 0: 临时群组; 1: 普通群组
			params.put("groupname", group.getGroupname());	// 群组名称 非空
			params.put("introduction", group.getIntroduction());	// 群介绍
			params.put("joinsetting", group.getJoinsetting());	// 加群设置0: 允许加入; 1: 需要验证; 2: 不允许加入
			params.put("creator", group.getCreator());	// 创建者(用户ID/用户名) 非空
			params.put("members", group.getMembers());	// 群成员ID(格式:1,2,3...)
			
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("添加Fastmsg群组:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("添加Fastmsg群组失败",e);
		}
		return fast;
	}
	
	/**
	 * 冻结群组
	 * @param groupid  群组ID
	 * @param locked 是否冻结,0: 正常 1: 冻结 默认0
	 * @return
	 */
	public int LockGroup(int groupid,int locked) {
		int fast = 1;
		String url = serverUrl + "lockgroup";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始冻结Fastmsg群组");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("groupid", groupid);// 群组ID
			params.put("locked",locked);// 是否冻结,0: 正常 1: 冻结
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("冻结Fastmsg群组:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("冻结Fastmsg群组失败",e);
		}
		return fast;
	}
	
	/**
	 * 删除群组
	 * @param groupid
	 * @return
	 */
	public int RemoveGroup (int groupid) {
		int fast = 1;
		String url = serverUrl + "removegroup";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始删除groupid="+groupid+"Fastmsg群组");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("groupid", groupid);// 群组ID
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("删除Fastmsg群组:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("删除Fastmsg群组失败",e);
		}
		return fast;
	}
	
	/**
	 * 修改群组，名称
	 * @param groupid 群组id 非0
	 * @param groupname 群组名称 非空
	 * @return
	 */
	public int ChangeGroupName (int groupid,String groupname) {
		int fast = 1;
		String url = serverUrl + "changegroupname";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始修改groupid="+groupid+"Fastmsg群组名称");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("groupid", groupid);// 群组ID非0
			params.put("groupname",groupname);	// 群组名称 非空
			
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("修改Fastmsg群组名称:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("修改Fastmsg群组名称失败",e);
		}
		return fast;
	}
	
	/**
	 * 添加群成员
	 * @param groupid 群组ID 非0
	 * @param members 群成员ID(格式:1,2,3...)
	 * @return
	 */
	public int AddGroupMember (int groupid,String members) {
		int fast = 1;
		String url = serverUrl + "addgroupmember";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始添加groupid="+groupid+"Fastmsg群组成员");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("groupid", groupid);// 群组ID非0
			params.put("members",members);	// 群组名称 非空
			
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("添加Fastmsg群组成员:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("添加Fastmsg群组成员失败",e);
		}
		return fast;
	}
	
	/**
	 * 删除群组成员
	 * @param groupid 群组ID 非0
	 * @param memberid 群成员ID(即用户ID) 非0
	 * @return
	 */
	public int RemoveGroupMember(int groupid,int memberid) {
		int fast = 1;
		String url = serverUrl + "removegroupmember";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始删除groupid="+groupid+"Fastmsg群组成员");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("groupid", groupid);// 群组ID
			params.put("memberid",memberid);// 群成员ID(即用户ID)
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("删除Fastmsg群组成员:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("删除Fastmsg群组成员失败",e);
		}
		return fast;
	}
	
	/**
	 * 发送群组消息
	 * @param groupid 群组ID 非0
	 * @param sender 发送者(用户ID/用户名) 非空
	 * @param content 内容 非空
	 * @return
	 */
	public int SendGroupMsg(int groupid,String sender,String content) {
		int fast = 1;
		String url = serverUrl + "sendgroupmsg";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始发送groupid="+groupid+"Fastmsg群组消息");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			params.put("groupid", groupid);// 群组ID
			params.put("sender",sender);// 发送者(用户ID/用户名)
			params.put("content",content);// 内容
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("发送Fastmsg群组消息:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("发送Fastmsg群组消息失败",e);
		}
		return fast;
	}
	
	
	/**
	 * 发送系统消息
	 * @param sysMsg
	 * @return
	 */
	public int SendSysMsg(SysMsg sysMsg) {
		int fast = 1;
		String url = serverUrl + "sendsysmsg";
		Map<String, Object> params = new HashMap<>();
		logger.info("开始发送Fastmsg系统消息");
		try {
			params.put("key", key);
			/** 此处如果改为1，提交，返回错误代码3(参数不合法) **/
			params.put("ispost", 0);// 是否POST提交,0: false 1: true
			params.put("timeout", timeout);
			
			params.put("workgroupid", sysMsg.getWorkgroupid());
			params.put("title",sysMsg.getTitle());
			params.put("category",sysMsg.getCategory());
			params.put("content",sysMsg.getContent());
			params.put("link",sysMsg.getLink());
			params.put("forusertype",sysMsg.getForusertype());
			params.put("foronlineusers",sysMsg.getForonlineusers());
			params.put("receivers",sysMsg.getReceivers());
			params.put("needreaded",sysMsg.getNeedreaded());
			params.put("needfeedback",sysMsg.getNeedfeedback());
		
			String xmlhtml = HttpRequestUtils.post(url, params, true).body();
			ContentXmlParseInfo xmlParseInfo = new ContentXmlParseInfo(xmlhtml);
			XmlParser parser = XmlParserFactory.createXmlParser(xmlParseInfo);
			XmlElement parse = parser.parse();
			for (XmlElement xmlElement : parse) {
				// System.out.println(xmlElement.getElementName() + "\t" +
				// xmlElement.getNodeText());
				if (xmlElement.getElementName() == "errorcode") {
					fast = Integer.parseInt(xmlElement.getNodeText());
				}
			}
			logger.info("发送Fastmsg系统消息:"+ERRORCODE[fast]);
		} catch (Exception e) {
			logger.error("发送Fastmsg系统消息失败",e);
		}
		return fast;
	}
	
	/**
	 * 获取用户组的格式
	 * @param userIds
	 * @return
	 */
	public String sysMsgUsersTemplate(List<Long> userIds) {
		StringBuffer usres = new StringBuffer();
		for(int i=0;i<userIds.size();i++) {
			Long userId=userIds.get(i);
			if(i==(userIds.size()-1)){
				usres.append("user_"+userId);
			}else {
				usres.append("user_"+userId);
				usres.append(",");
			}
		}
		return usres.toString();
	}
	
	/**
	 * 获取用户组的格式
	 * @param userIds
	 * @return
	 */
	public String sysMsgUsersTemplate(Long[] userIds) {
		StringBuffer usres = new StringBuffer();
		for(int i=0;i<userIds.length;i++) {
			Long userId=userIds[i];
			if(i==(userIds.length-1)){
				usres.append("user_"+userId);
			}else {
				usres.append("user_"+userId);
				usres.append(",");
			}
		}
		return usres.toString();
	}
	
	/**
	 * 获取组织部门的格式
	 * @param orgIds
	 * @return
	 */
	public String sysMsgDepartTemplate(Long[] orgIds) {
		StringBuffer departs = new StringBuffer();
		for(int i=0;i<orgIds.length;i++) {
			Long orgId=orgIds[i];
			if(i==(orgIds.length-1)){
				departs.append("depart_"+orgId);
			}else {
				departs.append("depart_"+orgId);
				departs.append(",");
			}
		}
		return departs.toString();
	}
	
	/**
	 * 获取组织部门的格式
	 * @param orgIds
	 * @return
	 */
	public String sysMsgDepartTemplate(List<Long> orgIds) {
		StringBuffer departs = new StringBuffer();
		for(int i=0;i<orgIds.size();i++) {
			Long orgId=orgIds.get(i);
			if(i==(orgIds.size()-1)){
				departs.append("depart_"+orgId);
			}else {
				departs.append("depart_"+orgId);
				departs.append(",");
			}
		}
		return departs.toString();
	}
}
