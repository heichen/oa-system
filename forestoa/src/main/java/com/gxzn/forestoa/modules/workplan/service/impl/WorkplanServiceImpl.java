package com.gxzn.forestoa.modules.workplan.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.workplan.dao.WorkplanMapper;
import com.gxzn.forestoa.modules.workplan.entity.Workplan;
import com.gxzn.forestoa.modules.workplan.service.WorkplanService;

@Service
public class WorkplanServiceImpl implements WorkplanService {
	
	@Autowired
	private WorkplanMapper workplanMapper;
	@Override
	public void selectAll(DataTablesResult<Workplan> result,Map<String, Object> params) {
		
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		List<Workplan> list=workplanMapper.selectAll(params);
		// 用PageInfo对结果进行包装
		PageInfo<Workplan> pageInfo = new PageInfo<Workplan>(list);
		//封装数据给DataTables  
		result.setDraw(result.getDraw());  
		result.setData(pageInfo.getList());    
		//数据库里总共记录数
		result.setRecordsTotal((int)pageInfo.getTotal());   
		//过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int)pageInfo.getTotal());
	}

	@Override
	public List<Workplan> selectWPNumber(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return workplanMapper.selectWPNumber(params);
	}
	
	@Override
	public Workplan selectByKey(Long wId) {
		// TODO Auto-generated method stub
		return workplanMapper.selectByKey(wId);
	}

	@Override
	public List<Workplan> selectByTitle(String temp) {
		// TODO Auto-generated method stub
		return workplanMapper.selectByTitle(temp);
	}

	@Override
	public int delete(Long wId) {
		// TODO Auto-generated method stub
		return workplanMapper.delete(wId);
	}

	@Override
	public int delete2(Long wId) {
		// TODO Auto-generated method stub
		return workplanMapper.delete2(wId);
	}

	@Override
	public int update(Workplan workplan) {
		// TODO Auto-generated method stub
		return workplanMapper.update(workplan);
	}

	@Override
	public int insert(Workplan workplan) {
		
		return workplanMapper.insert(workplan);
	}

	
	
}
