package com.gxzn.forestoa.common.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.notice.dao.NoticeMapper;
import com.gxzn.forestoa.modules.notice.entity.Notice;

/**
 * 通知发送失败后，从新发送
 */
@Service("noticeNotifyTaskService")
public class NoticeNotifyTaskService implements ITask {

	@Autowired
	private NoticeMapper noticeMapper;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void runTask() {

		List<Notice> notices = noticeMapper.selectSendError();
		if (notices != null) {
			logger.info("定时任务检测到通知发送失败，开始进行循环发送，预计重新发送共" + notices.size() + "条");
			for (Notice notice : notices) {

				String receivers = notice.getRemarks2();
				String[] NoticeReceiverIdArray = (receivers).split(",");
				Long[] noticeReceiverIdLong = new Long[NoticeReceiverIdArray.length];
				for (int i = 0; i < noticeReceiverIdLong.length; i++) {
					noticeReceiverIdLong[i] = Long.parseLong(NoticeReceiverIdArray[i]);
				}
				FastMsgUtil fastMsg = new FastMsgUtil();
				String Receivers = fastMsg.sysMsgUsersTemplate(noticeReceiverIdLong);
				SysMsg massage = new SysMsg();
				massage.setTitle(notice.getNoticeTitle());
				massage.setContent(notice.getNoticeContent());
				massage.setCategory(notice.getNoticeType());
				massage.setReceivers(Receivers);
				massage.setNeedreaded(1);

				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				notice.setRemarks3(flag);
				noticeMapper.update(notice);
			}
		}

	}

}
