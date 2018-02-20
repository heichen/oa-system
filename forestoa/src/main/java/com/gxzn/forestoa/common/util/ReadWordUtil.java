package com.gxzn.forestoa.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;

public final class ReadWordUtil {

	public static String readWord(String path) {
		String buffer = "";
		InputStream is = null;
		WordExtractor ex = null;
		try {
			if (path.endsWith(".doc")) {
				is = new FileInputStream(new File(path));
				ex = new WordExtractor(is);
				buffer = ex.getText();
			} else if (path.endsWith(".docx")) {
				OPCPackage opcPackage = POIXMLDocument.openPackage(path);
				POIXMLTextExtractor extractor = new XWPFWordExtractor(opcPackage);
				buffer = extractor.getText();
				extractor.close();
			} else {
				throw new RuntimeException("此文档不是MS Word文档");
			}
		} catch (Exception e) {
			throw new RuntimeException("读取word文档内容发生异常,path=" + path, e);
		} finally {
			try {
				if (ex != null) {
					ex.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (IOException e) {
			}
		}
		return buffer;
	}
}
