package com.gxzn.forestoa.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gxzn.forestoa.modules.sys.service.SysService;
@Service("SysService")
public class SysServiceImpl implements SysService {
	@Value("${sendByAdmin}")
	private String sendByAdmin; 
	public String getMassage() {
		return sendByAdmin;
		
	}

}
