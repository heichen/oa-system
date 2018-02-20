package com.gxzn.forestoa.modules.workplan.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.workplan.entity.Workplan;

/**
 * 工作计划service接口
 * 
 * @author wangchen
 *
 */
public interface WorkplanService {
	/**
	 * 查询所有工作计划
	 * 
	 * @return
	 */
	public void selectAll(DataTablesResult<Workplan> result,Map<String, Object> params);
	/**
	 * 根据工作计划Id查询单个工作计划
	 * @param workplan
	 * @return
	 */
	public Workplan selectByKey(Long workplan);
	public List<Workplan> selectWPNumber(Map<String, Object> params);
	/**
	 * 根据工作计划标题查询工作计划
	 * @param temp
	 * @return
	 */
	public List<Workplan> selectByTitle(String temp);
	
	/**
	 * 根据工作计划Id进行物理删除
	 * @param workplan
	 * @return
	 */
	public int delete(Long workplan);
	/**
	 * 根据工作计划Id进行逻辑删除
	 * @param workplan
	 * @return
	 */
	public int delete2(Long workplan);
	/**
	 * 工作计划的编辑
	 * @param workplan
	 * @return
	 */
	public int update(Workplan workplan);
	/**
	 * 工作计划的添加
	 * @param workplan
	 * @return
	 */
	public int insert(Workplan workplan);
	

}
