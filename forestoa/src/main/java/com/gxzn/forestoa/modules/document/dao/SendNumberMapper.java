package com.gxzn.forestoa.modules.document.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.document.entity.SendNumber;

public interface SendNumberMapper {
	/**
	 * 得到文号
	 * @param type
	 * @return
	 */
	Long getSendNumberByType(SendNumber sendNumber);
	/**
	 * 保存文号
	 * @param sendNumber
	 * @return
	 */
	Long saveSendNumber(SendNumber sendNumber);
	
	List<Map<String,Object>> selectAll(SendNumber sendNumber);
	
	int update(SendNumber sendNumber);
	
	SendNumber selectById(Long id);
	
	/**
	 * 更新文号
	 * @param sendNumber
	 * @return
	 */
	Long  updateNode(SendNumber sendNumber);
}