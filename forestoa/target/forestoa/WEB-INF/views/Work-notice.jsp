﻿<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@taglib prefix="arestags"  tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />


</head>
	<body>
		<%@include file="/WEB-INF/views/include/carousel.jsp" %>
		<arestags:pagewrap moduleName="通知公告"  pagewrapStyle="margin-top:30px;width:100%;height:100%;position:relative;background:#f4f4f4;" tjwqBtnStyle="width: 200px;" singleChildFlag="true" iframeUrl="${ctx}/Workbulletin"/>
</body>
</html>
