package com.gxzn.forestoa.modules.notice.entity;

import java.util.Date;
import java.util.List;

import com.gxzn.forestoa.modules.sys.entity.Org;
import com.gxzn.forestoa.modules.sys.entity.Users;

public class Notice {
	 private Integer noticeId;

	    private String noticeTitle;

	    private String noticeContent;

	    private String noticeType;

	    private Date noticeCreatetime;

	    private Long noticeCreater;

	    private String noticeReceiver;

	    private Integer forusertype;

	    private Integer foronlineusers;

	    private Integer needreaded;

	    private String delFlag;

	    private String remarks2;

	    private String remarks3;
	    
	    private String noticeReceiverId;
	    private Users creater;

	    
	    
	    
	    
		public Users getCreater() {
			return creater;
		}

		public void setCreater(Users creater) {
			this.creater = creater;
		}

		public String getNoticeReceiverId() {
			return noticeReceiverId;
		}

		public void setNoticeReceiverId(String noticeReceiverId) {
			this.noticeReceiverId = noticeReceiverId;
		}

		public Integer getNoticeId() {
	        return noticeId;
	    }

	    public void setNoticeId(Integer noticeId) {
	        this.noticeId = noticeId;
	    }

	    public String getNoticeTitle() {
	        return noticeTitle;
	    }

	    public void setNoticeTitle(String noticeTitle) {
	        this.noticeTitle = noticeTitle == null ? null : noticeTitle.trim();
	    }

	    public String getNoticeContent() {
	        return noticeContent;
	    }

	    public void setNoticeContent(String noticeContent) {
	        this.noticeContent = noticeContent == null ? null : noticeContent.trim();
	    }

	    public String getNoticeType() {
	        return noticeType;
	    }

	    public void setNoticeType(String noticeType) {
	        this.noticeType = noticeType == null ? null : noticeType.trim();
	    }

	    public Date getNoticeCreatetime() {
	        return noticeCreatetime;
	    }

	    public void setNoticeCreatetime(Date noticeCreatetime) {
	        this.noticeCreatetime = noticeCreatetime;
	    }

	    public Long getNoticeCreater() {
	        return noticeCreater;
	    }

	    public void setNoticeCreater(Long noticeCreater) {
	        this.noticeCreater = noticeCreater;
	    }

	    public String getNoticeReceiver() {
	        return noticeReceiver;
	    }

	    public void setNoticeReceiver(String noticeReceiver) {
	        this.noticeReceiver = noticeReceiver == null ? null : noticeReceiver.trim();
	    }

	    public Integer getForusertype() {
	        return forusertype;
	    }

	    public void setForusertype(Integer forusertype) {
	        this.forusertype = forusertype;
	    }

	    public Integer getForonlineusers() {
	        return foronlineusers;
	    }

	    public void setForonlineusers(Integer foronlineusers) {
	        this.foronlineusers = foronlineusers;
	    }

	    public Integer getNeedreaded() {
	        return needreaded;
	    }

	    public void setNeedreaded(Integer needreaded) {
	        this.needreaded = needreaded;
	    }

	    public String getDelFlag() {
	        return delFlag;
	    }

	    public void setDelFlag(String delFlag) {
	        this.delFlag = delFlag == null ? null : delFlag.trim();
	    }

	    public String getRemarks2() {
	        return remarks2;
	    }

	    public void setRemarks2(String remarks2) {
	        this.remarks2 = remarks2 == null ? null : remarks2.trim();
	    }

	    public String getRemarks3() {
	        return remarks3;
	    }

	    public void setRemarks3(String remarks3) {
	        this.remarks3 = remarks3 == null ? null : remarks3.trim();
	    }
}