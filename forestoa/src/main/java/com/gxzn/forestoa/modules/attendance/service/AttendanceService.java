package com.gxzn.forestoa.modules.attendance.service;



import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.attendance.entity.Attendance;
import com.gxzn.forestoa.modules.sys.entity.Users;

public interface AttendanceService {
	/**
	 * 查询所有考勤
	 * 
	 * @return
	 */
	public void selectAll(DataTablesResult<Attendance> result,Map<String, Object> params); 
	/**
	 * 添加考勤
	 * 
	 * @return
	 */
	public int  insert(Attendance record);
	
}
