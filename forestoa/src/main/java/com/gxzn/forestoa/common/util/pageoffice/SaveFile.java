package com.gxzn.forestoa.common.util.pageoffice;


import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.FileSaver;

/**
 * 文件保存
 * 
 * @author HaiTao
 *
 */
@Controller
public class SaveFile extends HttpServlet {
	private static final long serialVersionUID = -758686623642845302L;

	@RequestMapping("savefile")
	public void savefile(HttpServletRequest request, HttpServletResponse response) {
		FileSaver fs = new FileSaver(request, response);
		//保存得文件
		String filepath = request.getParameter("filepath");
		fs.saveToFile(filepath);
		fs.close();
	}
}
