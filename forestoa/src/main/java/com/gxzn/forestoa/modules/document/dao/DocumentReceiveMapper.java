package com.gxzn.forestoa.modules.document.dao;

import java.util.List;
import java.util.Map;

import com.gxzn.forestoa.modules.document.entity.DocumentReceive;

/**
 * 公文收文dao
 * 
 * @author HaiTao
 *
 */
public interface DocumentReceiveMapper {
	/**
	 * 保存收文
	 * 
	 * @param receive
	 * @return
	 */
	Long saveReceive(DocumentReceive receive);

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
	Long updateReceive(DocumentReceive receive);

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
	Long deleteDocumentReceive(Long receiveId);
}