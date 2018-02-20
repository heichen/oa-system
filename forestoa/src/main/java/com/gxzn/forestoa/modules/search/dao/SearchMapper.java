package com.gxzn.forestoa.modules.search.dao;

import java.util.List;
import java.util.Map;

public interface SearchMapper {

	/**
	 * 统计查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> myDocBfByPage(Map<String, Object> params);
	
	/**
	 * 回退查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> myDocBfBackByPage(Map<String, Object> params);

	/**
	 * 查看回退详情
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> myDocBfBackDatailByPage(Map<String, Object> params);

}
