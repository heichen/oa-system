package com.gxzn.forestoa.modules.document.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.document.entity.SendNumber;


public interface SendNumberService {
	List<Map<String,Object>> selectAll();
	
	int update(SendNumber sendNumber);
	
	SendNumber selectById(Long id);
}
