package com.gxzn.forestoa.modules.sys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.utils.StrFormatterUtils;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.MenuTreeUtil;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Menu;
import com.gxzn.forestoa.modules.sys.entity.Role;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.sys.entity.ZTree;
import com.gxzn.forestoa.modules.sys.service.MenuService;
import com.gxzn.forestoa.modules.sys.service.RoleService;
import com.gxzn.forestoa.modules.sys.service.UsersService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("users")
public class UsersController {
	// 日志
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired
		private UsersService usersService;
		@Autowired
		private RoleService roleService;
		@Resource(name = "menuService")
		private MenuService menuService;
		
		/**
		 * 查询所有人员
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAll")
		public ResponseModel<DataTablesResult<Users>> selectAll(HttpServletRequest request) {

			ResponseModel<DataTablesResult<Users>> res = new ResponseModel<DataTablesResult<Users>>();
			try {
				DataTablesResult<Users> result = new DataTablesResult<>(request);
				usersService.selectAll(result);
				res.success("分页查询人员成功", result);
				logger.info("分页查询人员成功");
			} catch (Exception e) {
				res.init("分页查询人员失败");
				logger.error("分页查询人员失败", e);
			}
			return res;
		}
		/**
		 * 查询所有人员
		 * 
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "selectAll2")
		public ResponseModel<DataTablesResult<Users>> selectAll2(HttpServletRequest request,Users user) {

			ResponseModel<DataTablesResult<Users>> res = new ResponseModel<DataTablesResult<Users>>();
			try {
				DataTablesResult<Users> result = new DataTablesResult<>(request);
				usersService.selectAll2(result,user);
				res.success("分页查询人员成功", result);
				logger.info("分页查询人员成功");
			} catch (Exception e) {
				res.init("分页查询人员失败");
				logger.error("分页查询人员失败", e);
			}
			return res;
		}
		
		/**
		 * 根据人员Id进行查询
		 * 
		 * @param userId
		 * @return
		 */
		@RequestMapping(value = "selectByKey")
		public ResponseModel<Users> selectByKey(Long userId) {
			ResponseModel<Users> res = new ResponseModel<Users>();
			try {
				res.success("根据人员管理Id进行查询成功",usersService.selectByKey(userId));
				logger.info("根据人员管理Id进行查询成功");
			} catch (Exception e) {
				
				res.init("根据人员管理Id进行查询失败");
				logger.error("根据人员管理Id进行查询失败", e);
			}
			return res;
		} 
		
		/**
		 * 根据人员管理标题查询人员管理
		 * 
		 * @param temp
		 * @return
		 */
		@RequestMapping(value = "selectByTitle")
		public ResponseModel<List<Users>> selectByTitle(String temp) {
			ResponseModel<List<Users>> res = new ResponseModel<List<Users>>();
			try {
				
				res.success("根据人员标题查询人员管理成功", usersService.selectByTitle(temp));
				logger.info(StrFormatterUtils.format("根据人员标题查询人员管理成功", temp));
			} catch (Exception e) {
				
				res.init("根据人员标题查询人员管理失败");
				logger.error("根据人员标题查询人员管理失败", e);
			}
			return res;

		}
		
		/**
		 * 根据人员管理Id进行物理删除
		 * 
		 * @param userId
		 * @return
		 */
		@RequestMapping(value = "delete")
		public ResponseModel<Integer> delete(Long userId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				res.success("根据人员Id进行物理删除成功", usersService.delete(userId));
				logger.info("根据人员Id进行物理删除划成功");
			} catch (Exception e) {
				
				res.init("根据人员Id进行物理删除失败");
				logger.error("根据人员Id进行物理删除失败", e);
			}
			return res;

		}
		
		/**
		 * 根据人员管理Id进行逻辑删除
		 * 
		 * @param userId
		 * @return
		 */
		@RequestMapping(value = "delete2")
		public ResponseModel<Integer> delete2(Long userId) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				int flag=usersService.delete2(userId);
				if(flag!=1) {
					res.init("根据人员Id进行逻辑删除失败");
				}else {
					res.success("根据人员Id进行逻辑删除成功", flag);
					logger.info("根据人员Id进行逻辑删除成功");
				}
			} catch (Exception e) {
				
				res.init("根据人员Id进行逻辑删除失败");
				logger.error("根据人员Id进行逻辑删除失败",e);
			}
			return res;

		}
		
		/**
		 * 人员管理的编辑
		 * 
		 * @param Users
		 * @return
		 */
		@RequestMapping(value = "update")
		public ResponseModel<Integer> update(Users Users) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				
				int flag=usersService.update(Users);
				if(flag!=1) {
					res.init("人员的编辑失败");
				}else {
					res.success("人员的编辑成功", flag);
					logger.info("人员的编辑成功");
				}
			} catch (Exception e) {
				
				res.init("人员的编辑失败");
				logger.error("人员的编辑失败",e);
			}
			return res;

		}
		
		/**
		 * 人员管理的添加
		 * 
		 * @param Users
		 * @return
		 */
		@RequestMapping(value = "insert")
		public ResponseModel<Integer> insert(Users Users) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				int flag=usersService.insert(Users);
				if(flag!=1) {
					res.init("人员的添加失败");
				}else {
					res.success("人员的添加成功", flag);
					logger.info("人员的添加成功");
				}
			} catch (Exception e) {
				res.init("人员的添加失败");
				logger.error("人员的添加失败",e);
			}
			return res;

		}
		/**
		 * 用户修改密码
		 * 
		 * @param user
		 * @return
		 */
		@RequestMapping(value = "changePassword")
		public ResponseModel<Integer> changePassword(Users users) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				int flag=usersService.updatePassword(users);
				if(flag!=1) {
					res.init("用户修改密码失败");
				}else {
					res.success("用户修改密码成功", flag);
					logger.info("用户修改密码成功");
				}
			} catch (Exception e) {
				res.init("用户修改密码失败");
				logger.error("用户修改密码失败",e);
			}
			
			return res;
		}
		/**
		 * 用户登录
		 * 
		 * @param user
		 * @return
		 */
		@RequestMapping(value = "login")
		public ResponseModel<Integer> login(Users users,HttpServletRequest req, HttpServletResponse resp) {
			ResponseModel<Integer> res = new ResponseModel<Integer>();
			try {
				int flag=0;
				Users u=usersService.login(users);
				if(u!=null&&u.getLoginPassword().equals(users.getLoginPassword())) {
					req.getSession().setAttribute(SessionContans.USER_KEY,u);
					List<Menu> menus=new ArrayList<>();
					if(Integer.parseInt(u.getUserType())==1) {
						//如果是超级管理员。获取全部
						menus=menuService.getMenuListAll();
					}else {
						//不是超级管理员。先从登录用户中获取改用的角色。role1、role2、role3，通过role列表获取菜单
						List<Long> roles=new ArrayList<>();
						if(u.getRoleId1()!=null) {
							roles.add(u.getRoleId1());
						}
						if(u.getRoleId2()!=null) {
							roles.add(u.getRoleId2());
						}
						if(u.getRoleId3()!=null) {
							roles.add(u.getRoleId3());
						}
						menus=menuService.getMenuListByrIds(roles);
					}
					MenuTreeUtil menuTreeUtil=new MenuTreeUtil();
					u.setReandmenus(menuTreeUtil.menuList(menus));
					req.getSession().setAttribute("loginuser",JSON.toJSONString(u));
					flag=1;
					res.success("登录成功", flag);
					logger.info("登录成功");
				}else {
					res.success("用户或密码输入错误", flag);
					logger.info("用户或密码输入错误");
				}
			
			} catch (Exception e) {
				res.init("登录失败");
				logger.error("登录失败",e);
			}
			
			return res;
		}
		/**
		 * 查询所有角色
		 * 
		 * @param user
		 * @return
		 */
		@RequestMapping(value = "selectAllRole")
		public ResponseModel<List<Role>> selectAllRole() {
			ResponseModel<List<Role>> res = new ResponseModel<List<Role>>();
			try {
				res.success("查询所有角色成功", roleService.findAll());
				logger.info("查询所有角色成功");
			} catch (Exception e) {
				res.init("查询所有角色失败");
				logger.error("查询所有角色失败");
			}
			
			return res;
		}
		
		/**
		 * 查询所有的人员数
		 * @return
		 */
		@RequestMapping(value = "getUsersTree")
		public ResponseModel<List<ZTree>> getUsersTree() {
			ResponseModel<List<ZTree>> res = new ResponseModel<>();
			try {
				res.success(" 获取组织人员树成功", usersService.getUsersTree());
				logger.info(" 获取组织人员树成功");
			} catch (Exception e) {
				res.init(" 获取组织人员树失败");
				logger.error(" 获取组织人员树失败");
			}
			
			return res;
		}

		/**
		 * 根据角色id查询人员
		 * @param rId
		 * @return
		 */
		@RequestMapping(value = "selectUserByRId")
		public ResponseModel<List<Users>> selectUserByRId(Long rId) {
			ResponseModel<List<Users>> res = new ResponseModel<>();
			try {
				res.success("根据角色id获取组织人员成功", usersService.selectUserRId(rId));
				logger.info("根据角色id获取组织人员成功");
			} catch (Exception e) {
				res.init("根据角色id获取组织人员失败");
				logger.error("根据角色id获取组织人员失败");
			}
			return res;
		}
		/**
		 * 根据角色id查询人员树
		 * @param rId
		 * @return
		 */
		@RequestMapping(value = "selectUserByRoleId")
		public ResponseModel<List<ZTree>> selectUserByRoleId(Long rId) {
			ResponseModel<List<ZTree>> res = new ResponseModel<>();
			try {
				res.success("根据角色id获取组织人员树成功", usersService.selectUserByRoleId(rId));
				logger.info("根据角色id获取组织人员树成功");
			} catch (Exception e) {
				res.init("根据角色id获取组织人员树失败");
				logger.error("根据角色id获取组织人员树失败");
			}
			return res;
		}
		
		
		/**
		 * 根据组织查询人员
		 * @param rId
		 * @return
		 */
		@RequestMapping(value = "selectAllByOrg")
		public ResponseModel<List<Users>> selectAllByOrg(Long orgId) {
			ResponseModel<List<Users>> res = new ResponseModel<>();
			Map<String, Object> params = new HashMap<>();
			params.put("q_oId", orgId);
			
			try {
				res.success("根据组织id获取组织人员成功", usersService.selectAllByOrg(params));
				logger.info("根据组织id获取组织人员成功");
			} catch (Exception e) {
				res.init("根据组织id获取组织人员失败");
				logger.error("根据组织id获取组织人员失败");
			}
			return res;
		}
		
		
		
		
		
		
}
