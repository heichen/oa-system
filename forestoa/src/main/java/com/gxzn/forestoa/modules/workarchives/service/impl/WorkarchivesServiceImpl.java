package com.gxzn.forestoa.modules.workarchives.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.workarchives.dao.WorkarchivesMapper;
import com.gxzn.forestoa.modules.workarchives.service.WorkarchivesService;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;

@Service("workarchivesService")
public class WorkarchivesServiceImpl implements WorkarchivesService {

	@Autowired
	private WorkarchivesMapper workarchivesMapper;

	@Override
	public void workarchivesByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Map<String, Object>> list = workarchivesMapper.workarchivesByPage(params);
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
	public List<Map<String, Object>> workarchivesDirectory(Map<String, Object> params) {
		return workarchivesMapper.workarchivesByPage(params);
	}

}
