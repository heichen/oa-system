package com.gxzn.forestoa.common.util.pageoffice;

import java.io.File;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;

/**
 * 发文办理中打开正文
 * 
 * @author HaiTao
 *
 */
@Controller
public class OpenNewWords extends HttpServlet {
	private static final long serialVersionUID = -758686623642845302L;
	@Value("${docSendFiles}")
	private String docSendFiles;// 公文发文路径
	@Value("${docReceFiles}")
	private String docReceFiles;// 公文收文路径
	@Value("${briSendFiles}")
	private String briSendFiles;// 简报发文路径
	@Value("${briReceFiles}")
	private String briReceFiles;// 简报收文路径

	@RequestMapping("openNewWords")
	public String openword(HttpServletRequest request, HttpServletResponse response) {
		PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
		request.setAttribute("poCtrl", poCtrl);
		// 设置服务页面
		poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
		//文件名
		String pofile = request.getParameter("pofile");
		//类型
		String type = request.getParameter("type");
		//文件夹id
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
		String dataPath_url = ctxPath + File.separator + sendId + File.separator + pofile;

		int endNode = Integer.parseInt(request.getParameter("endNode"));
		if (endNode == 7 || endNode == 8 || endNode == 9 || endNode == 10) {
			poCtrl.setOfficeToolbars(true);// 显示Office工具条
			poCtrl.setCustomToolbar(false);// 隐藏自定义工具栏
			poCtrl.setCustomMenuCaption("操作");
			poCtrl.addCustomMenuItem("关闭", "DocumentClose()", true);
			// 打开word
			poCtrl.webOpen(dataPath_url, OpenModeType.docAdmin, "");
		}
		if (endNode == 12) {// 盖章节点
			poCtrl.setOfficeToolbars(false);// 隐藏Office工具条
			poCtrl.setMenubar(true); // 显示菜单栏
			// 添加保存按钮
			poCtrl.addCustomToolButton("保存", "Save()", 1);
			poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);
			poCtrl.addCustomToolButton("加盖印章", "InsertSeal()", 2);
			poCtrl.addCustomToolButton("签字", "AddHandSign()", 3);
			/*
			 * poCtrl.addCustomToolButton("验证印章", "VerifySeal()", 5);
			 * poCtrl.addCustomToolButton("修改密码", "ChangePsw()", 0);
			 */
			// 打开word
			poCtrl.webOpen(dataPath_url, OpenModeType.docAdmin, "");
		}
		if (endNode == 11 || endNode == 13) {// 校核 发文归档节点
			poCtrl.setMenubar(false); // 隐藏菜单栏
			poCtrl.setOfficeToolbars(false);// 隐藏Office工具条
			poCtrl.setCustomToolbar(true);// 隐藏自定义工具栏
			//poCtrl.setCustomMenuCaption("操作");
			poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);
			// 打开只读word
			poCtrl.webOpen(dataPath_url, OpenModeType.docReadOnly, "");
		}
		poCtrl.setTitlebar(false); // 隐藏标题栏
		// 隐藏保存按钮
		poCtrl.getRibbonBar().setSharedVisible("FileSave", false);
		// 隐藏剪切板
		poCtrl.getRibbonBar().setGroupVisible("GroupClipboard", false);
		// 设置保存页面
		poCtrl.setSaveFilePage("savefile?filepath=" + dataPath_url);
		// 设置文件打开后执行的js function 全屏显示文件内容
		poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
		poCtrl.setTagId("PageOfficeCtrl1");
		return "document/pageoffice";
	}
}
