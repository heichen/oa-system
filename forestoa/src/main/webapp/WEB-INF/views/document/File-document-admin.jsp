<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<link rel="stylesheet" href="${ctxStatic}/css/index.css" />
<style type="text/css">
#listBtn>.btngrp>a {
	width: 24.5% !important;
}

.ui-container {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	padding-top: 180px;
	padding-left: 100px;
	padding-right: 100px;
}

.ui-container img:hover {
	position: relative;
	top: 2px;
}
</style>
</head>
<body>
		<div id="tjwq_header">
			<div></div>
		</div>
		<div class="roll" id="roll">
			<a href="javascript:void(0);" class="btn_left"></a>
			<a href="javascript:void(0);" class="btn_right"></a>
			<div class="wrap">
				<ul>
					<li>
						<a href="index.html" title="首页">
							<div class="target-button">
								<img src="images/index/home.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="Work-task.html" title="我的任务">
							<div class="target-button">
								<img src="images/index/16.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="File-handle.html" title="公文办理">
							<div class="target-button">
								<img src="images/index/8.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="System-setup.html" title="系统管理">
							<div class="target-button">
								<img src="images/index/13.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="SearchInfo.html" title="统计查询">
							<div class="target-button">
								<img src="images/index/7.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="Work-check.html" title="考勤管理">
							<div class="target-button">
								<img src="images/index/14.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="Work-program.html" title="工作计划">
							<div class="target-button">
								<img src="images/index/10.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="Work-archives.html" title="档案管理">
							<div class="target-button">
								<img src="images/index/15.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" title="通知通告">
							<div class="target-button">
								<img src="images/index/11.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="File-document-admin.html" title="公文管理">
							<div class="target-button">
								<img src="images/index/15.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="File-document-searchInfo.html" title="公文搜索">
							<div class="target-button">
								<img src="images/index/4.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" title="工作日志">
							<div class="target-button">
								<img src="images/index/17.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" title="办公用品">
							<div class="target-button">
								<img src="images/index/6.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" title="通讯录">
							<div class="target-button">
								<img src="images/index/5.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" title="设备管理">
							<div class="target-button">
								<img src="images/index/3.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" title="车辆管理">
							<div class="target-button">
								<img src="images/index/2.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
					<li>
						<a href="unitManagement.html" title="收发单位管理">
							<div class="target-button">
								<img src="images/index/14.png" width="70px" height="70px" />
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="nav">
			<span id="tjwqtitlenav" style="margin-left:16px;">欢迎登陆本系统！您当前的位置为：首页</span>
			<div style="float:right;">
				<span style="margin-right:40px;">您好！超级管理员</span>
				<a href="login.html" style="margin-right:16px;">[登出]</a>
			</div>
		</div>
		<div class="pagewrap" style="margin-top:30px;width:100%;height:100%;position:relative;background:#f4f4f4;">

			<div id="tjwqBtn" class="jczjcz left_list" style="width: 200px;">
				<div class="tjwqtitle">
					公文管理
				</div>
				<div class="listbtnz">
					<b></b>
					<div framehref>公文管理</div>
				</div>
			</div>
			<div id="tjwqMainframe">
				<div id="tjwqMainframe_bodybox">
					<div id="tjwqMainframe_body">
						<iframe name="mainFrame" id="mainFrame" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="File-document-manager.html"></iframe>
					</div>
				</div>
			</div>
		</div>
		<div class="dislpayArrow hidden-xs">
			<a class="pngfix" href="javascript:void(0);" onclick="fnDisplayNavBar(this)"></a>
		</div>
	</body>
</html>
