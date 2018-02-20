package com.gxzn.forestoa.common.task;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.modules.briefing.dao.BriefingReceiveTaskMapper;
import com.gxzn.forestoa.modules.briefing.dao.BriefingSendTaskMapper;
import com.gxzn.forestoa.modules.document.dao.DocumentReceiveTaskMapper;
import com.gxzn.forestoa.modules.document.dao.DocumentSendTaskMapper;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;

/**
 * 公文,简报处理后，调用RTX提醒失败重试任务
 */
@Service("documentNotifyTaskService")
public class DocumentNotifyTaskService implements ITask {
	
	@Autowired
	private DocumentReceiveTaskMapper documentReceiveTaskMapper;
	
	@Autowired
	private DocumentSendTaskMapper documentSendTaskMapper;
	
	@Autowired
	private BriefingReceiveTaskMapper briefingReceiveTaskMapper;
	
	@Autowired
	private BriefingSendTaskMapper briefingSendTaskMapper;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void runTask() {
		//公文收文的调用RTX提醒失败重试任务
		List<Map<String, Object>> documentReceives = documentReceiveTaskMapper.selestErrorReceive();
		if (documentReceives != null) {
			logger.info("定时任务检测公文收文发送失败的信息，开始进行循环发送，预计重新发送共" + documentReceives.size() + "条");
			for (Map<String, Object> documentReceive : documentReceives) {

				
				FastMsgUtil fastMsg = new FastMsgUtil();
				SysMsg massage = new SysMsg();
				massage.setTitle("收文消息");
				massage.setContent("您有一条代办消息");
				massage.setCategory("公文收文消息");
				massage.setReceivers("user_"+documentReceive.get("END_PERSON_ID"));
				massage.setNeedreaded(1);

				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				documentReceive.put("RTX_MSG", flag);
				documentReceiveTaskMapper.updateRTXMSG(documentReceive);
			}
		}
		
		//公文发文的调用RTX提醒失败重试任务
		List<Map<String, Object>> documentSends = documentSendTaskMapper.selestErrorSend();
		if (documentSends != null) {
			logger.info("定时任务检测公文发文发送失败的信息，开始进行循环发送，预计重新发送共" + documentSends.size() + "条");
			for (Map<String, Object> documentSend : documentSends) {

				
				FastMsgUtil fastMsg = new FastMsgUtil();
				SysMsg massage = new SysMsg();
				massage.setTitle("收文消息");
				massage.setContent("您有一条代办消息");
				massage.setCategory("公文收文消息");
				massage.setReceivers("user_"+documentSend.get("END_PERSON_ID"));
				massage.setNeedreaded(1);

				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				documentSend.put("RTX_MSG", flag);
				documentSendTaskMapper.updateRTXMSG(documentSend);
			}
		}
		
		//简报收文的调用RTX提醒失败重试任务
		List<Map<String, Object>> briefingReceives = briefingReceiveTaskMapper.selestErrorBriefing();
		if (documentSends != null) {
			logger.info("定时任务检测简报收文发送失败的信息，开始进行循环发送，预计重新发送共" + briefingReceives.size() + "条");
			for (Map<String, Object> briefingReceive : briefingReceives) {

				
				FastMsgUtil fastMsg = new FastMsgUtil();
				SysMsg massage = new SysMsg();
				massage.setTitle("收文消息");
				massage.setContent("您有一条代办消息");
				massage.setCategory("公文收文消息");
				massage.setReceivers("user_"+briefingReceive.get("END_PERSON_ID"));
				massage.setNeedreaded(1);

				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				briefingReceive.put("RTX_MSG", flag);
				briefingReceiveTaskMapper.updateRTXMSG(briefingReceive);
			}
		}
		//简报发文的调用RTX提醒失败重试任务
		List<Map<String, Object>> briefingSends = briefingSendTaskMapper.selestErrorBriefing();
		if (documentSends != null) {
			logger.info("定时任务检测简报发文发送失败的信息，开始进行循环发送，预计重新发送共" + briefingSends.size() + "条");
			for (Map<String, Object> briefingSend : briefingSends) {

				
				FastMsgUtil fastMsg = new FastMsgUtil();
				SysMsg massage = new SysMsg();
				massage.setTitle("收文消息");
				massage.setContent("您有一条代办消息");
				massage.setCategory("公文收文消息");
				massage.setReceivers("user_"+briefingSend.get("END_PERSON_ID"));
				massage.setNeedreaded(1);

				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				briefingSend.put("RTX_MSG", flag);
				briefingSendTaskMapper.updateRTXMSG(briefingSend);
			}
		}
		
		
		
		
		
		
		
	
		
		
	}

}
