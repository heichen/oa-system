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
	<div id="tjwq_header" class="box-shadow22">
		<div></div>
	</div>
	<div id="nav" style="z-index: 12;">
		<span style="margin-left: 16px;">欢迎登陆本系统！您当前的位置为：首页</span>
		<div style="float: right;">
			<span style="margin-right: 40px;" id="index_login_user">您好！</span> 
			<a onclick="editPwd('修改密码','${ctx}/Syschangepassword','600','300')" href="javascript:;" style="margin-right:16px;">[修改密码]</a>
			<a	href="${ctx}/quit" style="margin-right: 16px;">[注销]</a>
		</div>
	</div>
	<div class="ui-container">
		<div style="width: 100%; height: 100%; position: relative;">
			<div id="listBtn"
				style="position: absolute; width: 100%; height: 100%;">
				<div class="btngrp">
					<a href="${ctx}/Filehandle" class="menu_none" name="menu_btn">
						<div class="target-button">
							<div style="position: relative;">
								<span class="menu_none" id="index_work_todo_task_nums"
									style="position: absolute; top: 0px; left: 50px; z-index: 999;">15</span>
								<img src="${ctxStatic}/images/index/8.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>公文办理</p>
							</div>
						</div>
					</a> <a href="${ctx}/Systemsetup" class="menu_none" name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/13.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>系统管理</p>
							</div>
						</div>
					</a> <a href="${ctx}/SearchInfo" class="menu_none" name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/7.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>统计查询</p>
							</div>
						</div>
					</a> <a href="${ctx}/Workcheck" class="menu_none" name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/14.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>考勤管理</p>
							</div>
						</div>
					</a> <a href="${ctx}/Workprogram" class="menu_none" name="menu_btn">
						<div class="target-button">
						
							<div style="position: relative;">
									<span id="number1" class="badge badge-danger" style="position: absolute; top: 0px;left: 50px;z-index: 999;">0</span>
									<img src="${ctxStatic}/images/index/10.png" width="70px" height="70px" />
								</div>
						
						
							<%-- <div>
								<img src="${ctxStatic}/images/index/10.png" width="70px"
									height="70px" />
							</div> --%>
							<div class="mt-10">
								<p>工作计划</p>
							</div>
						</div>
					</a> <a href="${ctx}/Workarchives" class="menu_none" name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/15.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>档案管理</p>
							</div>
						</div>
					</a> <a href="${ctx}/Worknotice" class="menu_none" name="menu_btn">
						<div class="target-button">
						
							<div style="position: relative;">
									<span id="number" class="badge badge-danger" style="position: absolute; top: 0px;left: 50px;z-index: 999;"></span>
									<img src="${ctxStatic}/images/index/11.png" width="70px" height="70px" />
								</div>
						
							<%-- <div>
								<img src="${ctxStatic}/images/index/11.png" width="70px"
									height="70px" />
							</div> --%>
							<div class="mt-10">
								<p>通知通告</p>
							</div>
						</div>
					</a> <a class="otherManageBtn menu_none" href="Javascript:;"
						name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/17.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>工作日志</p>
							</div>
						</div>
					</a> <a class="otherManageBtn menu_none" href="Javascript:;"
						name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/6.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>办公用品</p>
							</div>
						</div>
					</a> <a class="otherManageBtn menu_none" href="Javascript:;"
						name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/5.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>通讯录</p>
							</div>
						</div>
					</a> <a class="otherManageBtn menu_none" href="Javascript:;"
						name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/3.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>设备管理</p>
							</div>
						</div>
					</a> <a class="otherManageBtn menu_none" href="Javascript:;"
						name="menu_btn">
						<div class="target-button">
							<div>
								<img src="${ctxStatic}/images/index/2.png" width="70px"
									height="70px" />
							</div>
							<div class="mt-10">
								<p>车辆管理</p>
							</div>
						</div>
					</a> 
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	/* $(function(){
	$.ajax({
		url:'documentReceive/getReceiveTask',
		type: "POST", 
		data: {
			"endPersonId": 3
		},
		dataType: "json",
		success: function(result) {
			if(result.success) {
				console.log(result);
				$("#spanId").html(result.length);
			} else {
				layer.msg(result.msg);
			}
		},
		error: function(data) {
			console.log(data.msg);
		}
	});
}) */
		
		$('.otherManageBtn').click(function() {
			layer.msg('功能正在完善中...', {
				icon : 5
			});
		});

		$(function() {
			menu_btn_init();
			getToDoTaskNums();
		});
		
		function menu_btn_init(){
			var user=${sessionScope.loginuser};
			$.cookie("login_userId",user.userId);
			$.cookie("login_userNumber",user.userNumber);
			$.cookie("login_userpwd",user.loginPassword);
			//用户对象
			//var user=JSON.parse(loginuser);  
			$("#index_login_user").text('您好！'+user.userName);
			//用户菜单对象
			var menus=user.reandmenus;
			if(user.userType=="1"){
				$("a[name='menu_btn']").each(  
					function(){  
						//console.log($(this));
						$(this).attr("class","menu_block");
					}
				);
			}else{
				$("a[name='menu_btn']").each(  
						function(){  
							//当前用户菜单
							var menuname=$(this).find('p').text();
							//console.log(menuname+'-------');
							for(var i=0;i<menus.length;i++){
								var menu=menus[i];
								//console.log(menu);
								if(menus[i].mName.trim() ==menuname.trim()){
									$(this).attr("class","menu_block");
									break;
								}
							}
							//console.log($(this).find('p').text());
							//$(this).attr("class","menu_block");
							
						}
					);
			}
		};
		//获取待办任务数量
		function getToDoTaskNums(){
			$.ajax({
				url : 'workTask/getToDoTaskNums',
				success : function(data) {
					if (data.success) {
						if(data.data>0){
							$("#index_work_todo_task_nums").text(data.data);
							$("#index_work_todo_task_nums").attr("class","badge badge-danger");
						}
					} else {
						layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
					}

				}
			})
		};
		
		
/* 控制通知提醒的右上角标的显示与隐藏 */		
		$(document).ready(function() {
			var user=${sessionScope.loginuser};
			if(user.userNumber!='admin'){
				
				var url = "userNotice/selectAll2"
					$.ajax({
						type : "POST",
						url : url,
						dataType : "json",
						success : function(result) {
							var len=result.data.length;
							var number=0;
							for(var i=0;i<len;i++){
								if(result.data[i].status==0){
									number++;
								}										
							}
								$("#number").hide();
							if(number>0){
								$("#number").text(number);
								$("#number").show();
							}				
						}
					});
				
			}else{
				$("#number").hide();
			}
			
		});
		
		
/* 控制工作计划的右上角标的显示与隐藏 */		
		$(document).ready(function() {
			var url = "workplan/selectWPNumber?status=查询";
			
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {
					var number=result.length;
					
						$("#number1").hide();
					if(number>0){
						$("#number1").text(number);
						$("#number1").show();
					}				
				}
			});
			
		});	
		
		
		
	</script>
</body>
</html>
