package com.gxzn.forestoa.modules.unitManage.service;

import java.util.List;

import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.unitManage.entity.Unit;
/**
 * 收发单位service接口
 * 
 * @author wangchen
 *
 */
public interface UnitService {
	/**
	 * 查询所有收发单位
	 * 
	 * @return
	 */
	public void selectAll(DataTablesResult<Unit> result,String status);
	/**
	 * 根据收发单位Id查询单个收发单位
	 * @param unitId
	 * @return
	 */
	public Unit selectByKey(Long unitId);
	/**
	 * 根据收发单位名称查询收发单位
	 * @param temp
	 * @return
	 */
	public List<Unit> selectByTitle(String temp);
	/**
	 * 查询来文单位
	 * @param
	 * @return
	 */
	public List<Unit> selectByLAI();
	/**
	 * 查询主送单位
	 * @param 
	 * @return
	 */
	public List<Unit> selectByZHU();
	/**
	 * 查询抄送单位
	 * @param 
	 * @return
	 */
	public List<Unit> selectByCHAO();
	/**
	 * 通过Id查询来文单位
	 * @param 
	 * @return
	 */
	public List<Unit> selectLAIById(Long unitId);
	/**
	 * 通过Id查询主送单位
	 * @param unitId
	 * @return
	 */
	public List<Unit> selectZHUAIById(Long unitId);
	/**
	 * 通过Id查询抄送单位
	 * @param unitId
	 * @return
	 */
	public List<Unit> selectCHAOAIById(Long unitId);
	
	/**
	 * 根据收发单位Id进行物理删除
	 * @param unitId
	 * @return
	 */
	public int delete(Long unitId);
	/**
	 * 根据收发单位Id进行逻辑删除
	 * @param unitId
	 * @return
	 */
	public int delete2(Long unitId);
	/**
	 * 收发单位的编辑
	 * @param unit
	 * @return
	 */
	public int update(Unit unit);
	/**
	 * 收发单位的添加
	 * @param unit
	 * @return
	 */
	public int insert(Unit unit);
}
