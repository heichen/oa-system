package com.gxzn.forestoa.modules.notice.entity;

import java.util.List;

import com.gxzn.forestoa.modules.sys.entity.Users;

public class UserNotice {
	 private Long usernoticeId;

	    private Long userId;

	    private Long noticeId;

	    private Long status;

	    private String delFlag;

	    private String remarks1;

	    private String remarks2;

	    private String remarks3;
	    private Notice notice;
	    
	    private Users user;
	    
	    private String noticeTitle;
	    
	    
	    

		public String getNoticeTitle() {
			return noticeTitle;
		}

		public void setNoticeTitle(String noticeTitle) {
			this.noticeTitle = noticeTitle;
		}

		public Users getUser() {
			return user;
		}

		public void setUser(Users user) {
			this.user = user;
		}

		public Notice getNotice() {
			return notice;
		}

		public void setNotice(Notice notice) {
			this.notice = notice;
		}

		public Long getUsernoticeId() {
	        return usernoticeId;
	    }

	    public void setUsernoticeId(Long usernoticeId) {
	        this.usernoticeId = usernoticeId;
	    }

	    public Long getUserId() {
	        return userId;
	    }

	    public void setUserId(Long userId) {
	        this.userId = userId;
	    }

	    public Long getNoticeId() {
	        return noticeId;
	    }

	    public void setNoticeId(Long noticeId) {
	        this.noticeId = noticeId;
	    }

	    public Long getStatus() {
	        return status;
	    }

	    public void setStatus(Long status) {
	        this.status = status;
	    }

	    public String getDelFlag() {
	        return delFlag;
	    }

	    public void setDelFlag(String delFlag) {
	        this.delFlag = delFlag == null ? null : delFlag.trim();
	    }

	    public String getRemarks1() {
	        return remarks1;
	    }

	    public void setRemarks1(String remarks1) {
	        this.remarks1 = remarks1 == null ? null : remarks1.trim();
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
