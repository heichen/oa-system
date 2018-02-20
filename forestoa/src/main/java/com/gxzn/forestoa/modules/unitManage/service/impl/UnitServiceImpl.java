package com.gxzn.forestoa.modules.unitManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.unitManage.dao.UnitMapper;
import com.gxzn.forestoa.modules.unitManage.entity.Unit;
import com.gxzn.forestoa.modules.unitManage.service.UnitService;
@Service
public class UnitServiceImpl implements UnitService {
	@Autowired
	private UnitMapper unitMapper;

	@Override
	public void selectAll(DataTablesResult<Unit> result,String status) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Unit> list = unitMapper.selectAll(status);
		// 用PageInfo对结果进行包装
		PageInfo<Unit> pageInfo = new PageInfo<Unit>(list);
		//封装数据给DataTables  
		result.setDraw(result.getDraw());  
		result.setData(pageInfo.getList());    
		//数据库里总共记录数
		result.setRecordsTotal((int)pageInfo.getTotal());   
		//过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int)pageInfo.getTotal());
	}

	@Override
	public Unit selectByKey(Long unitId) {
		// TODO Auto-generated method stub
		return unitMapper.selectByKey(unitId);
	}

	@Override
	public List<Unit> selectByTitle(String temp) {
		// TODO Auto-generated method stub
		return unitMapper.selectByTitle(temp);
	}
	public List<Unit> selectByLAI(){
		return unitMapper.selectByLAI();
	};
	public List<Unit> selectByZHU(){
		return unitMapper.selectByZHU();
	};
	public List<Unit> selectByCHAO(){
		return unitMapper.selectByCHAO();
	};
	public List<Unit> selectLAIById(Long unitId){
		return unitMapper.selectLAIById(unitId);
	};
	/**
	 * 通过Id查询主送单位
	 * @param unitId
	 * @return
	 */
	public List<Unit> selectZHUAIById(Long unitId){
		return unitMapper.selectZHUAIById(unitId);
	};
	/**
	 * 通过Id查询抄送单位
	 * @param unitId
	 * @return
	 */
	public List<Unit> selectCHAOAIById(Long unitId){
		return unitMapper.selectCHAOAIById(unitId);
	};

	@Override
	public int delete(Long unitId) {
		// TODO Auto-generated method stub
		return unitMapper.delete(unitId);
	}

	@Override
	public int delete2(Long unitId) {
		// TODO Auto-generated method stub
		return unitMapper.delete2(unitId);
	}

	@Override
	public int update(Unit unit) {
		// TODO Auto-generated method stub
		return unitMapper.update(unit);
	}

	@Override
	public int insert(Unit unit) {
		// TODO Auto-generated method stub
		return unitMapper.insert(unit);
	}

}
