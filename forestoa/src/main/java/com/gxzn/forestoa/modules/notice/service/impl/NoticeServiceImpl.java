package com.gxzn.forestoa.modules.notice.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.log.Logger;
import com.gxzn.ares.framework.log.LoggerFactory;
import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.ares.framework.utils.HttpRequestUtils;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.fastmsg.entity.SysMsg;
import com.gxzn.forestoa.modules.fastmsg.util.FastMsgUtil;
import com.gxzn.forestoa.modules.notice.dao.NoticeMapper;
import com.gxzn.forestoa.modules.notice.dao.UserNoticeMapper;
import com.gxzn.forestoa.modules.notice.entity.Notice;
import com.gxzn.forestoa.modules.notice.entity.UserNotice;
import com.gxzn.forestoa.modules.notice.service.NoticeService;
import com.gxzn.forestoa.modules.sys.dao.UsersMapper;
import com.gxzn.forestoa.modules.sys.entity.Users;

@Service
public class NoticeServiceImpl implements NoticeService {
	// 日志
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private UserNoticeMapper usernoticeMapper;
	
	@Value("${sendNoticeUrl}")
	private String sendNoticeUrl;
	
	@Override
	public void selectAll(DataTablesResult<Notice> result,Notice notice) {
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
				PageHelper.startPage(result.getPage_num(), result.getPage_size());
				// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
				List<Notice> list = noticeMapper.selectAll(notice);
				// 用PageInfo对结果进行包装
				PageInfo<Notice> pageInfo = new PageInfo<Notice>(list);
				//封装数据给DataTables  
				result.setDraw(result.getDraw());  
				result.setData(pageInfo.getList());    
				//数据库里总共记录数
				result.setRecordsTotal((int)pageInfo.getTotal());   
				//过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
				result.setRecordsFiltered((int)pageInfo.getTotal());
	}

	@Override
	public Notice selectByKey(Long noticeId) {
		Notice notice = new Notice();
		
		notice = noticeMapper.selectByKey(noticeId);
		
		String receiver = notice.getNoticeReceiver();
		
		
//		
//		Long orgId=Long.parseLong("String");
//		Long roleId=Long.parseLong("String");
		
		
		
		
		return notice;
	}

	@Override
	public List<Notice> selectByTitle(String temp) {
		// TODO Auto-generated method stub
		return noticeMapper.selectByTitle(temp);
	}

	@Override
	public int delete(Long nId) {
		// TODO Auto-generated method stub
		return noticeMapper.delete(nId);
	}

	@Override
	public int delete2(Long nId) {
		// TODO Auto-generated method stub
		return noticeMapper.delete2(nId);
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.update(notice);
	}

	@Override
	public String insert(Notice notice,Users loginUser) {
		
		List<Users> users=usersMapper.selectAllE(loginUser);
		String NoticeReceiver="";
		for(Users user:users) {
			NoticeReceiver +=user.getUserId()+",";
		}
		
		String[] NoticeReceiverIdArray=NoticeReceiver.split(",");
		
		
		Long[] noticeReceiverIdLong = new Long[NoticeReceiverIdArray.length];
      for (int idx = 0; idx < noticeReceiverIdLong.length; idx++ ) {
      	noticeReceiverIdLong[idx] = Long.parseLong(NoticeReceiverIdArray[idx]);
      }
		
		System.out.println(NoticeReceiverIdArray);
		
		StringBuffer sb = new StringBuffer();
      for(int i = 0; i < noticeReceiverIdLong.length; i++){
       sb. append(noticeReceiverIdLong[i]+",");
      }
      String ss = sb.toString();
      notice.setRemarks2(ss);
      noticeMapper.insert(notice);
		
		//获取系统时间

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String s=formatter.format(new Date());

        Date date=null;
        try{
            date =  formatter.parse(s);
        }catch(Exception e){
        	logger.error("获取系统时间失败", e);
        }
        notice.setNoticeCreatetime(date);
        Map<String, Object> params = new HashMap<>();
        params.put("title", notice.getNoticeTitle());
        params.put("description",notice.getNoticeContent());
        //params.put("type", "1");
        System.out.println(sendNoticeUrl);
        String xmlhtml = HttpRequestUtils.post(sendNoticeUrl, params, true).body();
       
        
        FastMsgUtil fastMsg = new FastMsgUtil();
        String Receivers = fastMsg.sysMsgUsersTemplate(noticeReceiverIdLong);
        SysMsg massage=new SysMsg();
        massage.setTitle(notice.getNoticeTitle());
        massage.setContent(notice.getNoticeContent());
        massage.setCategory(notice.getNoticeType());
        massage.setReceivers(Receivers);
        
        String flag=FastMsgUtil.ERRORCODE[fastMsg.SendSysMsg(massage)];
        notice.setRemarks3(flag);
        noticeMapper.update(notice);
        List<UserNotice> uns=new ArrayList<>();	
        
        for(int i=0,len=noticeReceiverIdLong.length;i<len;i++){
			  
        	UserNotice un=new UserNotice();
        	un.setNoticeId(new Long((long)notice.getNoticeId()));
        	un.setUserId(noticeReceiverIdLong[i]);
		    uns.add(un);
		}
        usernoticeMapper.insertList(uns);
        
        
        
		// TODO Auto-generated method stub
		return flag;
	}
	@Override
	public Map<String,Object> webMessage(){
		return null;
		
	};

}
