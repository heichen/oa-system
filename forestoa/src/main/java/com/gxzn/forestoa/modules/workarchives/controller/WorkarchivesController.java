package com.gxzn.forestoa.modules.workarchives.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.common.util.ResponseModel;
import com.gxzn.forestoa.modules.sys.entity.Users;
import com.gxzn.forestoa.modules.workarchives.service.WorkarchivesService;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;

/**
 * 档案管理
 * 
 * @author jiabo
 *
 */
@RestController
@RequestMapping("workarchives")
public class WorkarchivesController {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "workarchivesService")
	private WorkarchivesService workarchivesService;

	@Value("${file.temp}")
	private String tempurl;// 缓存文件目录

	@Value("${upload.base.dir}")
	private String dir;// 上传默认目录
	@Value("${docSendFiles}")
	private String docSendFiles;//公文发文文件路径
	@Value("${docReceFiles}")
	private String docReceFiles;//公文收文文件路径
	@Value("${briSendFiles}")
	private String briSendFiles;//简报发文文件路径
	@Value("${briReceFiles}")
	private String briReceFiles;//简报发文文件路径
	/**
	 * 档案管理分页查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "workarchivesByPage")
	public ResponseModel<DataTablesResult<Map<String, Object>>> workarchivesByPage(HttpServletRequest request) {
		ResponseModel<DataTablesResult<Map<String, Object>>> res = new ResponseModel<>();
		logger.info("开始档案管理分页查询");
		try {
			DataTablesResult<Map<String, Object>> result = new DataTablesResult<>(request);
			Map<String, Object> params = new HashMap<String, Object>();
			String ARCHIVAL_PERIOD = request.getParameter("ARCHIVAL_PERIOD");// 存储年限
			String enrollYear = request.getParameter("enrollYear");// 查询的年
			params.put("ARCHIVAL_PERIOD", ARCHIVAL_PERIOD);
			String start = "-12-31";
			String end = "-01-01";
			if (enrollYear != null && enrollYear.trim().length() > 0) {
				int logmin = Integer.parseInt(enrollYear);
				logmin -= 1;
				int logmax = Integer.parseInt(enrollYear);
				logmax += 1;
				params.put("logmin", logmin + start);
				params.put("logmax", logmax + end);
			} else {
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				params.put("logmin", (year-1)+start);
				params.put("logmax", (year+1)+end);
			}
			workarchivesService.workarchivesByPage(result, params);
			res.success("档案管理分页查询成功", result);
			logger.info("档案管理分页查询成功");
		} catch (Exception e) {
			res.init("档案管理分页查询失败");
			logger.error("档案管理分页查询失败", e);
		}
		return res;
	}

	/**
	 * 档案管理目录打印
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "workarchivesDirectory")
	public ResponseModel<List<String>> workarchivesDirectory(HttpServletRequest request) {
		ResponseModel<List<String>> res = new ResponseModel<>();
		logger.info("开始档案管理目录打印");
		try {
			// 返回的临时文件集合
			List<String> temp_file_urls = new ArrayList<>();
			Map<String, Object> params = new HashMap<String, Object>();
			String ARCHIVAL_PERIOD = request.getParameter("ARCHIVAL_PERIOD");// 存储年限
			String enrollYear = request.getParameter("enrollYear");// 查询的年
			params.put("ARCHIVAL_PERIOD", ARCHIVAL_PERIOD);
			String start = "-12-31";
			String end = "-01-01";
			if (enrollYear != null && enrollYear.trim().length() > 0) {
				int logmin = Integer.parseInt(enrollYear);
				logmin -= 1;
				int logmax = Integer.parseInt(enrollYear);
				logmax += 1;
				params.put("logmin", logmin + start);
				params.put("logmax", logmax + end);
			} else {
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				params.put("logmin", (year-1)+start);
				params.put("logmax", (year+1)+end);
			}
			// 获取缓存文件 存储位置
			String ctxPath = request.getSession().getServletContext().getRealPath("/");
			// 文件夹路径
			String tempPath_url = ctxPath + File.separator + tempurl;
			File file_url_temp = new File(tempPath_url);
			// 如果文件夹不存在则创建
			if (!file_url_temp.exists() && !file_url_temp.isDirectory()) {
				file_url_temp.mkdir();
			}
			
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 查询出来的集合
			List<Map<String, Object>> list = workarchivesService.workarchivesDirectory(params);
			if(list.size()>0) {
				// 当前组临时文件夹
				String now_file_url = file_url_temp + File.separator + uuid;
				File now_file_path = new File(now_file_url);
				// 如果文件夹不存在则创建
				if (!now_file_path.exists() && !now_file_path.isDirectory()) {
					now_file_path.mkdir();
				}
				TemplateExportParams templ = new TemplateExportParams("template/work-templ.xls");
				int k = 0;
				for (int i = 0; i < list.size(); i += 9) {
					// 每个文件9条
					List<Map<String, Object>> newlist = new ArrayList<>();
					if (i + 9 < list.size()) {
						newlist = list.subList(i, i + 9);
					} else {
						newlist = list.subList(i, list.size());
					}

					// 模板内容
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("worklist", newlist);
					Workbook workbook = ExcelExportUtil.exportExcel(templ, map);
					String filename = k + "_Directory.xls";
					FileOutputStream fos = new FileOutputStream(now_file_path + File.separator + filename);
					workbook.write(fos);
					fos.close();
					k++;
					// 返回的文件相对目录
					temp_file_urls.add(tempurl + File.separator + uuid + File.separator+ filename);
				}
			}
			logger.info("档案管理目录打印,临时文件夹目录:" + temp_file_urls);
			res.success("档案管理目录打印成功", temp_file_urls);
			logger.info("档案管理目录打印成功");
		} catch (Exception e) {
			res.init("档案管理目录打印失败");
			logger.error("档案管理目录打印失败", e);
		}
		return res;
	}

	/**
	 * 档案管理正文批量打印
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "workarchivesPofile")
	public ResponseModel<List<String>> workarchivesPofile(HttpServletRequest request) {
		ResponseModel<List<String>> res = new ResponseModel<>();
		logger.info("开始档案管理正文批量打印");
		try {
			// 返回的正文文件集合
			List<String> temp_file_urls = new ArrayList<>();
			Map<String, Object> params = new HashMap<String, Object>();
			String ARCHIVAL_PERIOD = request.getParameter("ARCHIVAL_PERIOD");// 存储年限
			String enrollYear = request.getParameter("enrollYear");// 查询的年
			params.put("ARCHIVAL_PERIOD", ARCHIVAL_PERIOD);
			String start = "-12-31";
			String end = "-01-01";
			if (enrollYear != null && enrollYear.trim().length() > 0) {
				int logmin = Integer.parseInt(enrollYear);
				logmin -= 1;
				int logmax = Integer.parseInt(enrollYear);
				logmax += 1;
				params.put("logmin", logmin + start);
				params.put("logmax", logmax + end);
			} else {
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				params.put("logmin", (year-1)+start);
				params.put("logmax", (year+1)+end);
			}

			// 查询出来的集合
			List<Map<String, Object>> list = workarchivesService.workarchivesDirectory(params);

			for (Map<String, Object> map : list) {
				//根据mark确定文档类型，1:公发,2:公收,3:简发,4:简收
				Long mark=(Long)map.get("mark");
				String path="";
				if(1==mark) {
					//获取ID，查找到具体的ID文件夹
					//当前业务文件存储位置
					path=docSendFiles+map.get("ID")+File.separator;
				}else if(2==mark) {
					//当前业务文件存储位置
					path=docReceFiles+map.get("ID")+File.separator;
				}else if(3==mark) {
					//当前业务文件存储位置
					path=briSendFiles+map.get("ID")+File.separator;
				}else if(4==mark) {
					//当前业务文件存储位置
					path=briReceFiles+map.get("ID")+File.separator;
				}
				String fileName=getFileName(path);
				if(fileName!=null) {
					//如果文件不为空
					temp_file_urls.add(path+fileName);
				}
			}
			res.success("档案管理正文批量打印成功", temp_file_urls);
			logger.info("档案管理正文批量打印成功");
		} catch (Exception e) {
			res.init("档案管理正文批量打印失败");
			logger.error("档案管理正文批量打印失败", e);
		}
		return res;
	}

	/**
	 * 根据文件路径查找序号最大的文件名称
	 * @param path
	 * @return
	 */
	private String getFileName(String path) {
		File dir = new File(path);
		//定义规则，以z开头的是正文
		FilenameFilter filter = new FilenameFilter() {
			public boolean accept(File dir, String name) {
				if (name.startsWith("z")) {
					return true;
				} else {
					return false;
				}
			}
		};
		if(!dir.exists()&&!dir.isDirectory()) {
			//如果没有目录直接返回
			return null;
		}else {
			// 获取路径下的文件列表
			File[] fs = dir.listFiles(filter);
			if(fs.length!=0) {
				String fileName="";
				int number=0;
				for(int i=0;i<fs.length;i++) {
					String temp=fs[i].getName();
					//按照规则拆分文件名，找到序号，进行比较，找到最大序号的那个文件名
					int nowNumber=Integer.parseInt(temp.substring(temp.indexOf("_")+1, temp.indexOf(".")));
					if(nowNumber>=number) {
						number=nowNumber;
						fileName=temp;
					}
				}
				return fileName;
			}else {
				//目录下没有文件
				return null;
			}
		}
	}

	/**
	 * 删除打印目录生成的Excel
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "workarchivesDelTemp")
	public ResponseModel<String> workarchivesDelTemp(HttpServletRequest request) {
		ResponseModel<String> res = new ResponseModel<>();
		logger.info("删除打印目录生成的临时文件");
		try {
			String fileName = request.getParameter("fileName");
			if(fileName!=null&&fileName.trim().length()>0) {
				// 截取temp/20180001110022/0_Directory.xls获取/20180001110022
				String foldername = fileName.substring(fileName.indexOf("/"), fileName.lastIndexOf("/"));
				// 获取缓存文件 存储位置
				String ctxPath = request.getSession().getServletContext().getRealPath("/");
				// 文件夹路径
				String tempPath_url = ctxPath + File.separator + tempurl+foldername;
				File file = new File(tempPath_url);
				deleteAllFilesOfDir(file);
			}
			res.success("删除打印目录生成的临时文件成功", null);
			logger.info("删除打印目录生成的临时文件成功");
		} catch (Exception e) {
			res.init("删除打印目录生成的临时文件失败");
			logger.error("删除打印目录生成的临时文件失败", e);
		}
		return res;
	}
	
	/**
	 * 删除文件夹及其文件夹下的所有文件
	 * @param path
	 */
	public static void deleteAllFilesOfDir(File path) {  
	    if (!path.exists())  
	        return;  
	    if (path.isFile()) {  
	        path.delete();  
	        return;  
	    }  
	    File[] files = path.listFiles();  
	    for (int i = 0; i < files.length; i++) {  
	        deleteAllFilesOfDir(files[i]);  
	    }  
	    path.delete();  
	}  

}
