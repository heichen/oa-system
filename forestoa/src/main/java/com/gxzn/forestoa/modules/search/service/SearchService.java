package com.gxzn.forestoa.modules.search.service;

import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;

public interface SearchService {

	/**
	 * 统计查询
	 * @param result
	 * @param params
	 */
	void myDocBfByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params);

	/**
	 * 回退查询
	 * @param result
	 * @param params
	 */
	void myDocBfBackByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params);

	/**
	 * 回退详情
	 * @param result
	 * @param params
	 */
	void myDocBfBackDatailByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params);

}
