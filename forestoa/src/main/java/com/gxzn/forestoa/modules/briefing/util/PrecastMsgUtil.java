package com.gxzn.forestoa.modules.briefing.util;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.HttpRequestUtils;
import com.gxzn.ares.framework.utils.PropertiesLoader;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
/**
 * 预投栏目发送消息
 * @author HaiTao
 *
 */
public class PrecastMsgUtil {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private String serverUrl;

	public PrecastMsgUtil() {
		PropertiesLoader propertiesLoader = new PropertiesLoader("application.properties");
		this.serverUrl = propertiesLoader.getProperty("PrecastMsg.serverUrl");
	}

	/**
	 * 简报发送预投栏目消息
	 * 
	 * @param msg
	 * @return
	 */
	public String SendMsg(String content) {
		String url = serverUrl;
		String msg = "";
		Map<String, Object> params = new HashMap<>();
		logger.info(StrFormatterUtils.format("发送消息{}", JSON.toJSONString(content)));
		try {
			params.put("content", content);// 内容
			msg = HttpRequestUtils.post(url, params, true).body();
			logger.info("简报发送预投栏目消息:" + msg);
		} catch (Exception e) {
			logger.error("简报发送预投栏目消息", e);
		}
		return msg;
	}
}
