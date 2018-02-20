<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<link href="${ctxStatic}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/lib/zTree/v3/css/bootstrapStyle/bootstrapStyle.css" type="text/css">

<style>
.mt-10 {
	margin-top: 10px !important;
}
.form .row{
	margin-top:0px;
}
.row {
	margin-right: 0px;
	margin-left: 0px;
}
</style>
</head>
<body>
	<div class="page-container">
		<div id="tab-system" class="HuiTab">
			<div class="tabBar cl">
				<span>详细</span> <span id="handle_two">办理</span>
			</div>
			<!-- 详细界面 -->
			<div class="tabCon">
				<a id="ui-toggle-1" href="#" style="margin-left: 25px;">审批流程</a>
				<div id="ui-content-1" class="row cl ml-75 mt-5" style="margin-top: 0; display: none;">
					<div class="formControls col-xs-8 col-sm-1">
						<div id="handleone" style="border-radius: 50%">
							<span class="fs1">拟稿</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="handletwo">
							<span class="fs1">核稿</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="handlethree">
							<span class="fs1">审核</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="handlefour">
							<span class="fs1">签批</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="handlefive">
							<span class="fs1">校核</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="handleseven" style="border-radius: 50%">
							<span class="fs1">发文归档</span>
						</div>
					</div>
				</div>
				<div class="form form-horizontal">
					<div class="row cl" style="position: relative;">
						<div style="position: absolute; left: 25px; top: 0; z-index: 999;">
							<a id="ui-toggle-2" href="#" style="margin-right: 40px;">办理信息</a>
						</div>
						<div class="row cl">
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2">标题:</label>
								<div class="formControls col-xs-8 col-sm-10 mt-5">
									<span id="TITLE_ONE"></span>
								</div>
							</div>
							<div id="ui-content-2">
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-2">主办科室:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="HOST_DEPARTMENT_ONE"></span>
									</div>
									<label class="form-label col-xs-4 col-sm-2">简报号:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="NUMBER_ONE"></span>
									</div>
									<label class="form-label col-xs-4 col-sm-2">存档期限:</label>
									<div class="formControls col-xs-8 col-sm-2" >
										<div class="radio-box" id="ARCHIVAL_PERIOD_ONE"  style="padding-right: 0;">
											<input type="radio" disabled="disabled" id="radio-1" name="demo-radio1" value="0"> <label for="radio-1">10年</label> <input type="radio"
												disabled="disabled" id="radio-1" name="demo-radio1" value="1"> <label for="radio-1">30年</label> <input type="radio" disabled="disabled"
												id="radio-1" name="demo-radio1" value="2"> <label for="radio-1">永久</label>
										</div>
									</div>
								</div>
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-2">打印纸质份数:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="COPIES_ONE"></span>
									</div>
									<label class="form-label col-xs-4 col-sm-2">页数:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="PAGES_ONE"></span>
									</div>
									<label class="form-label col-xs-4 col-sm-2">发文日期:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="CREATE_TIME_ONE"></span>
									</div>
								</div>
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-2">主送单位:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="MAIN_COMPANY_ONE"></span>
									</div>
									<label class="form-label col-xs-4 col-sm-2">抄送单位:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="COPY_COMPANY_ONE"></span>
									</div>
									<label class="form-label col-xs-4 col-sm-2">类型:</label>
									<div class="formControls col-xs-8 col-sm-2 mt-5">
										<span id="TYPE_ONE"></span>
									</div>
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-5">预投栏目:</label>
								<div class="formControls col-xs-8 col-sm-8 mt-5">
									<span id="PreCast_ONE"></span>
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-5">文件:</label>
								<div class="formControls col-xs-8 col-sm-8 mt-5">
									<a id="searchfile" href="" class="btn btn-primary radius upload-btn">正文查看</a>
								</div>
						</div>
					</div>

				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 mt-10">拟稿意见:</label>
					<div class="formControls col-xs-8 col-sm-11 mt-10">
						<textarea id="REMARKS_ONE" readonly="readonly" class="textarea radius"></textarea>
						<div class="ui-icon-pos" ><i class="Hui-iconfont" id="pone">&#xe695;</i> </div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 mt-10">核稿意见:</label>
					<div class="formControls col-xs-8 col-sm-11 mt-10">
						<textarea id="REMARKS_TWO" readonly="readonly" class="textarea radius"></textarea>
						<div class="ui-icon-pos" ><i class="Hui-iconfont" id="ptwo">&#xe695;</i> </div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 mt-10">审核意见:</label>
					<div class="formControls col-xs-8 col-sm-11 mt-10">
						<textarea id="REMARKS_THREE" readonly="readonly" class="textarea radius"></textarea>
						 <div class="ui-icon-pos" ><i class="Hui-iconfont" id="pthree">&#xe695;</i> </div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 mt-10">签批意见:</label>
					<div class="formControls col-xs-8 col-sm-11 mt-10">
						<textarea id="REMARKS_FOUR" readonly="readonly" class="textarea radius"></textarea>
						<div class="ui-icon-pos" ><i class="Hui-iconfont" id="pfour">&#xe695;</i> </div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 mt-10">校核意见:</label>
					<div class="formControls col-xs-8 col-sm-11 mt-10">
						<textarea id="REMARKS_FIVE" readonly="readonly" class="textarea radius"></textarea>
						<div class="ui-icon-pos" ><i class="Hui-iconfont" id="pfive">&#xe695;</i> </div>
					</div>
				</div>
			</div>
			</div>
			<!-- 办理界面 -->
			<div class="tabCon">
				<a id="ui-toggle-3" href="#" style="margin-left: 25px;">审批流程</a>

				<div id="ui-content-3" class="row cl ml-75 mt-5" style="margin-top: 0; display: none">
					<div class="processBtn formControls col-xs-8 col-sm-1" >
						<div id="one" style="border-radius: 50%">
							<span class="fs1">拟稿</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="processBtn formControls col-xs-8 col-sm-1" style="margin-left: -25px;" id="2" onclick="list(this.id)">
						<div id="two">
							<span class="fs1">核稿</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="processBtn formControls col-xs-8 col-sm-1" style="margin-left: -25px;" id="3" onclick="list(this.id)">
						<div id="three">
							<span class="fs1">审核</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="processBtn formControls col-xs-8 col-sm-1" style="margin-left: -25px;" id="4" onclick="list(this.id)">
						<div id="four">
							<span class="fs1">签批</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="processBtn formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="five">
							<span class="fs1">校核</span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png" style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1" style="margin-left: -25px;">
						<div id="seven">
							<span class="fs1">发文归档</span>
						</div>
					</div>
				</div>
				<!--办理信息-->
				<form class="form form-horizontal" id="files-save" action="" method="post" enctype="multipart/form-data">
					<div class="row cl" style="position: relative;">
						<div style="position: absolute; left: 25px; top: 0; z-index: 999;">
							<a id="ui-toggle-4" href="#" style="margin-right: 40px;">办理信息</a>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2">标题:</label>
							<div class="formControls col-xs-8 col-sm-10 mt-5">
								<!-- <input type="text" class="input-text radius" readonly="readonly"
									value="" placeholder="" id="TITLE" name="title"> -->
								<span id="TITLE" name="title"></span>
							</div>
						</div>
						<div id="ui-content-4">
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2">主办科室:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" class="input-text radius" readonly="readonly"
										id="HOST_DEPARTMENT" name="hostDepartment"> -->
									<span id="HOST_DEPARTMENT" name="hostDepartment"></span>
								</div>
								<label class="form-label col-xs-4 col-sm-2">简报号:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" class="input-text radius" readonly="readonly"
										id="NUMBER" name="number"> -->
									<span id="NUMBER" name="number"></span>
								</div>
								<div id="ARCHIVAL" style="visibility: hidden">
									<label class="form-label col-xs-4 col-sm-2">存档期限:</label>
									<div class="formControls col-xs-8 col-sm-2">
										<div class="radio-box" id="ARCHIVAL_PERIOD" style="padding-right: 0;">
											<input type="radio" readonly="readonly" id="radio-1" name="archivalPeriod" value="0"> <label for="radio-1">10年</label> <input type="radio"
												readonly="readonly" id="radio-1" name="archivalPeriod" value="1"> <label for="radio-1">30年</label> <input type="radio" readonly="readonly"
												id="radio-1" name="archivalPeriod" value="2"> <label for="radio-1">永久</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2">打印纸质份数:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" readonly="readonly" class="input-text radius"
										id="COPIES" name="copies"> -->
									<span id="COPIES" name="copies"></span>
								</div>
								<label class="form-label col-xs-4 col-sm-2">页数:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" readonly="readonly" class="input-text radius"
										id="PAGES" name="pages"> -->
									<span id="PAGES" name="pages"></span>
								</div>
								<label class="form-label col-xs-4 col-sm-2">发文日期:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" readonly="readonly" id="logmin"
										name="createTime" class="input-text radius size-M"> -->
									<span id="logmin" name="createTime"></span>
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2">主送单位:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" readonly="readonly" class="input-text radius"
										id="MAIN_COMPANY" name="mainCompany"> -->
									<span id="MAIN_COMPANY" name="mainCompany"></span>
								</div>
								<label class="form-label col-xs-4 col-sm-2">抄送单位:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" readonly="readonly" class="input-text radius"
										id="COPY_COMPANY" name="copyCompany"> -->
									<span id="COPY_COMPANY" name="copyCompany"></span>
								</div>
								<label class="form-label col-xs-4 col-sm-2">类型:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<!-- <input type="text" readonly="readonly" class="input-text radius"
										id="TYPE" name="type"> -->
									<span id="TYPE" name="type"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2 mt-5">预投栏目:</label>
						<div class="formControls col-xs-8 col-sm-8 mt-5">
							<span id="preCastColumn"></span>
						</div>
					</div>
					<div  id="filesearch" class="row cl">
						<label class="form-label col-xs-4 col-sm-2 mt-5">文件:</label>
						<div class="formControls col-xs-8 col-sm-8 mt-5">
							<a id="POFILE" class="btn btn-primary radius upload-btn"> 正文编写</a>
						</div>
					</div>
					<div class="row cl" id="remarks">
						<label class="form-label col-xs-4 col-sm-2 mt-10">意见:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<textarea name="" id="REMARKS" class="textarea radius" style="height:75px;"></textarea>
						</div>
					</div>
					<input type="text" hidden="true" id="SEND_ID" name="sendId" startPersonId="" startNodeId="" value="">
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2 mt-5">
							<input type="button" id="subbtn" class="btn btn-secondary radius" value="提交"> 
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="modal-demo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content radius">
				<div class="modal-header">
					<h3 class="modal-title">请选择办理人员</h3>
					<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
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
	<script type="text/javascript" src="${ctxStatic}/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/jquery.ajaxFileUpload.js"></script>
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

		}
		$('.skin-minimal input').iCheck({
			checkboxClass : 'icheckbox-blue',
			radioClass : 'iradio-blue',
			increaseArea : '20%'
		});
		/*弹窗树*/
		var setting = {
				check : {
					enable : true,
					chkStyle : "radio",
					radioType : "all"
				},
			view : {
				dblClickExpand : false,
				showLine : false,
				selectedMulti : false
			},
			data : {
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
			callback : {
				onCheck : zTreeOnCheck
			}
		};
		function zTreeOnCheck(event, treeId, treeNode) {
			endPersonId = treeNode.nodeId;
		};
		var user = ${sessionScope.loginuser};
		var endPersonId = "";
		var endNodeId = "";
		var receiveTasks = new Array();
		//提交事件
		$("#subbtn").click(function() {
			$("#saveBtn").disabled = true;
					var opinion = 1;
					var startPersonId = $("#SEND_ID").attr("startPersonId");
					var startNodeId = $("#SEND_ID").attr("startNodeId");
					var POFILE = $("#POFILE").attr("val");
					var REMARKS = $("#REMARKS").val();
					var sendTasks = new Array();
					var task = {
						"taskId" : taskId,
						"startPersonId" : startPersonId,
						"endPersonId" : endPersonId,
						"startNodeId" : startNodeId,
						"endNodeId" : endNodeId,
						"pofile" : POFILE,
						"remarks" : REMARKS,
						"opinion" : opinion
					};
					sendTasks.push(task);
					var arr1 = $("#files-save").serializeArray();
					var data = {};
					$.each(arr1, function(index, ele) {
						data[ele.name] = ele.value;
						data.tasks = JSON.stringify(sendTasks);
					});
					if (startNodeId==10||startNodeId==11){//如果当前是签批 校核节点
						save(data);
					} 
					else if(startNodeId == 13){//如果当前是发文归档节点
					var s=	$("#ARCHIVAL input[type='radio']:checked").val();
								if(s!=null){
									save(data);
								}
								else{
									layer.msg('请选择存档期限!', {
										icon : 5
									});
								}
						}
				  else if (endNodeId > 0 && endNodeId != null
								&& endNodeId != "undefined" && endPersonId > 0
								&& endPersonId != null
								&& endPersonId != "undefined") {
							save(data);
						} 
				  else {
							layer.msg('请选择办理人员!', {
								icon : 5
							});
						}
					
				});
		//添加对象
		function save(data) {
			layer.confirm('确认要提交吗？', function(index) {
				$.ajax({
					url : ctx + "/briefingSend/saveSend",
					secureuri : false,
					data : data,
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
			$.ajax({url : 'briefingSend/getSendByTaskId',
						type : "POST",
						data : {
							"taskId" : taskId
						},
						cache : false, 
						ifModified : true, 
						async : false,
						dataType : "json",
						success : function(result) {
							if (result.success) {
								getSendBySendId(result.data.SEND_ID);
								if (result.data.TASK_STATUS == 1) {//已办
									document.getElementById("handle_two").style.visibility = "hidden";//隐藏
									$("#tab-system").Huitab({
										index : 0
									});
								} else {//待办
									$("#tab-system").Huitab({
										index : 0
									});
									getHandleTwo(taskId);
								}
							}
						}
					});
		}

		/*根据taskId查询收文  办理*/
		function getHandleTwo(taskId) {
			$.ajax({url : 'briefingSend/getSendByTaskId',
						type : "POST",
						data : {
							"taskId" : taskId
						},
						dataType : "json",
						success : function(result) {
							if (result.success) {
								$("#TITLE").text(result.data.TITLE);
								$("#NUMBER").text(result.data.NUMBER);
								if (result.data.END_NODE_ID == 8) {
									$("#2").removeAttr("onclick");
								}
								if (result.data.END_NODE_ID == 9) {
									$("#2,#3").removeAttr("onclick");
								}
								if (result.data.END_NODE_ID == 10) {
									endNodeId = 11;
									$("#2,#3,#4").removeAttr("onclick");
								}
								if (result.data.END_NODE_ID == 11) {
									endNodeId = 13;
									$("#2,#3,#4").removeAttr("onclick");
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
								if (result.data.END_NODE_ID == 13) {
									document.getElementById("ARCHIVAL").style.visibility="visible";
									$("#2,#3,#4").removeAttr("onclick");
									$("#remarks,#REMARKS,#filesearch").hide();
								}
								$.ajax({
									url : 'orgController/getOrgById',
									type : "POST",
									data : {
										"oId" : result.data.HOST_DEPARTMENT
									},
									dataType : "json",
									success : function(result) {
										$("#HOST_DEPARTMENT").attr("name",
												result.data.oId);
										$("#HOST_DEPARTMENT").text(
												result.data.oName);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								$("#COPIES").text(result.data.COPIES);
								$("#PAGES").text(result.data.PAGES);
								$("#preCastColumn").text(result.data.PRE_CAST_COLUMNS);
								$("#logmin").text(result.data.CREATE_TIME);
								$.ajax({
									url : 'unit/selectZHUAIById',
									type : "POST",
									data : {
										"unitId" : result.data.MAIN_COMPANY
									},
									dataType : "json",
									success : function(result) {
										$("#MAIN_COMPANY").attr("name",
												result.data[0].id);
										$("#MAIN_COMPANY").text(
												result.data[0].name);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								$.ajax({
									url : 'unit/selectCHAOAIById',
									type : "POST",
									data : {
										"unitId" : result.data.COPY_COMPANY
									},
									dataType : "json",
									success : function(result) {
										$("#COPY_COMPANY").attr("name",
												result.data[0].id);
										$("#COPY_COMPANY").text(
												result.data[0].name);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								if (result.data.TYPE == 0) {
									$("#TYPE").text("简报");
								} else if (result.data.TYPE == 1) {
									$("#TYPE").text("信息");
								}

								var k = "z"+user.userId + Date.parse(new Date())+"_"+(result.data.END_NODE_ID+1);
								var href = 'javascript:POBrowser.openWindowModeless(\''
										+ ctx
										+ '/openNewWords?userName=\'\+\''
										+ k
										+ '&endNode=\'\+\''
										+ result.data.END_NODE_ID
										+ '&pofile=\'\+\''
										+ result.data.POFILE+ '&type=\'\+\''
										+ 3+'&sendId=\'\+\''
										+ result.data.SEND_ID
										+ '\',"width=1200px;height=800px;")';
								$("#POFILE").attr("href", href);
								$("#POFILE").attr("val", k + ".doc");
								$("#SEND_ID").val(result.data.SEND_ID);
								$("#SEND_ID").attr("startPersonId",
										result.data.END_PERSON_ID);
								$("#SEND_ID").attr("startNodeId",
										result.data.END_NODE_ID);
							} else {
								alert(result.msg);
							}
						},
						error : function(data) {
							console.log(data.msg);
						}
					});
		}
		function list(id) {
			$("#modal-demo").modal("show");
			 if (id == 2) {
				endNodeId = 8;
				getUsersTree();
			} else if (id == 3) {
				endNodeId = 9;
				selectUserByRoleId(3);
			} else if (id == 4) {
				endNodeId = 10;
				selectUserByRoleId(1);
			} 
		}
		$('#closeBtn').click(function() {
			$("#modal-demo").modal("hide");
		})
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
		/*查看已办的详细信息*/
		function getSendBySendId(sendId) {
			$.ajax({url : 'briefingSend/getSendBySendId',
						type : "POST",
						data : {
							"sendId" : sendId
						},
						dataType : "json",
						success : function(result) {
							if (result.success) {
								var length = result.data.length - 1;
								noidclass(result.data[length-1].END_NODE_ID,
										result.data[length-1].TASK_STATUS);
								var href = 'javascript:POBrowser.openWindowModeless(\''
										+ ctx
										+ '/openSearchWord?pofile=\'\+\''
										+ result.data[length-1].POFILE+ '&type=\'\+\''
										+ 3+'&sendId=\'\+\''
										+ result.data[length-1].SEND_ID
										+ '\',"width=1200px;height=800px;")';
								$("#searchfile").attr("href", href);
								$("#TITLE_ONE").text(result.data[0].TITLE);
								$("#NUMBER_ONE").text(result.data[0].NUMBER);
								if (result.data[0].ARCHIVAL_PERIOD == 0) {
									$("#ARCHIVAL_PERIOD_ONE input[type='radio'][value='0']").attr("checked", true);
								} else if (result.data[0].ARCHIVAL_PERIOD == 1) {
									$("#ARCHIVAL_PERIOD_ONE input[type='radio'][value='1']").attr("checked", true);
								} else if (result.data[0].ARCHIVAL_PERIOD == 2) {
									$("#ARCHIVAL_PERIOD_ONE input[type='radio'][value='2']").attr("checked", true);
								}
								$.ajax({
									url : 'orgController/getOrgById',
									type : "POST",
									data : {
										"oId" : result.data[0].HOST_DEPARTMENT
									},
									dataType : "json",
									success : function(result) {
										$("#HOST_DEPARTMENT_ONE").text(result.data.oName);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								$("#COPIES_ONE").text(result.data[0].COPIES);
								$("#PAGES_ONE").text(result.data[0].PAGES);
								$("#CREATE_TIME_ONE").text(
										result.data[0].CREATE_TIME);
								$.ajax({
									url : 'unit/selectZHUAIById',
									type : "POST",
									data : {
										"unitId" : result.data[0].MAIN_COMPANY
									},
									dataType : "json",
									success : function(result) {
										$("#MAIN_COMPANY_ONE").text(
												result.data[0].name);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								$.ajax({
									url : 'unit/selectCHAOAIById',
									type : "POST",
									data : {
										"unitId" : result.data[0].COPY_COMPANY
									},
									dataType : "json",
									success : function(result) {
										$("#COPY_COMPANY_ONE").text(
												result.data[0].name);
									},
									error : function(data) {
										console.log(data.msg);
									}
								})
								if (result.data[0].TYPE == 0) {
									$("#TYPE_ONE").text("简报");
								} else if (result.data[0].TYPE == 1) {
									$("#TYPE_ONE").text("信息");
								} 
								$("#PreCast_ONE").text(result.data[length].PRE_CAST_COLUMNS);

								for (var i = 0; i < result.data.length; i++) {
									var k = result.data[i].USER_NAME + " 意见:"
											+ result.data[i].REMARKS + " 时间:"
											+ result.data[i].CREATE_TIME;
									var href = 'javascript:POBrowser.openWindowModeless(\''
												+ ctx
												+ '/openSearchWord?pofile=\'\+\''
												+ result.data[i].POFILE+ '&type=\'\+\''
												+ 3+'&sendId=\'\+\''
												+ result.data[0].SEND_ID
												+ '\',"width=1200px;height=800px;")';
									if (result.data[i].END_NODE_ID == 7) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_ONE").val(k+ "\r\n");}
										$("#pone").attr("href",href);
										$('#pone').click(function() {
											window.location.href=$("#pone").attr("href");
										})
									} else if (result.data[i].END_NODE_ID == 8) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_TWO").val(k+ "\r\n");}
										$("#ptwo").attr("href",href);
										$('#ptwo').click(function() {
											window.location.href=$("#ptwo").attr("href");
										})
									} else if (result.data[i].END_NODE_ID == 9) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_THREE").val( k+ "\r\n");}
										$("#pthree").attr("href",href);
										$('#pthree').click(function() {
											window.location.href=$("#pthree").attr("href");
										})	
									} else if (result.data[i].END_NODE_ID == 10) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_FOUR").val(k+ "\r\n");}
										$("#pfour").attr("href",href);
										$('#pfour').click(function() {
											window.location.href=$("#pfour").attr("href");
										})	
									} else if (result.data[i].END_NODE_ID == 11) {
										if(result.data[i].REMARKS!=null&&result.data[i].REMARKS.length>0){
										$("#REMARKS_FIVE").val(k+ "\r\n");}
										$("#pfive").attr("href",href);
										$('#pfive').click(function() {
											window.location.href=$("#pfive").attr("href");
										})
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
		/*动态加节点样式*/
		function noidclass(id, status) {
		 if (id == 8) {
				//灰色
				$('#handleone,#one').addClass('bordered-link cl1 handle');
				//绿色
				$('#handletwo,#two').addClass('bordered-link cl3 currents');
				//黑色
				$('#handlethree,#handlefour,#handlefive,#handleseven,#handleeight').addClass('bordered-link cl3');
				$('#three,#four,#five,#seven,#eight').addClass('bordered-link cl3');
			} else if (id == 9) {
				//灰色
				$('#handleone,#one,#handletwo,#two').addClass('bordered-link cl1 handle');
				//绿色
				$('#handlethree,#three').addClass('bordered-link cl3 currents');
				//黑色
				$('#four,#five,#seven,#eight').addClass('bordered-link cl3');
				$('#handlefour,#handlefive,#handleseven,#handleeight').addClass('bordered-link cl3');
			} else if (id == 10) {
				//灰色
				$('#handleone,#one,#handletwo,#two,#handlethree,#three').addClass('bordered-link cl1 handle');
				//绿色
				$('#handlefour,#four').addClass('bordered-link cl3 currents');
				//黑色
				$('#five,#seven,#eight').addClass('bordered-link cl3');
				$('#handlefive,#handleseven,#handleeight').addClass('bordered-link cl3');
			} else if (id == 11) {
				//灰色
				$('#one,#two,#three,#four').addClass('bordered-link cl1 handle');
				$('#handleone,#handletwo,#handlethree,#handlefour').addClass('bordered-link cl1 handle');
				//绿色
				$('#handlefive,#five').addClass('bordered-link cl3 currents');
				//黑色
				$('#seven,#eight').addClass('bordered-link cl3');
				$('#handleseven,#handleeight').addClass('bordered-link cl3');
			} else if (id == 13&& status != 1) {
				//灰色
				$('#one,#two,#three,#four,#five').addClass('bordered-link cl1 handle');
				$('#handleone,#handletwo,#handlethree,#handlefour,#handlefive').addClass('bordered-link cl1 handle');
				//绿色
				$('#handleseven,#seven').addClass('bordered-link cl3 currents');
			} else if (id == 13 && status == 1) {
				//灰色
				$('#one,#two,#three,#four,#five,#seven').addClass('bordered-link cl1 handle');
				$('#handleone,#handletwo,#handlethree,#handlefour,#handlefive,#handleseven').addClass('bordered-link cl1 handle');
			}
		}
		var fileid = 1;
		$('#addBtn').click(function() {
			var data = {
				'id' : fileid,
			},
			//获取模板
			jsRenderTpl = $.templates('#menufile'),
			//模板与数据结合
			finalTpl = jsRenderTpl(data);
			$('#ui-addFileBtn').append(finalTpl);
			fileid++;
		})
		function delDepartment(el) {
			$(el).parent().remove();
		}
	</script>
	<!--jsrender模板-->
	<script id="menufile" type="text/x-jsrender">
         <div id="ui-addFileBtn" class="mt-10">
				<input id="file_{{:id}}" type="file" name="files">
				<i class="Hui-iconfont Hui-iconfont-jianhao"  onclick="delDepartment(this)"  style="cursor: pointer;"></i>
	     </div>
</script>
</body>
</html>
