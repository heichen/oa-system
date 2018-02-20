package com.gxzn.forestoa.modules.task.service;

import java.util.List;
import java.util.Map;


import com.gxzn.forestoa.common.util.DataTablesResult;

public interface WorkTaskService {

	Integer getToDoTaskNums(Long userId);

	Map<String,List<Map<String,Object>>> getToDoTask(Long userId);

	void findMyDocBfByPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params);

	void findMyDocBfByAllPage(DataTablesResult<Map<String, Object>> result, Map<String, Object> params);

}
