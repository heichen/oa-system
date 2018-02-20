package com.gxzn.forestoa.modules.sys.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.sys.dao.OrgMapper;
import com.gxzn.forestoa.modules.sys.entity.Org;
import com.gxzn.forestoa.modules.sys.service.OrgService;

/**
 * 组织service实现类
 * 
 * @author HaiTao
 *
 */
@Service("orgService")
public class OrgServiceImpl implements OrgService {
	@Autowired
	private OrgMapper orgDao;

	@Override
	public List<Org> getOrgTree(Long oId) {
		return orgDao.getOrgTree(oId);
	}

	@Override
	public Org getOrgById(Long oId) {
		return orgDao.getOrgById(oId);
	}

	@Override
	public int saveOrg(Org org) {
		org.setCreatTime(new Date());
		int number=orgDao.saveOrg(org);
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast=fastMsg.AddDepartment(org);
		try{
			if (fast != 0) {
				number=0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		}catch(Exception e) {
		    e.printStackTrace();
		}
		return number;
	}

	@Override
	public int updateOrg(Org org) {
		org.setCreatTime(new Date());
		int number=orgDao.updateOrg(org);
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast=fastMsg.ModifyDepartment(org);
		try{
			if (fast != 0) {
				number=0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		}catch(Exception e) {
		    e.printStackTrace();
		}
		return number;
	}

	@Override
	public int deleteOrg(Long oId) {
		int number=orgDao.deleteOrg(oId);
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast=fastMsg.RemoveDepartment(oId);
		try{
			if (fast != 0) {
				number=0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		}catch(Exception e) {
		    e.printStackTrace();
		}
		return number;
	}

	@Override
	public List<Org> getALLOrg() {
		return orgDao.getALLOrg();
	}

	@Override
	public List<Org> getOrgByLogin(Map<String, Object> params) {
		return orgDao.getOrgByLogin(params);
	}

}
