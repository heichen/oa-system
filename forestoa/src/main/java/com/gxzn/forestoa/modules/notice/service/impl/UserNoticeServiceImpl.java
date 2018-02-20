package com.gxzn.forestoa.modules.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxzn.ares.framework.mybatis.pagehelper.PageHelper;
import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
import com.gxzn.forestoa.common.util.DataTablesResult;
import com.gxzn.forestoa.modules.notice.dao.UserNoticeMapper;
import com.gxzn.forestoa.modules.notice.entity.UserNotice;
import com.gxzn.forestoa.modules.notice.service.UserNoticeService;

@Service
public class UserNoticeServiceImpl implements UserNoticeService {

	@Autowired
	private UserNoticeMapper userNoticeMapper;
	
	@Override
	public void selectAll(DataTablesResult<UserNotice> result,UserNotice userNotice) {
		
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
				PageHelper.startPage(result.getPage_num(), result.getPage_size());
				// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
				List<UserNotice> list = userNoticeMapper.selectAll(userNotice);
				// 用PageInfo对结果进行包装
				PageInfo<UserNotice> pageInfo = new PageInfo<UserNotice>(list);
				//封装数据给DataTables  
				result.setDraw(result.getDraw());  
				result.setData(pageInfo.getList());    
				//数据库里总共记录数
				result.setRecordsTotal((int)pageInfo.getTotal());   
				//过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
				result.setRecordsFiltered((int)pageInfo.getTotal());
	}
	
	@Override
	public void selectAllByNId(DataTablesResult<UserNotice> result,Long noticeId) {
		
		// 获取第1页，10条内容，默认查询总数count.getPageNum当前页，PageSize每页的数量
				PageHelper.startPage(result.getPage_num(), result.getPage_size());
				// 紧跟着的第一个select方法会被分页,此处根据具体业务，从result中获取查询条件等，来进行查询
				List<UserNotice> list = userNoticeMapper.selectAllByNId(noticeId);
				// 用PageInfo对结果进行包装
				PageInfo<UserNotice> pageInfo = new PageInfo<UserNotice>(list);
				//封装数据给DataTables  
				result.setDraw(result.getDraw());  
				result.setData(pageInfo.getList());    
				//数据库里总共记录数
				result.setRecordsTotal((int)pageInfo.getTotal());   
				//过滤后的记录数（如果有接收到前台的过滤条件，则返回的是过滤后的记录数）
				result.setRecordsFiltered((int)pageInfo.getTotal());
	}
	
	
	
	
	
	@Override
	public List<UserNotice> selectAll2(UserNotice userNotice) {
		
		return userNoticeMapper.selectAll(userNotice);
	}

	@Override
	public UserNotice selectByKey(Long userNoticeId) {
		// TODO Auto-generated method stub
		return userNoticeMapper.selectByKey(userNoticeId);
	}

	@Override
	public int delete(Long userNoticeId) {
		// TODO Auto-generated method stub
		return userNoticeMapper.delete(userNoticeId);
	}

	@Override
	public int delete2(Long userNoticeId) {
		// TODO Auto-generated method stub
		return userNoticeMapper.delete2(userNoticeId);
	}

	@Override
	public int update(UserNotice userNotice) {
		// TODO Auto-generated method stub
		return userNoticeMapper.update(userNotice);
	}

	@Override
	public int insert(UserNotice userNotice) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
