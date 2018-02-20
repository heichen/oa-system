package com.gxzn.forestoa.modules.briefing.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.briefing.entity.BriefingReceive;

/**
 * 简报收文dao
 * 
 * @author HaiTao
 *
 */
public interface BriefingReceiveMapper {
	/**
	 * 保存收文
	 * 
	 * @param receive
	 * @return
	 */
	Long saveReceive(BriefingReceive receive);

	/**
	 * 通过收文id获取收文详细信息
	 * 
	 * @param receiveId
	 * @return
	 */
	List<Map<String, Object>> getReceiveByReceiveId(Long receiveId);

	/**
	 * 更新收文内容
	 * 
	 * @param receive
	 * @return
	 */
	Long updateReceive(BriefingReceive receive);

	/**
	 * 更新收文状态为归档
	 * 
	 * @param receive
	 * @return
	 */
	Long updateReceiveStatus(Long receiveId);

	/**
	 * 删除收文
	 * 
	 * @return
	 */
	Long deleteBriefingReceive(Long receiveId);
}