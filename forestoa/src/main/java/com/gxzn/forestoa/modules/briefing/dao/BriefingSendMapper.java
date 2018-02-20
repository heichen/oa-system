package com.gxzn.forestoa.modules.briefing.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.briefing.entity.BriefingSend;

/**
 * 简报发文dao
 * 
 * @author HaiTao
 *
 */
public interface BriefingSendMapper {
	/**
	 * 保存发文
	 * 
	 * @param send
	 * @return
	 */
	Long saveSend(BriefingSend send);

	/**
	 * 通过发文id获取发文详细信息
	 * 
	 * @param SendId
	 * @return
	 */
	List<Map<String, Object>> getSendBySendId(Long sendId);

	/**
	 * 更新发文状态为归档
	 * 
	 * @param Send
	 * @return
	 */
	Long updateSendStatus(BriefingSend send);

	/**
	 * 获取最大的发文文号
	 * 
	 * @return
	 */
	Long getMaxNumber(String type);

	/**
	 * 删除发文
	 * 
	 * @return
	 */
	Long deleteBriefingSend(Long sendId);
}