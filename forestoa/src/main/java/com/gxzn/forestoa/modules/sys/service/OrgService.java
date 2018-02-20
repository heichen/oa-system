package com.gxzn.forestoa.modules.sys.service;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.sys.entity.Org;

/**
 * 组织service接口
 * 
 * @author HaiTao
 *
 */
public interface OrgService {
	/**
	 * 根据组织id查询组织树
	 * 
	 * @param oId
	 * @return
	 */
	List<Org> getOrgTree(Long oId);

	/**
	 * 根据组织id查询组织详细信息
	 * 
	 * @param oId
	 * @return
	 */
	Org getOrgById(Long oId);

	/**
	 * 获取所有组织
	 * 
	 * @return
	 */
	List<Org> getALLOrg();

	/**
	 * 保存组织信息
	 * 
	 * @param org
	 * @return
	 */
	int saveOrg(Org org);

	/**
	 * 更新组织信息
	 * 
	 * @param org
	 * @return
	 */
	int updateOrg(Org org);

	/**
	 * 删除组织信息
	 * 
	 * @param oId
	 * @return
	 */
	int deleteOrg(Long oId);

	/**
	 * 当前登录用户的org1，org2，org3拼接的字符串，去用IN查询
	 * @param params
	 * @return
	 */
	List<Org> getOrgByLogin(Map<String, Object> params);

}
