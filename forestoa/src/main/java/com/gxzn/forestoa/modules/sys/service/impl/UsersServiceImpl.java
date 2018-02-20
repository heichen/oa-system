package com.gxzn.forestoa.modules.sys.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.key.Sequence;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.sys.dao.OrgMapper;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Org;
import com.gxzn.forestoa.modules.sys.entity.Role;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.sys.entity.ZTree;
import com.gxzn.forestoa.modules.sys.service.UsersService;

/**
 * 人员管理service接口
 * 
 * @author wangchen
 *
 */
@Service("UsersService")
public class UsersServiceImpl implements UsersService {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UsersMapper usersMapper;

	@Autowired
	private OrgMapper orgMapper;

	@Override
	public void selectAll(DataTablesResult<Users> result) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Users> list = usersMapper.selectAll();
		// 用PageInfo对结果进行包装
		PageInfo<Users> pageInfo = new PageInfo<Users>(list);
		// 封装数据给DataTables
		result.setDraw(result.getDraw());
		result.setData(pageInfo.getList());
		// 数据库里总共记录数
		result.setRecordsTotal((int) pageInfo.getTotal());
		// 过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int) pageInfo.getTotal());
	}

	@Override
	public void selectAll2(DataTablesResult<Users> result, Users user) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
		PageHelper.startPage(result.getPage_num(), result.getPage_size());
		// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
		List<Users> list = usersMapper.selectAll2(user);
		// 用PageInfo对结果进行包装
		PageInfo<Users> pageInfo = new PageInfo<Users>(list);
		// 封装数据给DataTables
		result.setDraw(result.getDraw());
		result.setData(pageInfo.getList());
		// 数据库里总共记录数
		result.setRecordsTotal((int) pageInfo.getTotal());
		// 过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
		result.setRecordsFiltered((int) pageInfo.getTotal());
	}

	@Override
	public Users selectByKey(Long userId) {

		return usersMapper.selectByKey(userId);
	}

	@Override
	public List<Users> selectByTitle(String temp) {
		// TODO Auto-generated method stub
		return usersMapper.selectByTitle(temp);
	}

	@Override
	public int delete(Long userId) {

		return usersMapper.delete(userId);
	}

	@Override
	public int delete2(Long userId) {
		int number = usersMapper.delete2(userId);
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast = fastMsg.RemoveUser(userId);
		try {
			if (fast != 0) {
				number = 0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return number;
	}

	@Override
	public int update(Users users) {

		int number = usersMapper.update(users);
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast = fastMsg.ModifyUser(users);
		try {
			if (fast != 0) {
				number = 0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return number;
	}

	@Override
	public int insert(Users users) {
		
		int flag = 0;
		users.setLoginPassword("888888");
	
		users.setCreatTime(new Date());

		Users u = usersMapper.selectByUnumber(users);

		if (u == null) {
			usersMapper.insert(users);
			flag = 1;
		} else {

		}
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast = fastMsg.addUser(users);
		try {
			if (fast != 0) {
				flag = 0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Users login(Users users) {
		return usersMapper.login(users);
	}

	@Override
	public int updatePassword(Users users) {

		int number = usersMapper.updatePassword(users);
		FastMsgUtil fastMsg = new FastMsgUtil();
		int fast = fastMsg.ChangePassword(users.getUserId(), users.getLoginPassword());
		try {
			if (fast != 0) {
				number = 0;
				throw new RuntimeException(FastMsgUtil.ERRORCODE[fast]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return number;
	}

	@Override
	public List<ZTree> getUsersTree() {
		// 先获取组织列表
		List<Org> orgs = orgMapper.getOrgTree(0L);
		// 获取所有用户列表
		List<Users> users = usersMapper.selectAll();
		return formUserTree(orgs, users);
	}

	@Override
	public List<ZTree> selectUserByRoleId(Long rId) {
		// 先获取组织列表
		List<Org> orgs = orgMapper.getOrgTree(0L);
		// 获取所有用户列表
		List<Users> users = usersMapper.selectUserByRoleId(rId);
		return formUserTree(orgs, users);
	}

	public List<ZTree> formUserTree(List<Org> orgs,List<Users> users) {
		List<ZTree> zTree = new ArrayList<>();
		// 遍历组织
		for (Org org : orgs) {
			// 当前组织节点
			ZTree org_node = new ZTree();
			org_node.setNodeId(org.getoId());
			org_node.setNodeName(org.getoName());
			org_node.setpId(org.getParenteId());
			org_node.setNodeValue("org");
			boolean org_no_user=false;//当前组织下面没有人员
			// 遍历人员列表
			for (Users user : users) {
				// 排出用户id=1的即admin，排出组织id为0的即最大根节点
				if (user.getUserId() != 1 && user.getOrgId1() != 0 && user.getOrgId1() == org.getoId()) {
					// 如果用户的1组织id中有当前组织id，则认为是当前组织下的成员
					ZTree user_node = new ZTree();
					user_node.setNodeId(user.getUserId());
					user_node.setNodeName(user.getUserName());
					user_node.setpId(user.getOrgId1());
					user_node.setNodeValue("user");
					zTree.add(user_node);
					org_no_user=true;
				} else if (user.getUserId() != 1 && user.getOrgId1() != 0 && user.getOrgId2() == org.getoId()) {
					// 如果用户的2组织id中有当前组织id，则认为是当前组织下的成员
					ZTree user_node = new ZTree();
					user_node.setNodeId(user.getUserId());
					user_node.setNodeName(user.getUserName());
					user_node.setpId(user.getOrgId2());
					user_node.setNodeValue("user");
					zTree.add(user_node);
					org_no_user=true;
				} else if (user.getUserId() != 1 && user.getOrgId1() != 0 && user.getOrgId3() == org.getoId()) {
					// 如果用户的3组织id中有当前组织id，则认为是当前组织下的成员
					ZTree user_node = new ZTree();
					user_node.setNodeId(user.getUserId());
					user_node.setNodeName(user.getUserName());
					user_node.setpId(user.getOrgId3());
					user_node.setNodeValue("user");
					zTree.add(user_node);
					org_no_user=true;
				}
			}
			if(org_no_user||org.getoId()==1) {
				//如果在用户列表中查到有属于当前组织的，则将当前组织加入,并且排出掉最大跟节点0
				zTree.add(org_node);
			}
		}
		return zTree;
	}

	@Override
	public List<Users> selectAllByOrg(Map<String, Object> params) {
		return usersMapper.selectAllByOrg(params);
	}
	
	
	public List<Users> selectUserRId(Long rId){
		return usersMapper.selectUserByRoleId(rId);
		
	};
	
	
	

}