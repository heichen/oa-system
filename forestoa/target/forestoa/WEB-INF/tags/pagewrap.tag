<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="moduleName" required="true" type="java.lang.String" description="模块名称" %>
<%@ attribute name="pagewrapStyle" required="true" type="java.lang.String" description="pagewrap样式"%>
<%@ attribute name="tjwqBtnStyle"  required="true" type="java.lang.String" description="tjwqBtn样式"%>
<%@ attribute name="singleChildFlag" required="false" type="java.lang.Boolean" description="是否为单一子模块"%>
<%@ attribute name="iframeUrl" required="false" type="java.lang.String"  description="iframe的URL"%>
<c:set var="singleFlag" value="${empty singleChildFlag? false: singleChildFlag}" />
<c:set var="iframeLinkUrl" value="${empty iframeUrl? '': iframeUrl}" />
<div class="pagewrap" style="${pagewrapStyle}">
	<div id="tjwqBtn" class="jczjcz left_list" style="${tjwqBtnStyle}">
		<div class="tjwqtitle">${moduleName}</div>
		<c:choose>
			<c:when test="${moduleName=='公文办理'}">
				<div class="listbtnz menu_none" m_url="WorkmyTask">
					<b></b>
					<div framehref>我的任务</div>
				</div>
				<div class="listbtnz menu_none" m_url="Filedocumentmanager">
					<b></b>
					<div framehref>公文管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="Filedocumentsearch">
					<b></b>
					<div framehref>我的公文</div>
				</div>
				<div  class="listbtnz menu_none" m_url="Filedocumenthandlesend">
					<b></b>
					<div framehref>公文-发文管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="Filedocumenthandlereceive">
					<b></b>
					<div framehref>公文-收文管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="Filebriefinghandlesend">
					<b></b>
					<div framehref>简报-发文管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="Filebriefinghandlereceive">
					<b></b>
					<div framehref>简报-收文管理</div>
				</div>
			</c:when>
			<c:when test="${moduleName=='系统管理'}">
				<div class="listbtnz menu_none" m_url="Systempower">
					<b></b>
					<div framehref>权限管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="Systemorganization">
					<b></b>
					<div framehref>组织管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="Systempersonnel">
					<b></b>
					<div framehref>人员管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="unitfilemanagement">
					<b></b>
					<div framehref>收发单位管理</div>
				</div>
				<div class="listbtnz menu_none" m_url="sendNumber">
					<b></b>
					<div framehref>公文文号管理</div>
				</div>
			</c:when>
			<c:when test="${moduleName=='考勤管理'}">
				<div class="listbtnz menu_none" m_url="statisticsCheck">
					<b></b>
					<div framehref>考核表</div>
				</div>
				<div class="listbtnz menu_none" m_url="" >
					<b></b>
					<div framehref>值班表</div>
				</div>
			</c:when>
			<c:when test="${moduleName=='通知公告'}">
				<div class="listbtnz" >
					<b></b>
					<div framehref>通知通告</div>
				</div>
			</c:when>
			<c:when test="${moduleName=='工作计划'}">
				<div class="listbtnz">
					<b></b>
					<div framehref>工作计划</div>
				</div>
			</c:when>
			<c:when test="${moduleName=='统计查询'}">
				<div class="listbtnz menu_none" m_url="StatisticssearchInfo">
					<b></b>
					<div framehref>公文查询</div>
				</div>
				<div class="listbtnz menu_none" m_url="Statisticsfallback">
					<b></b>
					<div framehref>回退查询</div>
				</div>
			</c:when>
			<c:when test="${moduleName=='档案管理'}" >
				<div class="listbtnz">
					<b></b>
					<div framehref>档案管理</div>
				</div>
			</c:when>
		</c:choose>
	</div>
	<div id="tjwqMainframe">
		<div id="tjwqMainframe_bodybox">
			<div id="tjwqMainframe_body">
				<iframe name="mainFrame" id="mainFrame" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="${iframeLinkUrl}"></iframe>
			</div>
		</div>
	</div>
</div>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" href="javascript:void(0);" onclick="fnDisplayNavBar(this)"></a>
</div>
<script type="text/javascript" src="${ctxStatic}/js/column.js?9"></script>
<script type="text/javascript" src="${ctxStatic}/js/menu-role.js"></script>
<script type="text/javascript">
$(function() {
	var user=${sessionScope.loginuser};
	right_menu_init(user);
	var singleFlag = ${singleFlag};
	if(singleFlag==false){
		left_menu_init(user,'${moduleName}');
	}
});
</script>