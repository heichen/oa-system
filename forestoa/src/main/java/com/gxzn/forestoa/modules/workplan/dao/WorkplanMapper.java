package com.gxzn.forestoa.modules.workplan.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.workplan.entity.Workplan;

/**
 * 工作计划dao接口
 * 
 * @author wangchen
 *
 */
public interface WorkplanMapper {
	
	/**
	 * 查询所有工作计划
	 * 
	 * @return
	 */
//	public List<Workplan> selectAll(Workplan workplan);
	public List<Workplan> selectAll(Map<String, Object> params);
	public List<Workplan> worlplanNotice();
	public List<Workplan> selectWPNumber(Map<String, Object> params);
	
	/**
	 * 根据工作计划Id查询单个工作计划
	 * @param workplan
	 * @return
	 */
	public Workplan selectByKey(Long workplan);
	public List<Workplan> selectAllPlan();
	/**
	 * 根据工作计划标题查询工作计划
	 * @param temp
	 * @return
	 */
	public List<Workplan> selectByTitle(String temp);
	/**
	 * 根据工作计划状态查询工作计划
	 * @param status
	 * @return
	 */
	public List<Workplan> selectByStatus(String status);
	/**
	 * 根据工作计划的发送状态查询发送失败工作计划 
	 * @param status
	 * @return
	 */
	public List<Workplan> selectBySendError();
	
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