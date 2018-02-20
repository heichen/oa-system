package com.gxzn.forestoa.common.util.pageoffice;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.PDFCtrl;
/**
 * 打开pdf
 * @author HaiTao
 *
 */
@Controller
public class OpenPdf {
	private static final long serialVersionUID = -758686623642845302L;
	@RequestMapping("openpdf")
	public String openexcel(HttpServletRequest request,
			HttpServletResponse response) {

		PDFCtrl poCtrl = new PDFCtrl(request);
		String userName = request.getParameter("userName");
		// 设置保存页面
		request.setAttribute("poCtrl", poCtrl);
		poCtrl.setServerPage(request.getContextPath() + "/poserver.zz"); // 此行必须
		poCtrl.setTitlebar(false); // 隐藏标题栏
		poCtrl.setMenubar(false); // 隐藏菜单栏
		// Create custom toolbar
		//poCtrl.addCustomToolButton("打印", "Print()", 6);
		poCtrl.addCustomToolButton("隐藏/显示书签", "SetBookmarks()", 0);
	    poCtrl.addCustomToolButton("-", "", 0);
		//poCtrl.addCustomToolButton("实际大小", "SetPageReal()", 16);
		//poCtrl.addCustomToolButton("适合页面", "SetPageFit()", 17);
		//poCtrl.addCustomToolButton("适合宽度", "SetPageWidth()", 18);
		poCtrl.addCustomToolButton("-", "", 0);
		poCtrl.addCustomToolButton("首页", "FirstPage()", 8);
		poCtrl.addCustomToolButton("上一页", "PreviousPage()", 9);
		poCtrl.addCustomToolButton("下一页", "NextPage()", 10);
		poCtrl.addCustomToolButton("尾页", "LastPage()", 11);
		poCtrl.addCustomToolButton("-", "", 0);
		poCtrl.addCustomToolButton("关闭", "DocumentClose()", 21);
		// 设置文件打开后执行的js function
		poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
		poCtrl.webOpen("doc/test.pdf");
		return "document/PDF";
	}
}
