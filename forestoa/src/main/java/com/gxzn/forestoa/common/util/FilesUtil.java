package com.gxzn.forestoa.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
/**
 * 文件上传下载
 * @author HaiTao
 *
 */
@RestController
@RequestMapping("/files")
public class FilesUtil {

	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Value("${docSendFiles}")
	private String docSendFiles;// 公文发文路径
	@Value("${docReceFiles}")
	private String docReceFiles;// 公文收文路径
	@Value("${briSendFiles}")
	private String briSendFiles;// 简报发文路径
	@Value("${briReceFiles}")
	private String briReceFiles;// 简报收文路径

	/***
	 * 保存文件
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	private String saveFile(MultipartFile file, String path) throws Exception {
		String returnName = "";
		// 判断文件是否为空
		if (!file.isEmpty()) {
			// 文件夹目录
			String realPath = path;
			File file_url = new File(realPath);
			// 如果文件夹不存在则创建
			if (!file_url.exists() && !file_url.isDirectory()) {
				file_url.mkdirs();
			}
			// 文件名
			String filename = file.getOriginalFilename();
			// 文件保存路径
			String filePath = file_url + File.separator + filename;
			// 转存文件
			file.transferTo(new File(filePath));
			returnName = filename;
		}
		return returnName;
	}

	@RequestMapping("upload")
	public StringBuffer filesUpload(@RequestParam("files") MultipartFile[] files, String path) {
		logger.info("开始上传文件");
		StringBuffer sbuff = new StringBuffer();
		try {

			// 判断file数组不能为空并且长度大于0
			if (files != null && files.length > 0) {
				String s = "";
				// 循环获取file数组中得文件
				for (int i = 0; i < files.length; i++) {
					MultipartFile file = files[i];
					// 保存文件
					s += saveFile(file, path) + ",";
				}
				if (s != null && s.trim().length() > 0) {
					if (s.endsWith(",")) {
						// 如果最后一个字符是，则把，删除掉
						s = s.substring(0, s.length() - 1);
					}
				}
				sbuff.append(s);
			}
			logger.info("上传文件成功");
		} catch (Exception e) {
			logger.error("上传文件失败", e);
		}
		return sbuff;
	}

	// 文件下载 主要方法
	@ResponseBody
	@RequestMapping("download")
	public void file(HttpServletRequest request, HttpServletResponse response, @RequestParam("type") String type,
			@RequestParam("id") String id, @RequestParam("fileName") String fileName) {
		logger.info("开始下载文件,文件名称:" + fileName);
		try {
			request.setCharacterEncoding("UTF-8");
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
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
			// 获取下载文件路径
			String downLoadPath = ctxPath + id + File.separator + fileName;
			// 获取文件的长度
			long fileLength = new File(downLoadPath).length();
			// 设置文件输出类型
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(fileName.getBytes("utf-8"), "iso-8859-1"));
			// 设置输出长度
			response.setHeader("Content-Length", String.valueOf(fileLength));
			// 获取输入流
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			// 输出流
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			// 关闭流
			bis.close();
			bos.close();
		} catch (Exception e) {
			logger.error("上传下载失败", e);
		}

	}
}
