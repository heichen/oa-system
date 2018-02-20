package com.gxzn.forestoa.modules.workarchives.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;

public interface WorkarchivesService {
	/**
	 * 档案管理查询
	 * @param result 
	 * @param params
	 * @return
	 */
	void workarchivesByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params);

	/**
	 * 打印目录
	 * @param result
	 * @param params
	 * @throws Exception 
	 */
	List<Map<String, Object>> workarchivesDirectory(Map<String, Object> params) throws Exception;
}
