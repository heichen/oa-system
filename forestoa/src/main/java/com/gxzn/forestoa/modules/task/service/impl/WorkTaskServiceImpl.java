package com.gxzn.forestoa.modules.task.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.dao.UserDispatchedMapper;
import com.gxzn.forestoa.modules.sys.entity.UserDispatched;
import com.gxzn.forestoa.modules.task.dao.WorkTaskMapper;
import com.gxzn.forestoa.modules.task.service.WorkTaskService;

@Service("workTaskService")
public class WorkTaskServiceImpl implements WorkTaskService {

	@Autowired
	private WorkTaskMapper workTaskMapper;

	@Autowired
	private UserDispatchedMapper userDispatchedMapper;

	@Override
	public Integer getToDoTaskNums(Long userId) {
		StringBuffer userIds = new StringBuffer();
		userIds.append(userId);
		int nums = 0;
		// 现根据当前用户去查找是否有权限委派A->B,如果当前用户是A。则不进行查询。如果当前用户是B，则查询用户id是A+B
		// 是否有有效的委派记录,如果有，则不进行待办任务查询
		UserDispatched userAssignedUid = userDispatchedMapper.getUserAssignedUid(userId);
		if (userAssignedUid != null) {

		} else {
			List<UserDispatched> userAcceptUid = userDispatchedMapper.getUserAcceptUid(userId);
			for (UserDispatched userDispatched : userAcceptUid) {
				userIds.append(",");
				userIds.append(userDispatched.getAssignedUid());
			}
			Map<String,Object> params=new HashMap<>();
			params.put("userIds", userIds.toString());
			nums += workTaskMapper.getDocReceiveTaskNum(params);
			nums += workTaskMapper.getDocSendTaskNum(params);
			nums += workTaskMapper.getBfReceiveTaskNum(params);
			nums += workTaskMapper.getBfSendTaskNum(params);
		}
		return nums;
	}

	@Override
	public Map<String, List<Map<String, Object>>> getToDoTask(Long userId) {
		StringBuffer userIds = new StringBuffer();
		userIds.append(userId);
		Map<String, List<Map<String, Object>>> map = new HashMap<>();
		List<Map<String, Object>> docReceivelist = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> docSendlist =new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> bfReceivelist =new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> bfSendlist =new ArrayList<Map<String,Object>>();
		// 现根据当前用户去查找是否有权限委派A->B,如果当前用户是A。则不进行查询。如果当前用户是B，则查询用户id是A+B
		// 是否有有效的委派记录,如果有，则不进行待办任务查询
		UserDispatched userAssignedUid = userDispatchedMapper.getUserAssignedUid(userId);
		if (userAssignedUid != null) {

		} else {
			List<UserDispatched> userAcceptUid = userDispatchedMapper.getUserAcceptUid(userId);
			for (UserDispatched userDispatched : userAcceptUid) {
				userIds.append(",");
				userIds.append(userDispatched.getAssignedUid());
			}
			Map<String,Object> params=new HashMap<>();
			params.put("userIds", userIds.toString());
			docReceivelist = workTaskMapper.getDocReceive(params);
			docSendlist = workTaskMapper.getDocSend(params);
			bfReceivelist = workTaskMapper.getBfReceive(params);
			bfSendlist = workTaskMapper.getBfSend(params);
		}
		map.put("docReceive", docReceivelist);
		map.put("docSend", docSendlist);
		map.put("bfReceivelist", bfReceivelist);
		map.put("bfSendlist", bfSendlist);
		return map;
	}

	@Override
	public void findMyDocBfByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Map<String, Object>> list = workTaskMapper.findMyDocBfByPage(params);
		// 用PageInfo对结果进行包装
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
		// 封装数据给DataTables
		result.setDraw(result.getDraw());
		result.setData(pageInfo.getList());
		// 数据库里总共记录数
		result.setRecordsTotal((int) pageInfo.getTotal());
		// 过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int) pageInfo.getTotal());
	}

	@Override
	public void findMyDocBfByAllPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Map<String, Object>> list = workTaskMapper.findMyDocBfByAllPage(params);
		// 用PageInfo对结果进行包装
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
		// 封装数据给DataTables
		result.setDraw(result.getDraw());
		result.setData(pageInfo.getList());
		// 数据库里总共记录数
		result.setRecordsTotal((int) pageInfo.getTotal());
		// 过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int) pageInfo.getTotal());
	}

}
