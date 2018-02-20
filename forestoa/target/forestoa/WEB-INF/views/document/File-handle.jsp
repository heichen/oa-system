<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@taglib prefix="arestags"  tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/header.css" />
	<link href="${ctxStatic}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctxStatic}/lib/zTree/v3/css/bootstrapStyle/bootstrapStyle.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/carousel.jsp" %>
	<arestags:pagewrap moduleName="公文办理" pagewrapStyle="margin-top: 30px; width: 100%; height: 70%; position: relative;" tjwqBtnStyle="width: 200px;" />

<script type="text/javascript">
function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
$(function(){
	var url = GetQueryString("url");
	if(url!=null&&url.trim().length>0){
		//console.log(url);
		$("#mainFrame").attr('src',ctx+'/'+url);
	}
});
</script>

</body>
</html>