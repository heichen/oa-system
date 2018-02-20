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
 * 打开word
 * 
 * @author HaiTao
 *
 */
@Controller
public class OpenNewWord extends HttpServlet {
	private static final long serialVersionUID = -758686623642845302L;
	@Value("${docSendFiles}")
	private String docSendFiles;// 公文发文路径
	@Value("${docReceFiles}")
	private String docReceFiles;// 公文收文路径
	@Value("${briSendFiles}")
	private String briSendFiles;// 简报发文路径
	@Value("${briReceFiles}")
	private String briReceFiles;// 简报收文路径

	@RequestMapping("opennewword")
	public String openword(HttpServletRequest request, HttpServletResponse response) {
		PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
		request.setAttribute("poCtrl", poCtrl);
		// 设置服务页面
		poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
		// 添加保存按钮
		// poCtrl.addCustomToolButton("保存", "Save()", 1);
		poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);

		// poCtrl.addCustomToolButton("加盖印章", "InsertSeal()", 2);
		// poCtrl.addCustomToolButton("签字", "AddHandSign()", 3);
		/*
		 * poCtrl.addCustomToolButton("验证印章", "VerifySeal()", 5);
		 * poCtrl.addCustomToolButton("修改密码", "ChangePsw()", 0);
		 */
		poCtrl.setTitlebar(false); // 隐藏标题栏
		poCtrl.setMenubar(true); // 隐藏菜单栏
		poCtrl.setOfficeToolbars(true);// 隐藏Office工具条
		// poCtrl.setCustomToolbar(false);//隐藏自定义工具栏
		String pofile = request.getParameter("pofile");
		String type = request.getParameter("type");
		String sendId = request.getParameter("sendId");
		// 获取文件 存储位置
		String ctxPath = "";
		if ("1".equals(type)) {
			ctxPath = docSendFiles;
		} else if ("2".equals(type)) {
			ctxPath = docReceFiles;
		} else if ("3".equals(type)) {
			ctxPath = briSendFiles;
		} else if ("4".equals(type)) {
			ctxPath = briReceFiles;
		}
		// 文件夹目录
		String dataPath_url = ctxPath + "/" + sendId + "/" + pofile;
		// 设置文件打开后执行的js function 全屏显示
		poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
		String s = pofile.substring(pofile.lastIndexOf(".") + 1);
		if (("doc".equals(s)) || ("docx".equals(s))) {
			poCtrl.webOpen(dataPath_url, OpenModeType.docReadOnly, "");
		} else if (("xls".equals(s)) || ("xlsx".equals(s))) {
			poCtrl.webOpen(dataPath_url, OpenModeType.xlsNormalEdit, "");
		}
		poCtrl.setTagId("PageOfficeCtrl1");
		return "document/pageoffice";
	}
}
