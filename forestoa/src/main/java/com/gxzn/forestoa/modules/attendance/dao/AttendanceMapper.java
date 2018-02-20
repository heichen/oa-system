package com.gxzn.forestoa.modules.attendance.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.attendance.entity.Attendance;



public interface AttendanceMapper {
	/**
	 * 查询所有考勤
	 * 
	 * @return
	 */
	public List<Attendance> selectAll(Map<String, Object> params);

	/**
	 * 添加考勤
	 * 
	 * @return
	 */
	public int insert(Attendance record);

	/**
	 * 根据警号查询考勤信息
	 * 
	 * @return
	 */
	public Attendance selectByUnumber(Attendance record);

	/**
	 * 根据警号更新考勤信息 
	 * 
	 * @return
	 */
	public int update(Attendance record);

}
