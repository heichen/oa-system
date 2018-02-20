<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/h-ui.admin/skin/default/skin.css" id="skin" />
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

.row {
	margin-left: 0;
	margin-right: 0;
}

.mt-10 {
	margin-top: 10px !important;
}
</style>
</head>
<body>
	<div class="page-container">
		<div id="tab-system" class="HuiTab">
			<div class="tabBar cl">
				<span>收文</span>
			</div>
			<div class="tabCon">
			<a id="ui-toggle-1" href="#" style="margin-left: 25px;">审批流程</a>
				<div id="ui-content-1" class=" row cl ml-75 mt-5"
					style="margin-top: 0;display:none;">
					<div class="formControls col-xs-8 col-sm-1">
						<div class="bordered-link cl3 currents" id=""
							style="border-radius: 50%">
							<span class="fs1">收文人员</span> <span class="fs2"></span> <span
								class="fs2"></span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png"
							style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="processBtn formControls col-xs-8 col-sm-1"
						style="margin-left: -25px;">
						<div class="bordered-link cl3">
							<span class="fs1">分发人员</span> <span class="fs2"></span> <span
								class="fs2"></span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png"
							style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1"
						style="margin-left: -25px;">
						<div class="bordered-link cl1 handle">
							<span class="fs1">分管领导</span> <span class="fs2"></span> <span
								class="fs2"></span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png"
							style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1"
						style="margin-left: -25px;">
						<div class="bordered-link cl1 handle">
							<span class="fs1">科室负责人</span> <span class="fs2"></span> <span
								class="fs2"></span>
						</div>
					</div>
					<div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png"
							style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1"
						style="margin-left: -25px;">
						<div class="bordered-link cl1 handle" >
							<span class="fs1">科员</span> <span class="fs2"></span> <span
								class="fs2"></span>
						</div>
					</div>
                      <div class="formControls col-xs-8 col-sm-1">
						<img src="${ctxStatic}/images/arrow4.png"
							style="width: 35px; margin-top: 40px; margin-left: 26px;" />
					</div>
					<div class="formControls col-xs-8 col-sm-1"
						style="margin-left: -25px;">
						<div class="bordered-link cl1 handle" style="border-radius: 50%">
							<span class="fs1">归档</span> <span class="fs2"></span> <span
								class="fs2"></span>
						</div>
					</div>

				</div>
				<form class="form form-horizontal" id="files-save" action="" method="post"
					enctype="multipart/form-data">
					<!--办理信息-->
					<div class="row cl" style="position: relative;">
					<div style="position: absolute;left: 25px; top: 0; z-index: 999;">
								<a id="ui-toggle-2" href="#" style="margin-right: 40px;">办理信息</a>
							</div>
					<div id="dvBrand" class="row cl" style="position: relative;">
						<label class="form-label col-xs-4 col-sm-2 mt-10">标题:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<input type="text" class="input-text radius" value="" placeholder="请输入标题"
								id="TITLE" name="title" aresrequired  aresmsg="标题不能为空">
						</div>
						<div id="ui-content-2">
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-10"><span style="color:red;">*</span>来文单位:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
								<span class="select-box radius">
									<select name="company" id="COMPANY" class="select" aresrequired  aresmsg="来文单位不能为空">
									</select>
								</span>
								</div>
								<label class="form-label col-xs-4 col-sm-2 mt-10">简报号:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<input type="text" class="input-text radius" value="" placeholder="请输入简报号"
										id="NUMBER" name="number" aresrequired  aresmsg="简报号不能为空">
								</div>
								<div id="ARCHIVAL" style="visibility: hidden">
								<label class="form-label col-xs-4 col-sm-2 mt-10">存档期限：</label>
								<div class="formControls col-xs-8 col-sm-2 mt-10">
									<div class="radio-box" id="ARCHIVAL_PERIOD"
										style="padding-right: 0;">
										<input type="radio" id="radio-1" name="archivalPeriod"
											value="0"> <label for="radio-1">10年</label> <input
											type="radio" id="radio-1" name="archivalPeriod" value="1">
										<label for="radio-1">30年</label> <input type="radio"
											id="radio-1" name="archivalPeriod" value="2"> <label
											for="radio-1">永久</label>
									</div>
								</div>
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-10">页数:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<input type="text" class="input-text radius" value="" placeholder="请输入页数"
										id="PAGES" name="pages" aresrequired  aresmsg="页数不能为空">
								</div>
								<label class="form-label col-xs-4 col-sm-2 mt-10">收文日期:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<input type="text" id="logmin" name="createTime"
										readonly="readonly" class="input-text radius size-M">
								</div>
							</div>
						</div>
					</div>
					</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2 mt-10">正文上传:</label>
						<div class="formControls col-xs-8 col-sm-8 mt-5" style="height: 65px;overflow: auto;">
							<div id="ui-addFileBtn" class="mt-10">
								<input id="file_0" type="file" name="files"> 
							</div>
						</div>
					</div>
					<div class="row cl" style="display:none">
						<label class="form-label col-xs-4 col-sm-2">意见:</label>
						<div class="formControls col-xs-8 col-sm-10">
							<textarea name="" id="OPINION" cols="" rows="" class="textarea radius" style="height:75px;"></textarea>
						</div>
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
		/*tab*/
		$("#tab-system").Huitab({
			index : 0
		});

		$('.skin-minimal input').iCheck({
			checkboxClass : 'icheckbox-blue',
			radioClass : 'iradio-blue',
			increaseArea : '20%'
		});

		/*弹窗树*/
		var setting = {
			check : {
				enable : true,
				chkStyle : "checkbox",
				chkboxType : {
					"Y" : "",
					"N" : ""
				}
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
				beforeCheck : zTreeOnCheck
			}
		};
//弹窗树选择人员
		function zTreeOnCheck(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			return treeNode;
		};
		$("#saveBtn").click(function () {
			$("#saveBtn").disabled = true;
			var user = ${sessionScope.loginuser};
			//从session拿到的数据  
			var startPersonId = user.userId;
			endPersonId = $("#persons").attr("name");;
			if(endPersonId==null||endPersonId=="undefined"){
				endPersonId=","
			}
			var startNodeId = 1;
			var endNodeId = 2;
			var receiveTasks = new Array();
			var OPINION = $("#OPINION").val();
			//获取上传文件
			var fileIdArray = new Array();
		   $("#files-save input[type='file']").each(function(index, element) {
				fileIdArray.push($(this).attr("id"));
			});
			receiveTasks = [];
			var result = endPersonId.split(",");
			for (var i = 1; i < result.length; i++) {
				var menu = {
					"startPersonId" : startPersonId,
					"endPersonId" : result[i],
					"startNodeId" : startNodeId,
					"endNodeId" : endNodeId,
					"remarks" : OPINION
				};
				receiveTasks.push(menu);
			}
			//获取序列化数据
			var arr1 = $("#files-save").serializeArray();
			var data = {};
			$.each(arr1, function(index, ele) {
				data[ele.name] = ele.value;
			    data.tasks=JSON.stringify(receiveTasks);
			});
			if(Angel.Util.validate()){
			 if (endPersonId.length > 0 && endPersonId != null
					&& endPersonId != "undefined"&&endPersonId!=",") {
				save(data,fileIdArray);
			} else {
				layer.msg('请选择办理人员!', {icon: 5});
			} 
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
		$('#ui-content-1 .processBtn').click(function() {
			$("#modal-demo").modal("show");
			//加载Ztree树
			$.ajax({
				type : 'POST',
				url : 'users/selectUserByRoleId',
				data:{"rId":18},
				dataType : "json",
				success : function(result) {
					if (result.success) {
						 var t = $("#mainTreeDemo");
						var zNodes = result.data;
						t = $.fn.zTree.init(t, setting, zNodes); 
					} else {
						layer.msg(result.msg, {icon: 6});
					}

				},
				error : function(result) {
					console.log(result.msg);
				}
			});
		})
		
		//关闭弹出选择人员窗口
		$('#closeBtn').click(function() {
			var treeObj = $.fn.zTree.getZTreeObj("mainTreeDemo");
            var nodes = treeObj.getCheckedNodes(true);
            var endPersonId="";
            for(var i=0;i<nodes.length;i++){
            	endPersonId+=','+nodes[i].nodeId;
            } 
            $("#persons").attr("name",endPersonId);
			$("#modal-demo").modal("hide");
		})
	$(function(){
			Angel.Util.appendstar();
					//获取当前时间
					$("#logmin").val(CurentTime()); //获取当前时间 
					//添加来文单位下拉菜单
					$.ajax({
						url : "unit/selectByLAI",
						type : "post",
						async : false,
						success : function(data) {
							var html = "<option value=''></option>";
							for (i in data.data) {
								html += "<option value="+data.data[i].id+">"
										+ data.data[i].name + "</option>";
							}
							$("#COMPANY").html(html);
						}
					});
	});
		/*获取当前日期*/
		function CurentTime() {
			//获取当前的日期时间函数,格式为“yyyy-MM-dd hh:mm:ss”
			if (date == null) {
				var date = new Date();
			}
			var seperator1 = "-";
			var seperator2 = ":";
			var month = date.getMonth() + 1;
			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}
			var strDate = date.getDate();
			if (strDate >= 0 && strDate <= 9) {
				strDate = "0" + strDate;
			}
			var hour = date.getHours();
			if (hour >= 0 && hour <= 9) {
				hour = "0" + hour;
			}
			var minute = date.getMinutes();
			if (minute >= 0 && minute <= 9) {
				minute = "0" + minute;
			}
			var sec = date.getSeconds();
			if (sec >= 0 && sec <= 9) {
				sec = "0" + sec;
			}
			var currentdate = date.getFullYear() + seperator1 + month
					+ seperator1 + strDate + " " + hour + seperator2 + minute
					+ seperator2 + sec;
			return currentdate;
		}
		/*添加上传文件页面*/
		var fileid=1;
		$('#addBtn').click(function(){
			var data = {
		            'id': fileid,
		        },
			//获取模板
		    jsRenderTpl = $.templates('#menufile'),
		     //模板与数据结合
		    finalTpl = jsRenderTpl(data);
		    $('#ui-addFileBtn').append(finalTpl);
		    fileid++;
		})
		function delDepartment(el){
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
