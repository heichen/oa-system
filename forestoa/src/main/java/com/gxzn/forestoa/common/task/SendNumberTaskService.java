package com.gxzn.forestoa.common.task;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gxzn.forestoa.modules.document.dao.SendNumberMapper;
import com.gxzn.forestoa.modules.document.entity.SendNumber;

@Service(value = "SendNumberTaskService")
public class SendNumberTaskService implements ITask{
	
	@Autowired
	private SendNumberMapper sendNumberMapper;
	
	@Value("${sendNumberUrl}")  
	private String sendNumberUrl;
	@Override
	public void runTask() {
		SendNumber sendNumber = new SendNumber();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");//设置日期格式
        String s=formatter.format(new Date());
        sendNumber.setYear(s);
		List<Map<String, Object>> list = sendNumberMapper.selectAll(sendNumber);
		
		String aa="";
		
		for (Map<String, Object> ll : list) {
			
			aa+="年份:"+ll.get("YEAR")+" 类型:"+ll.get("TYPE")+" 序号:"+ll.get("NODE")+"\r\n";
		}
		
		/* 写入Txt文件 */  
        File writename = new File(sendNumberUrl);
        try {
			writename.createNewFile();
			 BufferedWriter out = new BufferedWriter(new FileWriter(writename));  
		        out.write(aa); //
		        out.flush(); // 把缓存区内容压入文件  
		        out.close(); //
		} catch (IOException e) {
			e.printStackTrace();
		} // 创建新文件  
	}
	
	
	
}
