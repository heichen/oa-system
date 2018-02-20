package com.gxzn.forestoa.common.util.pageoffice;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;
import com.zhuozhengsoft.pageoffice.wordwriter.DataRegion;
import com.zhuozhengsoft.pageoffice.wordwriter.WordDocument;

/**
 * 发文打开word 第一次打开公文的模板word
 * 
 * @author HaiTao
 *
 */
@Controller
public class OpenWord extends HttpServlet {
	private static final long serialVersionUID = -758686623642845302L;
	@Value("${upload.base.dir}")
	private String dir;// 上传默认目录

	@RequestMapping("openword")
	public String openword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
		request.setAttribute("poCtrl", poCtrl);
		// 设置服务页面
		poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
		// 添加保存按钮
		// poCtrl.addCustomToolButton("保存", "Save()", 1);
		// poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);

		poCtrl.setTitlebar(false); // 隐藏标题栏
		// poCtrl.setMenubar(true); // 隐藏菜单栏
		poCtrl.setOfficeToolbars(true);// 显示Office工具条
		poCtrl.setCustomToolbar(false);// 隐藏自定义工具栏

		poCtrl.setCustomMenuCaption("操作");
		poCtrl.addCustomMenuItem("关闭", "DocumentClose()", true);

		// 隐藏保存按钮
		// poCtrl.getRibbonBar().setSharedVisible("FileSave", false);
		// 隐藏剪切板
		poCtrl.getRibbonBar().setGroupVisible("GroupClipboard", false);
		// 文件名
		String userName = request.getParameter("userName");
		// 文件类型
		String type = request.getParameter("type");
		// 年份
		String year = request.getParameter("year");
		// 文号
		String number = request.getParameter("number");
		WordDocument doc = new WordDocument();
		// 打开数据区域
		DataRegion dataRegion1 = doc.openDataRegion("PO_year");
		// 给数据区域赋值
		dataRegion1.setValue(year);
		DataRegion dataRegion2 = doc.openDataRegion("PO_number");
		dataRegion2.setValue(number);
		poCtrl.setWriter(doc);
		// 文件夹目录
		String realPath = request.getSession().getServletContext().getRealPath("/");
		// 旧文件夹
		File file_url_index = null;
		if ("0".equals(type)) {// 赤森公发
			// 原文件
			file_url_index = new File(realPath + "doc/gf.doc");
		} else if ("1".equals(type)) {// 赤森公函发
			// 原文件
			file_url_index = new File(realPath + "doc/ghf.doc");
		} else if ("2".equals(type)) {// 党务发
			file_url_index = new File(realPath + "doc/dwf.doc");
			// 原文件
			file_url_index = new File(realPath + "doc/dwf.doc");
		} else if ("3".equals(type)) {// 其他
			// 原文件
			file_url_index = new File(realPath + "doc/qt.doc");
		} else if ("4".equals(type)) {// 简报
			// 原文件
			file_url_index = new File(realPath + "doc/jb.doc");
		} else if ("5".equals(type)) {// 信息
			// 原文件
			file_url_index = new File(realPath + "doc/qt.doc");
		}
		// 新文件夹
		File file_upload_path = new File(realPath + dir);
		if (!file_upload_path.exists() && !file_upload_path.isDirectory()) {
			file_upload_path.mkdirs();
		}
		// 新文件
		File file_url_new = new File(realPath + dir + File.separator + userName + ".doc");
		FileCopyUtils.copy(file_url_index, file_url_new);
		// 打开word
		poCtrl.webOpen(file_url_new.getPath(), OpenModeType.docAdmin, "");
		// 设置文件打开后执行的js function 全屏展开
		poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
		// 设置保存页面
		poCtrl.setSaveFilePage("savefile?filepath=" + file_url_new.getPath());
		poCtrl.setTagId("PageOfficeCtrl1");
		return "document/pageoffice";
	}
}
