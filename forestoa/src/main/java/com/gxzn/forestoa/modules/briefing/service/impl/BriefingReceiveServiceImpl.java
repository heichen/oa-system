package com.gxzn.forestoa.modules.briefing.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.gxzn.forestoa.common.util.EncodeUtil;
import com.gxzn.forestoa.common.util.FilesUtil;
import com.gxzn.forestoa.modules.briefing.dao.BriefingReceiveMapper;
import com.gxzn.forestoa.modules.briefing.dao.BriefingReceiveTaskMapper;
import com.gxzn.forestoa.modules.briefing.entity.BriefingReceive;
import com.gxzn.forestoa.modules.briefing.entity.BriefingReceiveTask;
import com.gxzn.forestoa.modules.briefing.service.BriefingReceiveService;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Users;

@Service("briefingReceiveService")
public class BriefingReceiveServiceImpl implements BriefingReceiveService {
	@Autowired
	private BriefingReceiveMapper receivedao;
	@Autowired
	private BriefingReceiveTaskMapper receiveTaskdao;
	@Value("${briReceFiles}")
	private String dir;// 上传默认目录
	@Autowired
	private UsersMapper usersMapper;
	@Value("${froestoaUrl}")
	private String froestoaUrl;

	@Override
	public Long saveReceive(BriefingReceive receive, MultipartFile[] files) {
		// 文件路径
		String filePath = dir;
		FastMsgUtil fastMsg = new FastMsgUtil();
		SysMsg massage = new SysMsg();
		FilesUtil fileutil = new FilesUtil();
		List<BriefingReceiveTask> receiveTasks = JSON.parseArray(receive.getTasks().trim().toString(),
				BriefingReceiveTask.class);
		BriefingReceiveTask receiveTask;
		int size = receiveTasks.size();
		// 判断收文id是否为空
		if (receive.getReceiveId() != null) {// 之前有保存收文记录
			for (int i = 0; i < size; i++) {
				receiveTask = receiveTasks.get(i);
				if (receiveTask.getEndPersonId() != null && receiveTask.getEndNodeId() != null) {
					// 更新上一个的任务状态变为已办
					receiveTask.setEndTime(new Date());
					receiveTaskdao.updateCompleteTask(receiveTask);
					BriefingReceiveTask receiveTask2 = new BriefingReceiveTask();
					receiveTask2.setStartTime(new Date());
					receiveTask2.setReceiveId(receiveTask.getReceiveId());
					receiveTask2.setRemarks("");
					receiveTask2.setStartPersonId(receiveTask.getStartPersonId());
					receiveTask2.setStartNodeId(receiveTask.getStartNodeId());
					receiveTask2.setEndPersonId(receiveTask.getEndPersonId());
					receiveTask2.setEndNodeId(receiveTask.getEndNodeId());
					// 保存收文任务;
					receiveTaskdao.saveReceiveTask(receiveTask2);
					massage.setTitle("收文消息!");
					massage.setContent("您有一个收文待办消息!");
					massage.setCategory("公文收文消息");
					Users user = usersMapper.selectByKey(receiveTasks.get(0).getStartPersonId());
					String msg="number="+user.getUserNumber()+"&pwd="+
							user.getLoginPassword()+"&url=/Filebriefingreceivedetail?taskId="
							+receiveTask.getTaskId();
					massage.setLink(froestoaUrl+"/sso/toTask?params="+EncodeUtil.encode(msg));
					massage.setReceivers("user_" + receiveTasks.get(0).getStartPersonId());
					massage.setNeedreaded(1);
					String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("RTX_MSG", flag);
					map.put("TASK_ID", receiveTask2.getTaskId());
					receiveTaskdao.updateRTXMSG(map);
				} else {// 当前是最后一个节点
						// 更新收文为已归档
					BriefingReceiveTask receiveTask2 = new BriefingReceiveTask();
					receiveTask2.setTaskId(receiveTask.getTaskId());
					receiveTask2.setEndTime(new Date());
					receiveTaskdao.updateCompleteTask(receiveTask2);
					Long count = receiveTaskdao.getCompleteStatus(receive.getReceiveId());
					receivedao.updateReceive(receive);
					if(count<=0) {
						receivedao.updateReceiveStatus(receiveTask.getReceiveId());
					}
				}

			}

		} else {// 第一次保存收文
			// 保存收文对象
			receive.setPofile(files[0].getOriginalFilename());
			receivedao.saveReceive(receive);
			String path = filePath + receive.getReceiveId() + "/";
			fileutil.filesUpload(files, path);
			BriefingReceiveTask receiveTask2 = new BriefingReceiveTask();
			receiveTask2.setReceiveId(receive.getReceiveId());
			receiveTask2.setStartPersonId(receiveTasks.get(0).getStartPersonId());
			receiveTask2.setEndPersonId(receiveTasks.get(0).getStartPersonId());
			receiveTask2.setStartNodeId(1);
			receiveTask2.setEndNodeId(1);
			receiveTask2.setStartTime(new Date());
			receiveTask2.setEndTime(new Date());
			receiveTask2.setRemarks(receiveTasks.get(0).getRemarks());
			receiveTask2.setTaskStatus("1");
			// 保存自己给自己的收文任务
			receiveTaskdao.saveReceiveTask(receiveTask2);
			for (int i = 0; i < size; i++) {
				receiveTask = receiveTasks.get(i);
				receiveTask.setReceiveId(receive.getReceiveId());
				receiveTask.setStartTime(new Date());
				// 保存传给下一节点的收文任务;
				receiveTaskdao.saveReceiveTask(receiveTask);
				massage.setTitle("收文消息!");
				massage.setContent("您有一个收文待办消息!");
				massage.setCategory("简报收文消息");
				Users user = usersMapper.selectByKey(receiveTasks.get(0).getStartPersonId());
				String msg="number="+user.getUserNumber()+"&pwd="+
						user.getLoginPassword()+"&url=/Filebriefingreceivedetail?taskId="
						+receiveTask.getTaskId();
				massage.setLink(froestoaUrl+"/sso/toTask?params="+EncodeUtil.encode(msg));
				massage.setReceivers("user_" + receiveTask.getEndPersonId());
				massage.setNeedreaded(1);
				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("RTX_MSG", flag);
				map.put("TASK_ID", receiveTask.getTaskId());
				receiveTaskdao.updateRTXMSG(map);
			}

		}
		return receive.getReceiveId();
	}

	@Override
	public List<Map<String, Object>> getReceiveTask(Long endPersonId) {
		return receiveTaskdao.getReceiveTask(endPersonId);
	}

	@Override
	public List<Map<String, Object>> getReceiveByReceiveId(Long receiveId) {

		return receivedao.getReceiveByReceiveId(receiveId);
	}

	@Override
	public void deleteBriefingReceive(Long receiveId) {
		receiveTaskdao.deleteBriefingReceiveTask(receiveId);
		receivedao.deleteBriefingReceive(receiveId);
	}

	@Override
	public Map<String, Object> getReceiveByTaskId(Long taskId) {
		return receiveTaskdao.getReceiveByTaskId(taskId);
	}

	@Override
	public Long saveReturnReceive(BriefingReceive receive) {
		BriefingReceiveTask receiveTask;
		int size = receive.getReceiveTasks().size();
		for (int i = 0; i < size; i++) {
			receiveTask = receive.getReceiveTasks().get(i);
			// 更新上一个的任务状态变为已办
			receiveTask.setTaskId(receive.getReceiveTasks().get(i).getTaskId());
			receiveTask.setEndTime(new Date());
			receiveTaskdao.updateCompleteTask(receiveTask);

			BriefingReceiveTask receiveTask2 = new BriefingReceiveTask();
			receiveTask2.setStartTime(new Date());
			receiveTask2.setReceiveId(receiveTask.getReceiveId());
			receiveTask2.setRemarks(receiveTask.getRemarks());
			receiveTask2.setStartPersonId(receiveTask.getStartPersonId());
			receiveTask2.setStartNodeId(receiveTask.getStartNodeId());
			receiveTask2.setEndPersonId(receiveTaskdao.getStartPersonId(receiveTask.getReceiveId()).getStartPersonId());
			receiveTask2.setEndNodeId(1);
			receiveTask2.setTaskStatus("2");
			// 保存收文任务;
			receiveTaskdao.saveReceiveTask(receiveTask2);
		}
		return receive.getReceiveId();
	}

}
