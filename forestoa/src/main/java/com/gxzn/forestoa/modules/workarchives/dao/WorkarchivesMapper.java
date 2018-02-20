package com.gxzn.forestoa.modules.workarchives.dao;

import java.util.List;
import java.util.Map;

public interface WorkarchivesMapper {
	
	List<Map<String, Object>> workarchivesByPage(Map<String, Object> params);
}
