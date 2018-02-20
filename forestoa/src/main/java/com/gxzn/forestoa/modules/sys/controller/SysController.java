package com.gxzn.forestoa.modules.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gxzn.ares.framework.consts.SessionContans;
import com.gxzn.forestoa.modules.sys.service.SysService;

@Controller
public class SysController {
	
	@Autowired
	private SysService sysService; 

	/**
	 * 登录页面
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "toLogin")
	public String toLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "login";
	}

	/**
	 * 注销，登出
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "quit")
	public String quit(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().removeAttribute(SessionContans.USER_KEY);
		return "login";
	}

	/**
	 * 非ajax请求，错误页面
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "errorHandler")
	public String errorHandler(HttpServletRequest req, HttpServletResponse resp) {
		return "error/500";
	}

	@RequestMapping(value = "index")
	public String index(HttpServletRequest req, HttpServletResponse resp) {
		return "index";
	}

	/**
	 * 我的任务(子 )
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "WorkmyTask")
	public String WorkmyTask(HttpServletRequest req, HttpServletResponse resp) {
		return "document/Work-myTask";
	}

	/**
	 * 公文办理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filehandle")
	public String Filehandle(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-handle";
	}

	/**
	 * 系统管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systemsetup")
	public String Systemsetup(HttpServletRequest req, HttpServletResponse resp) {
		return "System-setup";
	}

	/**
	 * 统计
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "SearchInfo")
	public String SearchInfo(HttpServletRequest req, HttpServletResponse resp) {
		return "SearchInfo";
	}

	/**
	 * 考勤管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workcheck")
	public String Workcheck(HttpServletRequest req, HttpServletResponse resp) {
		return "Work-check";
	}

	/**
	 * 考勤管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "statisticsCheck")
	public String statisticsCheck(HttpServletRequest req, HttpServletResponse resp) {
		return "statisticsCheck/statistics-check";
	}

	/**
	 * 工作计划
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workprogram")
	public String Workprogram(HttpServletRequest req, HttpServletResponse resp) {
		return "Work-program";
	}

	/**
	 * 修改密码
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Syschangepassword")
	public String Syschangepassword(HttpServletRequest req, HttpServletResponse resp) {
		return "user/System-personnel-change-password";
	}

	/**
	 * 档案管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workarchives")
	public String Workarchives(HttpServletRequest req, HttpServletResponse resp) {
		return "Work-archives";
	}

	/**
	 * 通知通告
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Worknotice")
	public String Worknotice(HttpServletRequest req, HttpServletResponse resp) {
		return "Work-notice";
	}

	/**
	 * 公文管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentadmin")
	public String Filedocumentadmin(HttpServletRequest req, HttpServletResponse resp) {
		return "File-document-admin";
	}

	/**
	 * 公文搜索
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "FiledocumentsearchInfo")
	public String FiledocumentsearchInfo(HttpServletRequest req, HttpServletResponse resp) {
		return "File-document-searchInfo";
	}

	/**
	 * 收发单位
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "unitManage")
	public String unitManage(HttpServletRequest req, HttpServletResponse resp) {
		return "unitManagement/unit-file-management";
	}

	/**
	 * 收发单位添加
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "unitManageadd")
	public String unitManageadd(HttpServletRequest req, HttpServletResponse resp) {
		return "unitManagement/unit-Management-add";
	}

	/**
	 * 收发单位详情
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "unitManagedetail")
	public String unitManagedetail(HttpServletRequest req, HttpServletResponse resp) {
		return "unitManagement/unit-Management-detail";
	}

	/**
	 * 收发单位编辑
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "unitManageedit")
	public ModelAndView unitManageedit(HttpServletRequest req, HttpServletResponse resp) {
		String cateList = "111";
		ModelAndView mav = new ModelAndView("unitManagement/unit-Management-edit");
		mav.addObject(cateList);
		return mav;
	}

	/**
	 * 公文办理发文
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentsendadd")
	public String Filedocumentsendadd(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-document-send-add";
	}

	/**
	 * 公文办理收文
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentreceive")
	public String Filedocumentreceive(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-document-receive";
	}

	/**
	 * 公文办理收文详细
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentreceivedetail")
	public String Filedocumentreceivedetail(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-document-receive-detail";
	}

	/**
	 * 公文办理发文查看详细
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentsenddetail")
	public String Filedocumentsenddetail(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-document-send-detail";
	}

	/**
	 * 简报发文
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filebriefingsendadd")
	public String Filebriefingsendadd(HttpServletRequest req, HttpServletResponse resp) {
		return "briefing/File-briefing-send-add";
	}

	/**
	 * 简报收文
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filebriefingreceive")
	public String Filebriefingreceive(HttpServletRequest req, HttpServletResponse resp) {
		return "briefing/File-briefing-receive";
	}

	/**
	 * 简报发文办理详细
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filebriefingsenddetail")
	public String Filebriefingsenddetail(HttpServletRequest req, HttpServletResponse resp) {
		return "briefing/File-briefing-send-detail";
	}

	/**
	 * 简报收文办理详细
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filebriefingreceivedetail")
	public String Filebriefingreceivedetail(HttpServletRequest req, HttpServletResponse resp) {
		return "briefing/File-briefing-receive-detail";
	}

	/**
	 * 公文管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentmanager")
	public String Filedocumentmanager(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-document-manager";
	}

	/**
	 * 公文搜索
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Filedocumentsearch")
	public String Filedocumentsearch(HttpServletRequest req, HttpServletResponse resp) {
		return "document/File-document-search";
	}

	/**
	 * 权限管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systempower")
	public String Systempower(HttpServletRequest req, HttpServletResponse resp) {
		return "role/System-power";
	}

	/**
	 * 组织管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systemorganization")
	public String Systemorganization(HttpServletRequest req, HttpServletResponse resp) {
		return "org/System-organization";
	}

	/**
	 * 人员管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systempersonnel")
	public String Systempersonnel(HttpServletRequest req, HttpServletResponse resp) {
		return "user/System-personnel";
	}

	/**
	 * 统计查询
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "StatisticssearchInfo")
	public String StatisticssearchInfo(HttpServletRequest req, HttpServletResponse resp) {
		return "search/Statistics-searchInfo";
	}

	/**
	 * 回退查询
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Statisticsfallback")
	public String Statisticsfallback(HttpServletRequest req, HttpServletResponse resp) {
		return "search/Statistics-fallback";
	}

	/**
	 * 查看回退
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Statisticsfallbackdatails")
	public String Statisticsfallbackdatails(HttpServletRequest req, HttpServletResponse resp) {
		return "search/Statistics-fallback-datails";
	}

	/**
	 * 档案管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workarchivesmanage")
	public String Workarchivesmanage(HttpServletRequest req, HttpServletResponse resp) {
		return "workarchives/Work-archives-manage";
	}

	/**
	 * 值班表
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "statisticsworkingshift")
	public String statisticsworkingshift(HttpServletRequest req, HttpServletResponse resp) {
		return "statistics-workingshift";
	}

	/**
	 * 考核表
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "statistics-check")
	public String statisticscheck(HttpServletRequest req, HttpServletResponse resp) {
		return "statistics-check";
	}

	/**
	 * 工作计划
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workplan")
	public String Workplan(HttpServletRequest req, HttpServletResponse resp) {
		return "workPlan/Work-plan";
	}

	/**
	 * 编辑工作计划
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workplanedit")
	public String Workplanedit(HttpServletRequest req, HttpServletResponse resp) {
		return "workPlan/Work-plan-edit";
	}

	/**
	 * 添加工作计划
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workplanadd")
	public String Workplanadd(HttpServletRequest req, HttpServletResponse resp) {
		return "workPlan/Work-plan-add";
	}

	/**
	 * 查看工作计划
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workplandetail")
	public String Workplandetail(HttpServletRequest req, HttpServletResponse resp) {
		return "workPlan/Work-plan-detail";
	}

	/**
	 * 通知通告
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workbulletin")
	public String Workbulletin(HttpServletRequest req, HttpServletResponse resp) {
		String  sendByAdmin= sysService.getMassage();
		System.out.println(sendByAdmin);
		req.setAttribute("sendByAdmin", sendByAdmin);
		
		
		return "notice/Work-bulletin";
	}

	/**
	 * 通知通告添加
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workbulletinadd")
	public String Workbulletinadd(HttpServletRequest req, HttpServletResponse resp) {
		return "notice/Work-bulletin-add";
	}

	/**
	 * 通知通告编辑
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workbulletinedit")
	public String Workbulletinedit(HttpServletRequest req, HttpServletResponse resp) {
		return "notice/Work-bulletin-edit";
	}

	/**
	 * 通知通告详情
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Workbulletindetail")
	public String Workbulletindetail(HttpServletRequest req, HttpServletResponse resp) {
		return "notice/Work-bulletin-detail";
	}

	/**
	 * 收发单位管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "unitfilemanagement")
	public String unitfilemanagement(HttpServletRequest req, HttpServletResponse resp) {
		return "unitManagement/unit-file-management";
	}
	/**
	 * 公文文号管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "sendNumberIndex")
	public String sendNumberIndex(HttpServletRequest req, HttpServletResponse resp) {
		return "sendNumber";
	}
	/**
	 * 公文文号管理
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "sendNumber")
	public String sendNumber(HttpServletRequest req, HttpServletResponse resp) {
		return "sendNumber/sendNumber";
	}
	/**
	 * 公文文号编辑
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "sendNumberEdit")
	public String sendNumberEdit(HttpServletRequest req, HttpServletResponse resp) {
		return "sendNumber/sendNumberEdit";
	}

	/**
	 * 添加修改角色
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systempoweradd")
	public String Systempoweradd(HttpServletRequest req, HttpServletResponse resp) {
		return "role/System-power-add";
	}

	/**
	 * 添加修改组织
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systemorganizationadd")
	public String Systemorganizationadd(HttpServletRequest req, HttpServletResponse resp) {
		return "org/System-organization-add";
	}

	/**
	 * 人员添加
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systempersonneladd")
	public String Systempersonneladd(HttpServletRequest req, HttpServletResponse resp) {
		return "user/System-personnel-add";
	}

	/**
	 * 人员查看
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systempersonneldetails")
	public String Systempersonneldetails(HttpServletRequest req, HttpServletResponse resp) {
		return "user/System-personnel-details";
	}

	/**
	 * 人员编辑
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "Systempersonneledit")
	public String Systempersonneledit(HttpServletRequest req, HttpServletResponse resp) {
		return "user/System-personnel-edit";
	}

	/**
	 * 人员委派
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "settingPower")
	public String settingPower(HttpServletRequest req, HttpServletResponse resp) {
		return "user/settingPower";
	}

	/**
	 * Excel打印
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "ExcelPrint")
	public String ExcelPrint(HttpServletRequest req, HttpServletResponse resp) {
		return "PrintFiles/ExcelPrint";
	}

	/**
	 * word打印
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "WordPrint")
	public String WordPrint(HttpServletRequest req, HttpServletResponse resp) {
		return "PrintFiles/WordPrint";
	}
}
