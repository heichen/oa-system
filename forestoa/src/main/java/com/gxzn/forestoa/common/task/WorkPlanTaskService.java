package com.gxzn.forestoa.common.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.workplan.dao.WorkplanMapper;
import com.gxzn.forestoa.modules.workplan.entity.Workplan;

/**
 * 工作计划提醒定时任务
 * 
 * @author Administrator
 */
@Service(value = "workPlanTaskService")
public class WorkPlanTaskService implements ITask {
	@Autowired
	private WorkplanMapper workplanMapper;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void runTask() {
		List<Workplan> list = workplanMapper.worlplanNotice(); // 查找计划
		if (list == null) {
			return;
		}
		FastMsgUtil fastMsg = new FastMsgUtil();
		SysMsg massage = new SysMsg();
		logger.info("定时工作计划提醒定时任务，开始进行循环发送，预计重新发送共" + list.size() + "条");
		for (Workplan workplan : list) {
			massage.setTitle(workplan.getWorkplanTitle());
			massage.setContent("您今天的工作计划中有一项工作需要处理，请及时处理");
			massage.setCategory("工作计划");
			massage.setReceivers("user_" + workplan.getWorkplanOwner());
			String fast = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)]; // 调用助手发送工作计划提醒
			workplan.setRemarks1(fast);
			workplanMapper.update(workplan);
		}
	}
}
