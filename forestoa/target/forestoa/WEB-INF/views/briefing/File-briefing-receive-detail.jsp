<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<link href="${ctxStatic}/lib/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
#listBtn>.btngrp>a {
	width: 24.5% !important;
}
.form .row{
	margin-top:0px;
}
/*办理意见-icon*/
.ui-icon-pos {
	position: absolute;
	right: 30px;
	bottom: 0;
	cursor: pointer;
	font-size: 16px;
}

.row {
	margin-left: 0;
	margin-right: 0;
}

.mt-10 {
	margin-top: 10px !important;
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
	<div class="page-container">
			<div id="tab-system" class="HuiTab">
				<div class="tabBar cl">
					<span >详细</span> <span id="handle_two">办理</span>
				</div>
				<!-- 详细界面 -->
				<div class="tabCon">
				<a id="ui-toggle-1" href="#" style="margin-left: 25px;">审批流程</a>
					<div id="ui-content-1" class="row cl ml-75 mt-5"
						style="margin-top: 0; overflow: hidden;display:none;">
						<div class="formControls col-xs-8 col-sm-1">
							<div id="handleone" style="border-radius: 50%">
								<span class="fs1">收文人员</span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div id="handletwo">
								<span class="fs1">分发人员</span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div id="handlethree">
								<span class="fs1">分管领导</span> 
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div id="handlefour">
								<span class="fs1">科室负责人</span> 
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div id="handlefive">
								<span class="fs1">科员</span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div id="handlesix" style="border-radius: 50%">
								<span class="fs1">归档</span>
							</div>
						</div>
					</div>
					<!--办理信息-->
					<div class="form form-horizontal">
					<div id="dvBrand" class="row cl dvBrand "
						style="position: relative; overflow: hidden;">
						<div class="row cl">
						<div style="position: absolute;left: 25px; top: 0; z-index: 999;">
								<a id="ui-toggle-2" href="#" style="margin-right: 40px;">办理信息</a>
							</div>
						<label class="form-label col-xs-4 col-sm-2">标题:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<!-- <input type="text" class="input-text radius" id="TITLE_ONE"
							readonly="readonly"> -->
							<span  id="TITLE_ONE"></span>
						</div>
						</div>
						<div id="ui-content-2">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2">来文单位:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" class="input-text radius"id="COMPANY_ONE" readonly="readonly"> -->
								<span id="COMPANY_ONE"></span>
							</div>
							<label class="form-label col-xs-4 col-sm-2">简报号:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" class="input-text radius" 
									id="NUMBER_ONE" readonly="readonly"> -->
									<span id="NUMBER_ONE"></span>
							</div>
							
							<label class="form-label col-xs-4 col-sm-2 mt-10">存储期限:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-10" >
									<div class="radio-box" id="ARCHIVAL_PERIOD_ONE"
									 style="padding-right: 0;">
									<input type="radio" disabled id="radio-1"
										name="demo-radio1" value="0"> <label for="radio-1">10年</label>
									<input type="radio" disabled id="radio-1"
										name="demo-radio1" value="1"> <label for="radio-1">30年</label>
									<input type="radio" disabled id="radio-1"
										name="demo-radio1" value="2"> <label for="radio-1">永久</label>
								</div>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2">页数:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" class="input-text radius" id="PAGES_ONE"
									readonly="readonly"> -->
									<span id="PAGES_ONE"></span>
							</div>
							<label class="form-label col-xs-4 col-sm-2">收文日期:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" id="CREATE_TIME_ONE"
									class="input-text radius size-M" readonly="readonly"> -->
								<span id="CREATE_TIME_ONE"></span>
							</div>
						</div>
						</div>
					</div>
					
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2 mt-10">文件:</label>
						<div class="formControls col-xs-8 col-sm-3 mt-5">
							<!-- <input type="text" readonly="readonly" id="searchone" class="input-text radius" > -->
							<span id="searchone"></span>
						</div>
						<div class="formControls col-xs-8 col-sm-2 mt-5">
						<a id="searchfile" href="" class="btn btn-primary radius upload-btn">正文查看</a>
						</div>
					</div>

					<!-- 办理意见 -->
				<!-- 	<div class="row cl handleBtn">
						<label class="form-label col-xs-4 col-sm-2">拟办意见:</label>
						<div class="formControls col-xs-8 col-sm-10 pos-r">
							<textarea id="REMARKS_ONE" readonly="readonly" class="textarea radius"></textarea>
						</div>
					</div> -->
					<div class="row cl handleBtn">
						<label class="form-label col-xs-4 col-sm-2 mt-10">分发人员意见:</label>
						<div class="formControls col-xs-8 col-sm-10 pos-r mt-5">
							<textarea id="REMARKS_TWO" readonly="readonly" class="textarea radius"></textarea>
						</div>
					</div>
					<div class="row cl handleBtn">
						<label class="form-label col-xs-4 col-sm-2 mt-10">分管领导意见:
						</label>
						<div class="formControls col-xs-8 col-sm-10 pos-r mt-5">
							<textarea id="REMARKS_THREE" readonly="readonly" class="textarea radius"></textarea>
						</div>
					</div>
					<div class="row cl handleBtn">
						<label class="form-label col-xs-4 col-sm-2 mt-10">科室负责人意见:</label>
						<div class="formControls col-xs-8 col-sm-10 pos-r mt-5">
							<textarea id="REMARKS_FOUR" readonly="readonly" class="textarea radius"></textarea>
						</div>
					</div>
					<div class="row cl handleBtn">
						<label class="form-label col-xs-4 col-sm-2 mt-10">科员意见:</label>
						<div class="formControls col-xs-8 col-sm-10 pos-r mt-5">
							<textarea id="REMARKS_FIVE" readonly="readonly" class="textarea radius"></textarea>
						</div>
					</div>
					</div>
				</div>
				<!-- 办理界面 -->
				<div class="tabCon">
				<a id="ui-toggle-3" href="#" style="margin-left: 25px;">审批流程</a>
					<div id="ui-content-3" class="divProcess row cl ml-75 mt-5"
						style="margin-top: 0;display:none;">
						<div class="formControls col-xs-8 col-sm-1"  id="" >
							<div class="" id="one" style="border-radius:50%">
								<span class="fs1">收文人员</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;" id="send" name=""  startPersonId="" startNodeId="">
							<div class="" id="two">
								<span class="fs1">分发人员</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;"  id="3" onclick="list(this.id)" >
							<div class="" id="three">
								<span class="fs1">分管领导</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;"  id="4" onclick="list(this.id)">
							<div class="" id="four" >
							 	<span class="fs1">科室负责人</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1" id="5" onclick="list(this.id)"
							style="margin-left: -25px;" >
							<div class="" id="five" >
								<span class="fs1">科员</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
							<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1" 
							style="margin-left: -25px;" >
							<div class="" id="six"  style="border-radius:50%">
								<span class="fs1">归档</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
					</div>
        			<form class="form form-horizontal" id="files-save" action="" method="post"
					enctype="multipart/form-data">
					<!--办理信息-->
					<div id="dvBrand" class="row cl dvBrand "
						style="position: relative; overflow: hidden;">
						<div style="position: absolute;left: 25px; top: 0; z-index: 999;">
								<a id="ui-toggle-4" href="#" style="margin-right: 40px;">办理信息</a>
							</div>
							<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">标题:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<!-- <input type="text" class="input-text radius" readonly="readonly" 
								id="TITLE" name="title"> -->
								<span id="TITLE" name="title"></span>
						</div>
						</div>
						<div id="ui-content-4">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2">来文单位:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" class="input-text radius"
									id="COMPANY" readonly="readonly" name="company"> -->
									<span id="COMPANY" name="company"></span>
							</div>
							<label class="form-label col-xs-4 col-sm-2">简报号:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" readonly="readonly" class="input-text radius" 
									id="NUMBER" name="number"> -->
									<span id="NUMBER" name="number"></span>
							</div>
								<div id="ARCHIVAL" style="visibility: hidden">
							<label class="form-label col-xs-4 col-sm-2 mt-10">存档期限:</label>
							<div id="ARCHIVAL_PERIOD" class="formControls col-xs-8 col-sm-2 mt-10">
								<div class="radio-box"  style="padding-right: 0;" >
									<input type="radio"  name="archivalPeriod"  value="0" /> 
									<label for="radio-1">10年</label>
									<input type="radio"  name="archivalPeriod" value="1"  />
									<label for="radio-1">30年</label>
									<input type="radio"  name="archivalPeriod" value="2"  />
									<label for="radio-1">永久</label>
								</div> 
							</div>
							</div>
						</div>
						<div class="row cl">
							<!-- <label class="form-label col-xs-4 col-sm-2 mt-10">份数:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<input type="text" readonly="readonly" class="input-text" value=""
									placeholder="" id="COPIES" name="">
							</div> -->
							<label class="form-label col-xs-4 col-sm-2">页数:</label>
							<div class="formControls col-xs-8 col-sm-2 mt-5">
								<!-- <input type="text" readonly="readonly" class="input-text radius" id="PAGES" name="pages"> -->
								<span id="PAGES" name="pages"></span>
							</div>
							<label class="form-label col-xs-4 col-sm-2">收文日期：</label>
							<div class="formControls col-xs-8 col-sm-2"
								style="margin-top: 5px;">
								<!-- <input type="text" name="createTime" readonly="readonly" id="logmin"
									class="input-text radius size-M"> -->
									<span id="logmin" name="createTime" ></span>
							</div>
						</div>
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2 mt-10">文件:</label>
						<div class="formControls col-xs-8 col-sm-3 mt-5">
					<!-- 	<input type="text" readonly="readonly" class="input-text radius" > -->
						<span id="searchfiletwo"></span>
						</div>
						<div class="formControls col-xs-8 col-sm-2 mt-5">
							<a id="searchtwo" href=""class="btn btn-primary radius upload-btn">正文查看</a>
						</div>
					</div>
					<div class="row cl" id="remarks">
						<label class="form-label col-xs-4 col-sm-2 mt-10">意见:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<textarea name="" id="OPINION"  class="textarea radius"></textarea>
						</div>
						<input type="text" hidden="true" name="receiveId" id="RECEIVE_ID" >
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2 mt-5">
						<input type="button" id="saveBtn" 
								class="btn btn-secondary radius" type="button" value="提交"/>
						</div>
					</div>
					<input id="persons" hidden="true">
			</form>
			</div>
	</div>
<!-- 弹窗 -->
	<div id="modal-demo" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content radius">
				<div class="modal-header">
					<h3 class="modal-title">请选择人员</h3>
					<a class="close" data-dismiss="modal" aria-hidden="true"
						href="javascript:void();">×</a>
				</div>
				<div class="modal-body" style="height: 140px; overflow-y: scroll;">
					<ul id="mainTreeDemo" class="ztree"></ul>
				</div>
				<div class="modal-footer">
					<button id="closeBtn" class="btn btn-primary">确定</button>
					<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${ctxStatic}/lib/webuploader/0.1.5/webuploader.min.js"></script>
			<script type="text/javascript"
			src="${ctxStatic}/js/jquery.ajaxFileUpload.js"></script>
		<!--PageOffice.js-->
	<script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>
	<script type="text/javascript">
		$("#ui-toggle-1").click(function() {
			$("#ui-content-1").fadeToggle(1000);
		});
		$("#ui-toggle-2").click(function() {
			$("#ui-content-2").fadeToggle(1000);
		});
		$("#ui-toggle-3").click(function() {
			$("#ui-content-3").fadeToggle(1000);
		});
		$("#ui-toggle-4").click(function() {
			$("#ui-content-4").fadeToggle(1000);
		});
	</script>
	<script type="text/javascript">
		/*查看是否有组织id，有则进入编辑模式*/
		function GetQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		}
		var taskId = GetQueryString("taskId");
		if (taskId != null && taskId.trim().length > 0) {
			//获取选择的收文数据
			getHandle(taskId);
		} else {
		}

		$('.skin-minimal input').iCheck({
			checkboxClass : 'icheckbox-blue',
			radioClass : 'iradio-blue',
			increaseArea : '20%'
		});
		/*弹窗树*/
		 var setting = {
				check: {
					enable: true,
					chkStyle: "checkbox",
					chkboxType: {
						"Y": "",
						"N": ""
					}
				},
				view: {
					dblClickExpand: false,
					showLine: false,
					selectedMulti: false
				},
				data: {
					//显示得name值
					key : {
						name : "nodeName"
					},
					simpleData : {
						enable : true,
						idKey : "nodeId",
						pIdKey : "pId",
						rootPId : ""
					}
				},
				callback: {
					beforeCheck:zTreeOnCheck
				}
			}; 
		 function zTreeOnCheck(treeId, treeNode) {
			 var zTree = $.fn.zTree.getZTreeObj("tree");
				return treeNode;
		};
		
		var endNodeId="";
		var receiveTasks = new Array();
		/*提交事件*/
	$("#saveBtn").click(function () {
		$("#saveBtn").disabled = true;
		endPersonId = $("#persons").attr("name");;
		if(endPersonId==null||endPersonId=="undefined"){
			endPersonId=","
		}
			var OPINION = $("#OPINION").val();
			var receiveId = $("#RECEIVE_ID").val();
			var startPersonId = $("#send").attr("startPersonId");
			var startNodeId = $("#send").attr("startNodeId");
			btn_url = "briefingReceive/saveReceive";
			receiveTasks = [];
		 if(startNodeId==5||startNodeId==6){
				var menu = {
						"taskId" : taskId,
						"receiveId" : receiveId,
						"startPersonId" : startPersonId,
						"endPersonId" : endPersonId,
						"startNodeId" : startNodeId,
						"endNodeId" : endNodeId,
						"remarks" : OPINION
					};
					receiveTasks.push(menu);	
			}
			else{ 
			  var result=endPersonId.split(",");
				for(var i=1;i<result.length;i++){
					var menu = {
							"taskId" : taskId,
							"receiveId" : receiveId,
							"startPersonId": startPersonId,
							"endPersonId": result[i],
							"startNodeId": startNodeId,
							"endNodeId": endNodeId,
							"remarks":OPINION
						};
						receiveTasks.push(menu);
					}  
			}
			var fileIdArray = new Array();
			$("#files-save input[type='file']").each(function(index, element) {
				fileIdArray.push($(this).attr("id"));
			}); 
			//获取序列化数据
			var arr1 = $("#files-save").serializeArray();
			var data = {};
			$.each(arr1, function(index, ele) {
				data[ele.name] = ele.value;
			    data.tasks=JSON.stringify(receiveTasks);
			});
			if(startNodeId==5){
				save(data, fileIdArray);
			}
			else if(startNodeId==6){
					var s=	$("#ARCHIVAL input[type='radio']:checked").val();
					if(s!=null){
						save(data, fileIdArray);
					}
					else{
						layer.msg('请选择存档期限!', {
							icon : 5
						});
					}
				
			}
			else if (endNodeId > 0 && endNodeId != null && endNodeId != "undefined"&&endPersonId!=",") {
				save(data, fileIdArray);
			} else {
				layer.msg('请选择办理人员!', {
					icon : 5
				});
			} 
			    
		});

			//添加对象
			function save(data,fileIdArray) {
				layer.confirm('确认要提交吗？', function(index) {
					 $.ajaxFileUpload({
							url : ctx+"/briefingReceive/saveReceive",
							secureuri : false,
							fileElementId : fileIdArray,//文件上传域的ID 
							data : data,
							cache : false, //这里
							ifModified : true, //这里
							async : false,
							success : function(data, status) {
								window.location.href = ctx + "/WorkmyTask";
								 layer.msg('已成功!', {
									icon : 1,
									time : 1000
								}); 
								
						},
						error : function(data) {
							console.log(data.msg);
						},
					});
				});
			}
		//显示或隐藏办理
		function getHandle(taskId) {
			$.ajax({ url : 'briefingReceive/getReceiveByTaskId',
						type : "POST",
						data : {
							"taskId" : taskId
						},
						cache : false, //这里
						ifModified : true, //这里
						async : false,
						dataType : "json",
						success : function(result) {
							if (result.success) {
								getReceiveByReceiveId(result.data.RECEIVE_ID);
								if (result.data.TASK_STATUS == 1) {//已办
									document.getElementById("handle_two").style.visibility = "hidden";//隐藏
									$("#tab-system").Huitab({
										index : 0
									});
								} else {//待办
									$("#tab-system").Huitab({
										index : 1
									});
									getReceiveByTaskId(taskId);
								}
							}
						}
					});
		}
		
		/*办理*/
		function getReceiveByTaskId(taskId) {
			$.ajax({
				url : 'briefingReceive/getReceiveByTaskId',
				type : "POST",
				data : {
					"taskId" : taskId
				},
				dataType : "json",
				success : function(result) {
					if (result.success) {
						noidclass(result.data.END_NODE_ID,result.data.TASK_STATUS);
						if (result.data.END_NODE_ID == 2) {
							$("#5").removeAttr("onclick");
						}
						if (result.data.END_NODE_ID == 4) {
							$("#3,#4").removeAttr("onclick");
						}
						if (result.data.END_NODE_ID == 5) {
							$("#3,#4,#5").removeAttr("onclick");
							$.ajax({//查询归档人员
								type : 'POST',
								url : 'users/selectUserByRId',
								data : {
									"rId" : 21
								},
								dataType : "json",
								success : function(result) {
									if (result.success) {
										endPersonId=result.data[0].userId;
										$("#persons").attr("name",endPersonId);
									} else {
										layer.msg(result.msg, {
											icon : 6
										});
									}

								},
								error : function(result) {
									console.log(result.msg);
								}
							});
						}
						if (result.data.END_NODE_ID == 6) {
							$("#3,#4,#5").removeAttr("onclick");
							document.getElementById("ARCHIVAL").style.visibility="visible";
							$("#remarks").hide();
						}
						
						$("#TITLE").text(result.data.TITLE);
						$.ajax({
							url : 'unit/selectLAIById',
							type : "POST",
							data : {
								"unitId" : result.data.COMPANY
							},
							dataType : "json",
							success : function(result) {
								$("#COMPANY").attr("name",result.data[0].id);
								$("#COMPANY").text(result.data[0].name);
							},
							error : function(data) {
								console.log(data.msg);
							}
						})
						$("#NUMBER").text(result.data.NUMBER);
						$("#PAGES").text(result.data.PAGES);
						$("#logmin").text(result.data.CREATE_TIME);
						//$("#FILE").val(result.data.FILE);
						var arrPOFILE=result.data.POFILE.split(",");
						for(var i=0;i<arrPOFILE.length;i++){
						var href = 'javascript:POBrowser.openWindowModeless(\''
										+ ctx
										+ '/opennewword?pofile=\'\+\''
										+ arrPOFILE[0]+'&type=\'\+\''
										+ 4+'&sendId=\'\+\''
										+ result.data.RECEIVE_ID
										+ '\',"width=1200px;height=800px;")';
						$("#searchtwo").attr("href", href);
						$("#searchfiletwo").text(arrPOFILE[0]);
						}
						$("#searchfiletwo").css("color", "red");
						$("#RECEIVE_ID").val(result.data.RECEIVE_ID);
						$("#send").attr("startPersonId",result.data.END_PERSON_ID);
						$("#send").attr("startNodeId",result.data.END_NODE_ID);
					} else {
						alert(result.msg);
					}
				},
				error : function(data) {
					console.log(data.msg);
				}
			});
		}
		/*查看已办的详细信息*/
		function getReceiveByReceiveId(receiveId) {
			$.ajax({
						url : 'briefingReceive/getReceiveByReceiveId',
						type : "POST",
						data : {
							"receiveId" : receiveId
						},
						dataType : "json",
						success : function(result) {
							if (result.success) {
								var length = result.data.length - 1;
								noidclass(result.data[length].END_NODE_ID,result.data[length].TASK_STATUS);
								if(result.data[length].POFILE!=null){
								var arrPOFILE=result.data[length].POFILE.split(",");
								for(var i=0;i<arrPOFILE.length;i++){
									var href = 'javascript:POBrowser.openWindowModeless(\''
										+ ctx
										+ '/opennewword?pofile=\'\+\''
										+ arrPOFILE[0]+'&type=\'\+\''
										+ 4+'&sendId=\'\+\''
										+ result.data[0].RECEIVE_ID
										+ '\',"width=1200px;height=800px;")';
									$("#searchfile").attr("href", href);
									$("#searchone").text(arrPOFILE[0]);
								   }
								}
								$("#TITLE_ONE").text(result.data[0].TITLE);
								$("#NUMBER_ONE").text(result.data[0].NUMBER);
								
								if (result.data[0].ARCHIVAL_PERIOD == 0) {
									$("#ARCHIVAL_PERIOD_ONE input[type='radio'][value='0']").attr("checked", true);
								} else if (result.data[0].ARCHIVAL_PERIOD == 1) {
									$("#ARCHIVAL_PERIOD_ONE input[type='radio'][value='1']").attr("checked", true);
								} else if (result.data[0].ARCHIVAL_PERIOD == 2) {
									$("#ARCHIVAL_PERIOD_ONE input[type='radio'][value='2']").attr("checked", true);
								}
							
								//$("#COPIES_ONE").val(result.data[0].COPIES);
								$("#PAGES_ONE").text(result.data[0].PAGES);
								$("#CREATE_TIME_ONE").text(result.data[0].CREATE_TIME);
								$.ajax({
									url : 'unit/selectLAIById',
									type : "POST",
									data : {
										"unitId" : result.data[0].COMPANY
									},
									dataType : "json",
									success : function(result) {
										$("#COMPANY_ONE").text(result.data[0].name);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								for (var i = 0; i < result.data.length; i++) {
									var k=result.data[i].USER_NAME+" 意见:"+result.data[i].REMARKS+" 时间:"+result.data[i].CREATE_TIME;
									if (result.data[i].END_NODE_ID == 1) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_ONE").val($("#REMARKS_ONE").val()+k+"\r\n");}
									} else if (result.data[i].END_NODE_ID == 2) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_TWO").val($("#REMARKS_TWO").val()+k+"\r\n");}
									} else if (result.data[i].END_NODE_ID == 3) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_THREE").val($("#REMARKS_THREE").val()+k+"\r\n");}
									} else if (result.data[i].END_NODE_ID == 4) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_FOUR").val($("#REMARKS_FOUR").val()+k+"\r\n");}
									} else if (result.data[i].END_NODE_ID == 5) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_FIVE").val($("#REMARKS_FIVE").val()+k+"\r\n");}
									} 
								}
							} else {
								alert(result.msg);
							}
						},
						error : function(data) {
							console.log(data.msg);
						}
					});
		}
		$('#closeBtn').click(function(){
			var treeObj = $.fn.zTree.getZTreeObj("mainTreeDemo");
            var nodes = treeObj.getCheckedNodes(true);
            var endPersonId="";
            for(var i=0;i<nodes.length;i++){
            	endPersonId+=','+nodes[i].nodeId;
            } 
            $("#persons").attr("name",endPersonId);
			$("#modal-demo").modal("hide");
		})
		/*节点点击 弹窗人员树*/
		function list(id) {
			 $("#modal-demo").modal("show");
			if (id ==3) {
				endNodeId = 3;
				selectUserByRoleId(3);
			} else if (id ==4) {
				endNodeId = 4;
				selectUserByRoleId(9);
			} else if (id ==5) {
				endNodeId = 5;
				selectUserByRoleId(20);
			}
		}
		/*获取指定人员*/
		function selectUserByRoleId(rId) {
			//加载Ztree树
			$.ajax({
				type : 'POST',
				url : 'users/selectUserByRoleId',
				data : {
					"rId" : rId
				},
				dataType : "json",
				success : function(result) {
					if (result.success) {
						var t = $("#mainTreeDemo");
						var zTree = $.fn.zTree.getZTreeObj("tree");
						var zNodes = result.data;
						t = $.fn.zTree.init(t, setting, zNodes);
					} else {
						layer.msg(result.msg, {
							icon : 6
						});
					}

				},
				error : function(result) {
					console.log(result.msg);
				}
			});
		}
		/*得到所有人员*/
		function getUsersTree() {
			//加载Ztree树
			$.ajax({
				type : 'POST',
				url : 'users/getUsersTree',
				dataType : "json",
				success : function(result) {
					if (result.success) {
						var t = $("#mainTreeDemo");
						var zNodes = result.data;
						t = $.fn.zTree.init(t, setting, zNodes);
					} else {
						layer.msg(result.msg, {
							icon : 6
						});
					}

				},
				error : function(result) {
					console.log(result.msg);
				}
			});
		}
		/*动态加节点样式*/
		function noidclass (id,status){
			if(id==2){
				//黑色
				$('#handlethree,#three,#handlefour,#four,#handlefive,#five,#handlesix,#six').addClass('bordered-link cl3');
				//绿色
				$('#handletwo,#two').addClass('bordered-link cl3 currents');	
				//灰色
				$('#handleone,#one').addClass('bordered-link cl1 handle');
			}
			else if(id==3){
				//灰色
				$('#handleone,#one,#handletwo,#two').addClass('bordered-link cl1 handle');
				//黑色
				$('#handlefour,#four,#handlefive,#five,#handlesix,#six').addClass('bordered-link cl3');
				//绿色
				$('#handlethree,#three').addClass('bordered-link cl3 currents');	
			}
			else if(id==4){
				//灰色
				$('#handleone,#one,#handletwo,#two,#handlethree,#three').addClass('bordered-link cl1 handle');
				//绿色
				$('#handlefour,#four').addClass('bordered-link cl3 currents');	
				//黑色
				$('#handlefive,#five,#handlesix,#six').addClass('bordered-link cl3');
			}
			else if(id==5){
				//灰色
				$('#one,#two,#three,#four').addClass('bordered-link cl1 handle');
				$('#handleone,#handletwo,#handlethree,#handlefour').addClass('bordered-link cl1 handle');
				//绿色
				$('#handlefive,#five').addClass('bordered-link cl3 currents');	
				//黑色
				$('#handlesix,#six').addClass('bordered-link cl3');
			}
			else if(id==6&&status==0){
				//灰色
				$('#one,#two,#three,#four,#five').addClass('bordered-link cl1 handle');
				$('#handleone,#handletwo,#handlethree,#handlefour,#handlefive').addClass('bordered-link cl1 handle');
				//绿色
				$('#handlesix,#six').addClass('bordered-link cl3 currents');	
			}
			else if(id==6&&status==1){
				//灰色
				$('#handleone,#handletwo,#handlethree,#handlefour,#handlefive,#handlesix').addClass('bordered-link cl1 handle');
			}
		}
	</script>
</body>
</html>
