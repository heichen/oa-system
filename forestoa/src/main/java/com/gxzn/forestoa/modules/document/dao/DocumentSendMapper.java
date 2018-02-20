package com.gxzn.forestoa.modules.document.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.document.entity.DocumentSend;

/**
 * 公文发文dao
 * 
 * @author HaiTao
 *
 */
public interface DocumentSendMapper {
	/**
	 * 保存发文
	 * 
	 * @param send
	 * @return
	 */
	Long saveSend(DocumentSend send);

	/**
	 * 更新发文
	 * 
	 * @param send
	 * @return
	 */
	Long updateSends(DocumentSend send);

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
	Long updateSendStatus(DocumentSend send);

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
	Long deleteDocumentSend(Long sendId);
}