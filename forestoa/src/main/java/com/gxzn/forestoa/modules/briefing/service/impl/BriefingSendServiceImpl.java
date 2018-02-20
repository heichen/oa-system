package com.gxzn.forestoa.modules.briefing.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.gxzn.forestoa.common.util.EncodeUtil;
import com.gxzn.forestoa.common.util.FilesUtil;
import com.gxzn.forestoa.modules.briefing.dao.BriefingSendMapper;
import com.gxzn.forestoa.modules.briefing.dao.BriefingSendTaskMapper;
import com.gxzn.forestoa.modules.briefing.entity.BriefingSend;
import com.gxzn.forestoa.modules.briefing.entity.BriefingSendTask;
import com.gxzn.forestoa.modules.briefing.service.BriefingSendService;
import com.gxzn.forestoa.modules.briefing.util.PreCastUtil;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Users;

@Service("briefingSendService")
public class BriefingSendServiceImpl implements BriefingSendService {
	@Autowired
	private BriefingSendMapper senddao;
	@Autowired
	private BriefingSendTaskMapper sendTaskdao;
	@Autowired
	private HttpServletRequest request;

	@Value("${briSendFiles}")
	private String dir;// 上传默认目录
	@Value("${upload.base.dir}")
	private String originalDir;// 源文件目录
	@Autowired
	private UsersMapper usersMapper;
	@Value("${froestoaUrl}")
	private String froestoaUrl;
	@Override
	public Long saveSend(BriefingSend send) throws IOException {
		// 文件路径
		String filePath = dir;
		// 发送消息
		FastMsgUtil fastMsg = new FastMsgUtil();
		SysMsg massage = new SysMsg();
		//发文任务
		BriefingSendTask sendTask = new BriefingSendTask();
		//接收json串
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray(send.getTasks().trim().toString());
		for (int i = 0; i < jsonArray.length(); i++) {
			jsonObject = jsonArray.optJSONObject(i);
			if (jsonObject.optString("taskId") != null && jsonObject.optString("taskId").length() > 0) {
				sendTask.setTaskId(Long.valueOf((jsonObject.optString("taskId").toString())));
			}
			sendTask.setStartPersonId(Long.valueOf(jsonObject.optString("startPersonId").toString()));
			sendTask.setStartNodeId(Integer.parseInt((jsonObject.optString("startNodeId").toString())));
			if (jsonObject.optString("endPersonId") != null && jsonObject.optString("endPersonId").length() > 0) {
				sendTask.setEndPersonId(Long.valueOf(jsonObject.optString("endPersonId").toString()));
			} else {
				sendTask.setEndPersonId(sendTaskdao.getStartPersonId(send.getSendId()).getStartPersonId());
			}
			if (jsonObject.optString("endNodeId") != null && jsonObject.optString("endNodeId").length() > 0) {
				sendTask.setEndNodeId(Integer.parseInt((jsonObject.optString("endNodeId").toString())));
			} else {
				sendTask.setEndNodeId(0);
			}
			if (jsonObject.optString("opinion") != null && jsonObject.optString("opinion").length() > 0) {
				sendTask.setOpinion((jsonObject.optString("opinion").toString()));
			}
			if (jsonObject.optString("remarks") != null && jsonObject.optString("remarks").length() > 0) {
				sendTask.setRemarks(jsonObject.optString("remarks").toString());
			}
			if (jsonObject.optString("pofile") != null && jsonObject.optString("pofile").length() > 0) {
				sendTask.setPofile(jsonObject.optString("pofile").toString());
			}

		}
		// 判断发文id是否为空
		if (send.getSendId() != null) {// 之前有保存发文记录
			String path = filePath + send.getSendId() + File.separator;
			// 更新上一个的任务状态变为已办
			sendTask.setEndTime(new Date());
			sendTask.setRemarks(sendTask.getRemarks());
			sendTaskdao.updateCompleteTask(sendTask);
			// 当前是最后一个节点
			if (sendTask.getStartNodeId() == 13) {
				// 更新发文为已归档
				senddao.updateSendStatus(send);
			} else {
				BriefingSendTask sendTask2 = new BriefingSendTask();
				sendTask2.setStartTime(new Date());
				sendTask2.setSendId(send.getSendId());
				sendTask2.setRemarks("");
				sendTask2.setStartPersonId(sendTask.getStartPersonId());
				sendTask2.setStartNodeId(sendTask.getStartNodeId());
				sendTask2.setPofile(sendTask.getPofile());
				sendTask2.setOpinion(sendTask.getOpinion());
				if (sendTask.getEndNodeId() != null && sendTask.getEndPersonId() != null) {
					sendTask2.setEndPersonId(sendTask.getEndPersonId());
					sendTask2.setEndNodeId(sendTask.getEndNodeId());
					// 保存发文任务;
					sendTaskdao.saveSendTask(sendTask2);
					massage.setTitle("发文消息!");
					massage.setContent("您有一个发文待办消息!");
					massage.setCategory("公文发文消息");
					Users  user=usersMapper.selectByKey(sendTask.getEndPersonId());
					String msg="number="+user.getUserNumber()+"&pwd="+
							user.getLoginPassword()+"&url=/Filedocumentsenddetail?taskId="
							+sendTask2.getTaskId();
					massage.setLink(froestoaUrl+"/sso/toTask?params="+EncodeUtil.encode(msg));
					massage.setReceivers("user_"+sendTask.getEndPersonId());
					massage.setNeedreaded(1);
					String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
					Map<String,Object> map=new HashMap<String,Object>();
					map.put("RTX_MSG", flag);
					map.put("TASK_ID", sendTask2.getTaskId());
					sendTaskdao.updateRTXMSG(map);
					// 上一节点文件
					File last_file = new File(
							path + sendTaskdao.getSendByTaskId(sendTask.getTaskId()).get("POFILE").toString());
					// 当前节点文件
					File index_file = new File(path + sendTask.getPofile());
					FileCopyUtils.copy(last_file, index_file);
				}
			}
		} else {// 第一次保存发文
			senddao.saveSend(send);
			// 原路径文件夹
			String url = request.getSession().getServletContext().getRealPath("/");
			// 原路径文件
			File source = new File(url + originalDir + File.separator + sendTask.getPofile());
			// 新文件夹
			String path = filePath + send.getSendId() + File.separator;
			// 新文件夹
			File file_url_date = new File(path);
			// 判断新文件夹是否存在
			if (!file_url_date.exists() && !file_url_date.isDirectory()) {
				file_url_date.mkdirs();
			}
			// 新文件
			String k = path + sendTask.getPofile();
			// 新文件
			File file_path = new File(k);
			// 移动文件到新文件夹
			// 文件复制
			FileCopyUtils.copy(source, file_path);
			// 复制给下一节点办理人得文件
			String nextFileName = "z" + sendTask.getEndPersonId() + new Date().getTime() + "_" + 8 + ".doc";
			String newfile = path + nextFileName;
			File file_path_new = new File(newfile);
			FileCopyUtils.copy(file_path, file_path_new);
			// 删除源文件
			if (source.isFile()) {
				source.delete();
			}
			// 保存自己发给自己得任务
			BriefingSendTask sendTask2 = new BriefingSendTask();
			sendTask2.setStartTime(new Date());
			sendTask2.setEndTime(new Date());
			sendTask2.setSendId(send.getSendId());
			sendTask2.setRemarks(sendTask.getRemarks());
			sendTask2.setStartPersonId(sendTask.getStartPersonId());
			sendTask2.setEndPersonId(sendTask.getStartPersonId());
			sendTask2.setStartNodeId(7);
			sendTask2.setEndNodeId(7);
			sendTask2.setPofile(sendTask.getPofile());
			sendTask2.setTaskStatus("1");
			sendTaskdao.saveSendTask(sendTask2);
			sendTask.setSendId(send.getSendId());
			sendTask.setStartTime(new Date());
			// 保存发文任务;
			sendTask.setRemarks("");
			sendTask.setPofile(nextFileName);
			sendTaskdao.saveSendTask(sendTask);
			massage.setTitle("发文消息!");
			massage.setContent("您有一个发文待办消息!");
			massage.setCategory("公文发文消息");
			Users  user=usersMapper.selectByKey(sendTask.getEndPersonId());
			String msg="number="+user.getUserNumber()+"&pwd="+
					user.getLoginPassword()+"&url=/Filedocumentsenddetail?taskId="
					+sendTask2.getTaskId();
			massage.setLink(froestoaUrl+"/sso/toTask?params="+EncodeUtil.encode(msg));
			massage.setReceivers("user_"+sendTask.getEndPersonId());
			massage.setNeedreaded(1);
			String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("RTX_MSG", flag);
			map.put("TASK_ID", sendTask2.getTaskId());
			sendTaskdao.updateRTXMSG(map);

		}
		return send.getSendId();
	}

	@Override
	public List<Map<String, Object>> getSendTask(Long endPersonId) {
		return sendTaskdao.getSendTask(endPersonId);
	}

	@Override
	public List<Map<String, Object>> getSendBySendId(Long SendId) {
		List<Map<String, Object>> li = senddao.getSendBySendId(SendId);
		Map<String, Object> map = new HashMap<String, Object>();
		PreCastUtil pc = new PreCastUtil();
		map.put("PRE_CAST_COLUMNS", pc.getPreCast(li.get(0).get("PRE_CAST_COLUMN").toString()));
		li.add(map);
		return li;
	}

	@Override
	public void deleteBriefingSend(Long sendId) {
		sendTaskdao.deleteBriefingSendTask(sendId);
		senddao.deleteBriefingSend(sendId);
	}

	@Override
	public Map<String, Object> getSendByTaskId(Long taskId) {
		Map<String, Object> map = sendTaskdao.getSendByTaskId(taskId);
		PreCastUtil pc = new PreCastUtil();
		map.put("PRE_CAST_COLUMNS", pc.getPreCast(map.get("PRE_CAST_COLUMN").toString()));
		return map;
	}

	@Override
	public Long getMaxNumber(String type) {
		return senddao.getMaxNumber(type);
	}

	@Override
	public Long updatereturnSend(BriefingSend send, MultipartFile[] files) throws IOException {
		// 文件路径
		String filePath = request.getSession().getServletContext().getRealPath("/") + dir + "/";
		// 发送消息
		FastMsgUtil fastMsg = new FastMsgUtil();
		SysMsg massage = new SysMsg();
		// 发文任务
		BriefingSendTask sendTask = new BriefingSendTask();
		// 文件上传
		FilesUtil fileutil = new FilesUtil();
		StringBuffer s = fileutil.filesUpload(files, request.getSession().getServletContext().getRealPath("/") + dir);
		String filename = s.toString().trim();
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray(send.getTasks().trim().toString());
		for (int i = 0; i < jsonArray.length(); i++) {
			jsonObject = jsonArray.optJSONObject(i);
			if (jsonObject.optString("taskId") != null && jsonObject.optString("taskId").length() > 0) {
				sendTask.setTaskId(Long.valueOf((jsonObject.optString("taskId").toString())));
			}
			sendTask.setStartPersonId(Long.valueOf(jsonObject.optString("startPersonId").toString()));
			sendTask.setStartNodeId(Integer.parseInt((jsonObject.optString("startNodeId").toString())));

			if (jsonObject.optString("endNodeId") != null && jsonObject.optString("endNodeId").length() > 0) {
				sendTask.setEndNodeId(Integer.parseInt((jsonObject.optString("endNodeId").toString())));
			} else {
				sendTask.setEndNodeId(0);
			}
			if (jsonObject.optString("opinion") != null && jsonObject.optString("opinion").length() > 0) {
				sendTask.setOpinion((jsonObject.optString("opinion").toString()));
			}
			if (jsonObject.optString("remarks") != null && jsonObject.optString("remarks").length() > 0) {
				sendTask.setRemarks(jsonObject.optString("remarks").toString());
			}
			if (jsonObject.optString("pofile") != null && jsonObject.optString("pofile").length() > 0) {
				sendTask.setPofile(jsonObject.optString("pofile").toString());
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sendId", send.getSendId());
		map.put("startNodeId", sendTask.getEndNodeId());
		// 获取回退人员id
		Long startPersonId = sendTaskdao.getReturnPersonId(map);
		// 更新上一个的任务状态变为已办
		sendTask.setEndTime(new Date());
		sendTaskdao.updateCompleteTask(sendTask);
		BriefingSendTask sendTask2 = new BriefingSendTask();
		sendTask2.setStartTime(new Date());
		sendTask2.setSendId(send.getSendId());
		sendTask2.setRemarks(sendTask.getRemarks());
		sendTask2.setStartPersonId(sendTask.getStartPersonId());
		sendTask2.setStartNodeId(sendTask.getStartNodeId());
		sendTask2.setPofile(sendTask.getPofile());
		sendTask2.setOpinion(sendTask.getOpinion());
		if (sendTask.getEndNodeId() != null) {
			sendTask2.setEndPersonId(startPersonId);
			sendTask2.setEndNodeId(sendTask.getEndNodeId());
			massage.setTitle("发文消息!");
			massage.setContent("您有一个发文待办消息!");
			massage.setCategory("公文发文消息");
			massage.setReceivers("user_" + sendTask.getEndPersonId());
			massage.setNeedreaded(1);
			String flag = FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
			sendTask2.setRtxMsg(flag);
			sendTask2.setFile(filename);
			sendTask2.setIsBack("1");
			// 保存发文任务;
			sendTaskdao.saveSendTask(sendTask2);
			/*co.copyFile(
					filePath + "pageofficefile/"
							+ sendTaskdao.getSendByTaskId(sendTask.getTaskId()).get("POFILE").toString(),
					filePath + "pageofficefile/" + sendTask.getPofile());*/
		}
		return send.getSendId();
	}
}
