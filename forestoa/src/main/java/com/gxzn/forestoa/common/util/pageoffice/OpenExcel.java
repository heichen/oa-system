package com.gxzn.forestoa.common.util.pageoffice;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;

/**
 * 上传文件的打开控制器
 * 
 * @author HaiTao
 *
 */

@Controller
public class OpenExcel extends HttpServlet {
	private static final long serialVersionUID = -758686623642845302L;
	@Value("${upload.base.dir}")
	private String dir;// 上传默认目录

	@RequestMapping("openexcel")
	public String openexcel(HttpServletRequest request, HttpServletResponse response) {
		PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
		// 设置服务页面
		poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
		// 添加保存按钮
		// poCtrl.addCustomToolButton("保存", "Save()", 1);
		poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);
		poCtrl.setAllowCopy(false);// 禁止拷贝
		/*
		 * poCtrl.addCustomToolButton("加盖印章", "InsertSeal()", 2);
		 * poCtrl.addCustomToolButton("签字", "AddHandSign()", 3);
		 * poCtrl.addCustomToolButton("验证印章", "VerifySeal()", 5);
		 * poCtrl.addCustomToolButton("修改密码", "ChangePsw()", 0);
		 */
		poCtrl.setTitlebar(false); // 隐藏标题栏
		poCtrl.setMenubar(true); // 隐藏菜单栏
		poCtrl.setOfficeToolbars(true);// 隐藏Office工具条
		// poCtrl.setCustomToolbar(false);//隐藏自定义工具栏
		String file = request.getParameter("file");
		// 设置保存页面
		// poCtrl.setSaveFilePage("savefile?userName="+userName);
		// poCtrl.setSaveFilePage("savefile");
		request.setAttribute("poCtrl", poCtrl);
		// 设置文件打开后执行的js function
		poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
		// SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		// String datePath = sdf.format(new Date());
		// 文件夹目录
		String realPath = request.getSession().getServletContext().getRealPath("/") + dir;
		String dataPath_url = realPath + "/" + "file";
		// 打开office文件
		String s = file.substring(file.lastIndexOf(".") + 1);
		if (("doc".equals(s)) || ("docx".equals(s))) {
			poCtrl.webOpen(dataPath_url + "/" + file, OpenModeType.docAdmin, "");
		} else if (("xls".equals(s)) || ("xlsx".equals(s))) {
			poCtrl.webOpen(dataPath_url + "/" + file, OpenModeType.xlsNormalEdit, "");
		}
		poCtrl.setTagId("PageOfficeCtrl1");
		return "document/pageoffice";
	}

}
