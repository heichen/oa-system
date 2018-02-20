package com.gxzn.forestoa.modules.document.service.impl;

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
import com.gxzn.forestoa.modules.document.dao.DocumentReceiveMapper;
import com.gxzn.forestoa.modules.document.dao.DocumentReceiveTaskMapper;
import com.gxzn.forestoa.modules.document.entity.DocumentReceive;
import com.gxzn.forestoa.modules.document.entity.DocumentReceiveTask;
import com.gxzn.forestoa.modules.document.service.DocumentReceiveService;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Users;

@Service("documentReceiveService")
public class DocumentReceiveServiceImpl implements DocumentReceiveService {
	@Autowired
	private DocumentReceiveMapper receivedao;
	@Autowired
	private DocumentReceiveTaskMapper receiveTaskdao;
	@Value("${docReceFiles}")
	private String dir;// 上传默认目录
	@Autowired
	private UsersMapper usersMapper;
	@Value("${froestoaUrl}")
	private String froestoaUrl;
	@Override
	public Long saveReceive(DocumentReceive receive, MultipartFile[] files) {
		// 文件路径
		String filePath = dir;
		FastMsgUtil fastMsg = new FastMsgUtil();
		SysMsg massage = new SysMsg();
		FilesUtil fileutil = new FilesUtil();
		List<DocumentReceiveTask> receiveTasks = JSON.parseArray(receive.getTasks().trim().toString(),
				DocumentReceiveTask.class);
		DocumentReceiveTask receiveTask;
		int size = receiveTasks.size();
		// 判断收文id是否为空
		if (receive.getReceiveId() != null) {// 之前有保存收文记录
			for (int i = 0; i < size; i++) {
				receiveTask = receiveTasks.get(i);
				if (receiveTask.getEndPersonId() != null && receiveTask.getEndNodeId() != null) {
					// 更新上一个的任务状态变为已办
					receiveTask.setEndTime(new Date());
					receiveTaskdao.updateCompleteTask(receiveTask);
					DocumentReceiveTask receiveTask2 = new DocumentReceiveTask();
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
					Users  user=usersMapper.selectByKey(receiveTask.getEndPersonId());
					String msg="number="+user.getUserNumber()+"&pwd="+
							user.getLoginPassword()+"&url=/Filedocumentreceivedetail?taskId="
							+receiveTask.getTaskId();
					massage.setLink(froestoaUrl+"/sso/toTask?params="+EncodeUtil.encode(msg));
					massage.setReceivers("user_"+receiveTask.getEndPersonId());
					massage.setNeedreaded(1);
					String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
					Map<String,Object> map=new HashMap<String,Object>();
					map.put("RTX_MSG", flag);
					map.put("TASK_ID", receiveTask2.getTaskId());
					receiveTaskdao.updateRTXMSG(map);
				
				} else {// 当前是最后一个节点
						// 更新收文为已归档
					DocumentReceiveTask receiveTask2 = new DocumentReceiveTask();
					receiveTask2.setTaskId(receiveTask.getTaskId());
					receiveTask2.setEndTime(new Date());
					receiveTaskdao.updateCompleteTask(receiveTask2);
				    Long count=receiveTaskdao.getCompleteStatus(receive.getReceiveId());
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
			DocumentReceiveTask receiveTask2 = new DocumentReceiveTask();
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
				massage.setCategory("公文收文消息");
				Users  user=usersMapper.selectByKey(receiveTask.getEndPersonId());
				String msg="number="+user.getUserNumber()+"&pwd="+
						user.getLoginPassword()+"&url=/Filedocumentreceivedetail?taskId="
						+receiveTask.getTaskId();
				massage.setLink(froestoaUrl+"/sso/toTask?params="+EncodeUtil.encode(msg));
				massage.setReceivers("user_"+receiveTask.getEndPersonId());
				massage.setNeedreaded(1);
				String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
				Map<String,Object> map=new HashMap<String,Object>();
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
	public void deleteDocumentReceive(Long receiveId) {
		receiveTaskdao.deleteDocumentReceiveTask(receiveId);
		receivedao.deleteDocumentReceive(receiveId);
	}

	@Override
	public Map<String, Object> getReceiveByTaskId(Long taskId) {
		return receiveTaskdao.getReceiveByTaskId(taskId);
	}

	@Override
	public Long saveReturnReceive(DocumentReceive receive) {
		DocumentReceiveTask receiveTask;
		int size = receive.getReceiveTasks().size();
		for (int i = 0; i < size; i++) {
			receiveTask = receive.getReceiveTasks().get(i);
			// 更新上一个的任务状态变为已办
			receiveTask.setTaskId(receive.getReceiveTasks().get(i).getTaskId());
			receiveTask.setEndTime(new Date());
			receiveTaskdao.updateCompleteTask(receiveTask);

			DocumentReceiveTask receiveTask2 = new DocumentReceiveTask();
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
