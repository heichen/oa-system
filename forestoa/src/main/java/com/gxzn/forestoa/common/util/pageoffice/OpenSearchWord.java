package com.gxzn.forestoa.common.util.pageoffice;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;

/**
 * 详细界面查看word
 * 
 * @author HaiTao
 *
 */
@Controller
public class OpenSearchWord extends HttpServlet {
	private static final long serialVersionUID = -758686623642845302L;
	@Value("${docSendFiles}")
	private String docSendFiles;// 公文发文路径
	@Value("${docReceFiles}")
	private String docReceFiles;// 公文收文路径
	@Value("${briSendFiles}")
	private String briSendFiles;// 简报发文路径
	@Value("${briReceFiles}")
	private String briReceFiles;// 简报收文路径

	@RequestMapping("openSearchWord")
	public String openword(HttpServletRequest request, HttpServletResponse response) {
		PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
		request.setAttribute("poCtrl", poCtrl);
		// 设置服务页面
		poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
		poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);
		poCtrl.setTitlebar(false); // 隐藏标题栏
		poCtrl.setMenubar(true); // 显示菜单栏
		poCtrl.setOfficeToolbars(false);// 隐藏Office工具条
		// poCtrl.setCustomToolbar(false);//隐藏自定义工具栏 注掉默认是显示 和设置为true 一样 false为不显示
		String pofile = request.getParameter("pofile");
		String type = request.getParameter("type");
		String sendId = request.getParameter("sendId");
		// 获取文件 存储位置
		String ctxPath = "";
		// 公文发文路径
		if ("1".equals(type)) {
			ctxPath = docSendFiles;
		} else if ("2".equals(type)) {// 公文收文路径
			ctxPath = docReceFiles;
		} else if ("3".equals(type)) {// 简报发文路径
			ctxPath = briSendFiles;
		} else if ("4".equals(type)) {// 简报收文路径
			ctxPath = briReceFiles;
		}
		// 文件夹目录
		String dataPath_url = ctxPath + "/" + sendId + "/" + pofile;
		// 设置文件打开后执行的js function
		poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
		// 打开word
		poCtrl.webOpen(dataPath_url, OpenModeType.docReadOnly, "");
		// poCtrl.webOpen(dataPath_url +"/"+pofile, OpenModeType.xlsNormalEdit, "");
		poCtrl.setTagId("PageOfficeCtrl1");
		return "document/pageoffice";
	}
}
