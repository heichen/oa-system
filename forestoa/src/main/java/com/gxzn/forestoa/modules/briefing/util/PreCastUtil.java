package com.gxzn.forestoa.modules.briefing.util;

public class PreCastUtil {
public String getPreCast ( String k) {
	String s="";
	String[] m=k.toString().trim().split(",");
	for (int i=0; i<m.length; i++) {
		if("0".equals(m[i]))
		{
			s+="工作要闻,";
		}
		if("1".equals(m[i]))
		{
			s+="队伍建设,";
		}
		if("2".equals(m[i]))
		{
			s+="刑侦快讯,";
		}
		if("3".equals(m[i]))
		{
			s+="法制园地,";
		}
		if("4".equals(m[i]))
		{
			s+="基础建设,";
		}
		if("5".equals(m[i]))
		{
			s+="荣誉之窗,";
		}
		if("6".equals(m[i]))
		{
			s+="专项行动,";
		}
		if("7".equals(m[i]))
		{
			s+="警苑文化,";
		}
		if("8".equals(m[i]))
		{
			s+="执法规范建设,";
		}
		if("9".equals(m[i]))
		{
			s+="信息化建设,";
		}
		if("10".equals(m[i]))
		{
			s+="视频宣传,";
		}
		if("11".equals(m[i]))
		{
			s+="专题专栏,";
		}
		
	}
	if (s != null && s.trim().length() > 0) {
		if (s.endsWith(",")) {
			// 如果最后一个字符是，则把，删除掉
			s = s.substring(0, s.length() - 1);
		}
	}
	return s;
}
}
