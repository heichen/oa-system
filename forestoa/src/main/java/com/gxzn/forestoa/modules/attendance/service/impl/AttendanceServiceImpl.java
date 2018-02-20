package com.gxzn.forestoa.modules.attendance.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.attendance.dao.AttendanceMapper;
import com.gxzn.forestoa.modules.attendance.entity.Attendance;
import com.gxzn.forestoa.modules.attendance.service.AttendanceService;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	@Autowired
	private AttendanceMapper attendanceMapper; 

	/**
	 * 查询所有考勤
	 * 
	 * @return
	 */
	@Override
	public void selectAll(DataTablesResult<Attendance> result, Map<String, Object> params) {
		
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		System.out.println("attenceStarttime="+params.get("attenceStarttime")+"||attenceEndtime="+params.get("attenceEndtime"));
		List<Attendance> list = attendanceMapper.selectAll(params);
		// 用PageInfo对结果进行包装
		PageInfo<Attendance> pageInfo = new PageInfo<Attendance>(list);
		// 封装数据给DataTables
		result.setDraw(result.getDraw());
		result.setData(pageInfo.getList());
		// 数据库里总共记录数
		result.setRecordsTotal((int) pageInfo.getTotal());
		// 过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int) pageInfo.getTotal());
	}

	/**
	 * 添加考勤
	 * 
	 * @return
	 */
	public int insert(Attendance record) {
		
		DateFormat f = new SimpleDateFormat("yyyyMMddHHmmss");//设置格式
		//DateFormat f = new SimpleDateFormat("yyyyMMdd");
		
		try {
			Date d = f.parse(record.getCurrentTime());
			record.setAttenceStarttime(d);
			record.setAttenceEndtime(d);
			System.out.println("打卡时间为："+d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Attendance statisticsCheck = attendanceMapper.selectByUnumber(record);

		if (statisticsCheck != null) {
			return attendanceMapper.update(record);
		} else {
			return attendanceMapper.insert(record);
		}

	};
}
