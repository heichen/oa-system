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
	
<style>
.mt-10{
	margin-top:10px !important;
}
.form .row{
	margin-top:0px;
}
.row{
	margin-right: 0px;
	margin-left: 0px;
}
</style>
</head>
<body>
	<div class="page-container">
			<div id="tab-system" class="HuiTab">
				<div class="tabBar cl">
					<span>发文</span>
				</div>
				<div class="tabCon">
				<a id="ui-toggle-1" href="#" style="margin-left: 25px;">审批流程</a>
					<div id="ui-content-1" class="row cl ml-75 mt-5"
						style="margin-top: 0;display:none;">
						<div class="formControls col-xs-8 col-sm-1" >
							<div class="bordered-link cl3 currents" id="one"
								style="border-radius: 50%">
								<span class="fs1">拟稿</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;" id="2" onclick="list(this.id)">
							<div class="bordered-link cl3" id="two">
								<span class="fs1">核稿</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;" id="3" onclick="list(this.id)">
							<div class="bordered-link cl3" id="three">
								<span class="fs1">审核</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;" id="4" onclick="list(this.id)">
							<div class="bordered-link cl3" id="four">
								<span class="fs1">签批</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div class="bordered-link cl3" id="five">
								<span class="fs1">校核</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
						<div class="formControls col-xs-8 col-sm-1">
							<img src="${ctxStatic}/images/arrow4.png"
								style="width: 35px; margin-top: 40px; margin-left: 26px;" />
						</div>
						<div class="processBtn formControls col-xs-8 col-sm-1"
							style="margin-left: -25px;">
							<div class="bordered-link cl3" id="seven" style="border-radius: 50%">
								<span class="fs1">发文归档</span> <span class="fs2"></span> <span
									class="fs2"></span>
							</div>
						</div>
					</div>
					<!--办理信息-->
					<form class="form form-horizontal" id="files-save" action="" method="post" enctype="multipart/form-data">
					<div class="row cl" style="position: relative;">
					 	<div style="position: absolute;left: 25px; top: 0; z-index: 999;">
								<a id="ui-toggle-2" href="#" style="margin-right: 40px;">办理信息</a>
							</div>
						<label class="form-label col-xs-4 col-sm-2 mt-10">标题:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<input type="text" class="input-text radius" value="" placeholder="请输入标题" aresrequired  aresmsg="标题不能为空"
								id="TITLE" name="title">
						</div>
						<div id="ui-content-2">
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-10"><span style="color:red;">*</span>主办科室:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<span class="select-box radius">
										<select id="HOST_DEPARTMENT" name="hostDepartment" class="select" aresrequired  aresmsg="主办科室不能为空">
										</select>
									</span>
								</div>
								<label class="form-label col-xs-4 col-sm-2 mt-10">简报号:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<input type="text" class="input-text radius"  value="" placeholder="自动生成"
										id="NUMBER" name="number"  readonly="readonly">
								</div>
								<label class="form-label col-xs-4 col-sm-2 mt-10"><span style="color:red;">*</span>类型:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5" >
									<span class="select-box radius">
										<select id="TYPE" name="type" class="select" aresrequired  aresmsg="类型不能为空">
											<option value=""></option>
											<option value='0'>简报</option>
											<option value='1'>信息</option>
										</select>
									</span>
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-10">页数:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<input type="text" class="input-text radius" value="" placeholder="请输入页数"
										id="PAGES" name="pages" aresrequired  aresmsg="页数不能为空">
								</div>
						    	<label class="form-label col-xs-4 col-sm-2 mt-10">发文日期:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<input type="text" id="logmin" name="createTime" readonly="readonly"
										class="input-text radius size-M">
								</div>
								<label class="form-label col-xs-4 col-sm-2 mt-10">打印纸质份数:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5"> 
									<input type="text" class="input-text radius" value="" placeholder="请输入打印纸质份数" aresrequired  aresmsg="打印纸质份数不能为空"
										id="COPIES" name="copies">
								</div>
							</div>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 mt-10"><span style="color:red;">*</span>主送单位:</label>
								<div class="formControls col-xs-8 col-sm-2 mt-5">
									<span class="select-box radius">
										<select id="MAIN_COMPANY" name="mainCompany" class="select" aresrequired  aresmsg="主送单位不能为空"></select>
									</span>
								</div>
								<label class="form-label col-xs-4 col-sm-2 mt-10"><span style="color:red;">*</span>抄送单位:</label>
								 <div class="formControls col-xs-8 col-sm-2 mt-5">
									 <span class="select-box radius">
										<select id="COPY_COMPANY" class="select" name="copyCompany" aresrequired  aresmsg="抄送单位不能为空">  
	                                  </select>  
									</span>
								</div> 
							</div>
							<div class="row cl">
									<label class="form-label col-xs-4 col-sm-2">预投栏目:</label>
									<div class="formControls col-xs-8 col-sm-10 mt-5">
										<input type="checkbox" id="checkbox-1" value="0" name="preCastColumn">
										<label for="checkbox-1" class="mr-10" >工作要闻</label>
										<input type="checkbox" id="checkbox-2" value="1" name="preCastColumn">
										<label for="checkbox-2" class="mr-10">队伍建设</label>
										<input type="checkbox" id="checkbox-3" value="2" name="preCastColumn">
										<label for="checkbox-3" class="mr-10">刑侦快讯</label>
										<input type="checkbox" id="checkbox-4" value="3" name="preCastColumn">
										<label for="checkbox-4" class="mr-10">法制园地</label>
										<input type="checkbox" id="checkbox-1" value="4" name="preCastColumn">
										<label for="checkbox-1" class="mr-10">基础建设</label>
										<input type="checkbox" id="checkbox-2" value="5" name="preCastColumn">
										<label for="checkbox-2" class="mr-10">荣誉之窗</label>
										<input type="checkbox" id="checkbox-3" value="6" name="preCastColumn">
										<label for="checkbox-3" class="mr-10">专项行动</label>
										<input type="checkbox" id="checkbox-4" value="7" name="preCastColumn">
										<label for="checkbox-4" class="mr-10">警苑文化</label>
										<input type="checkbox" id="checkbox-1" value="8" name="preCastColumn">
										<label for="checkbox-1" class="mr-10">执法规范建设</label>
										<input type="checkbox" id="checkbox-2" value="9" name="preCastColumn">
										<label for="checkbox-2" class="mr-10">信息化建设</label>
										<input type="checkbox" id="checkbox-3" value="10" name="preCastColumn">
										<label for="checkbox-3" class="mr-10">视频宣传</label>
										<input type="checkbox" id="checkbox-4" value="11" name="preCastColumn">
										<label for="checkbox-4" class="mr-10">专题专栏</label>
									</div>
								</div>
						</div>
					</div>
					<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2 mt-5">文件:</label>
							<div class="formControls col-xs-8 col-sm-8 mt-5" >
							<input type="button" id="POFILE" name="pofile" class="btn btn-primary radius upload-btn" value="正文编写">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2 mt-10">意见:</label>
						<div class="formControls col-xs-8 col-sm-10 mt-5">
							<textarea name="remarks" id="REMARKS" cols="" rows="" class="textarea radius" style="height:70px;"></textarea>
						</div>
					</div>
				</form>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2 mt-5">
							<input type="button" id="saveBtn" 
								class="btn btn-secondary radius" type="button" value="提交"/>
						</div>
					</div>
				</div>
			</div>
	</div>
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
		<script type="text/javascript" src="pageoffice.js" id="po_js_main">
	</script>
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
		$('.skin-minimal input').iCheck({
			checkboxClass : 'icheckbox-blue',
			radioClass : 'iradio-blue',
			increaseArea : '20%'
		});
		$("#tab-system").Huitab({
			index : 0
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
			endPersonId =treeNode.nodeId;
		};
		
		var user = ${sessionScope.loginuser};
		//从session拿到的数据  
		var startPersonId = user.userId;
		var endPersonId = "";
		var startNodeId = 7;
		var endNodeId = "";
		/*提交按钮事件*/
		$("#saveBtn").click(function () {
			$("#saveBtn").disabled = true;
			var POFILE = $("#POFILE").attr("val");
			var REMARKS = $("#REMARKS").val(); 
			//var fileIdArray = new Array();
			var sendTasks = new Array();
			var task = {
					"taskId":"",
					"startPersonId" : startPersonId,
					"endPersonId" : endPersonId,
					"startNodeId" : startNodeId,
					"endNodeId" : endNodeId,
					"pofile" : POFILE,
					"remarks" : REMARKS
				};
			sendTasks.push(task);
			//序列化表单数据
		 	var arr1 = $("#files-save").serializeArray();
			var data = {};
			$.each(arr1, function(index, ele) {
				 data[ele.name] = ele.value;
			var cbValue="";
			$("#files-save :checkbox:checked").each(function () {
				cbValue+=$(this).val()+","
				 });
			 data.preCastColumn=cbValue;
			 data.tasks=JSON.stringify(sendTasks);
			});
		 if(Angel.Util.validate()){
			if(POFILE!=null){
			//判断是否选择了下一节点及办理人
			  if (endPersonId> 0 && endPersonId != null
						&& endPersonId != "undefined") {
					save(data);
				} else {
					layer.msg('请选择办理人员!', {icon: 5});
				}   
			 }
			else {
				layer.msg('请编辑正文!', {icon: 5});
			} 
		}
		});
		
		/*保存发文*/
		function save(data) {
			 layer.confirm('确认要提交吗？', function(index) {
				 $.ajax({
						url : ctx+"/briefingSend/saveSend",
						secureuri : false,
						data : data,
						success : function(data, status) {
							console.log(data);
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
	
		//正文查看事件
		   $("#POFILE").click(function (){
			   var type=$("#TYPE").val();
			   var year=new Date().getFullYear();
			   if(type==0){
				   type=4
			   }
			   else{
				   type=5;
			   }
				/*保存并获取最大发文文号*/
					var json={
							"year":year,
							"type": type
						};
						$.ajax({
							url: 'documentSend/saveSendNumber',
							type: 'POST',
							contentType: "application/json;charset=UTF-8",
							data: JSON.stringify(json),
							xhrFields: {
									withCredentials: true
							},
							contentType: 'application/json',
							dataType: "json",
							success: function(result) {
							  var k="z"+user.userId+Date.parse(new Date())+"_"+7;
								//正文pageoffice文件
								 var href = 'javascript:POBrowser.openWindowModeless(\'' + ctx
										+ '/openword?userName=\'\+\'' + k+ '&type=\'\+\''
										+ type+ '&year=\'\+\''
										+ year+'&number=\'\+\''
										+ result.data
										+ '\',"width=1200px;height=800px;")';	
						        $("#POFILE").attr("href",href);
								$("#POFILE").attr("val",k+".doc");
								$("#NUMBER").val(result.data);
								window.location.href=href;
							},
							error: function(err) {
								alert("error");
							}
						});
				
		   });
		/*点击节点 获取人员树*/
		function list(id) {
			$("#modal-demo").modal("show");
			if (id == 2) {
				endNodeId = 8;
				selectUserByRoleId(9);
			} else if (id == 3) {
				endNodeId = 9;
				selectUserByRoleId(3);
			} else if (id == 4) {
				endNodeId = 10;
				selectUserByRoleId(1);
			}  else {
				endNodeId = 14;
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
		/*添加附件*/
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
		/*移除附件*/
		function delDepartment(el) {
			$(el).parent().remove();
		}
		$(function(){
			Angel.Util.appendstar();
					$("#logmin").val(CurentTime()); //获取当前时间 
					//添加 主送单位下拉菜单
					$.ajax({
						url : "unit/selectByZHU",
						type : "post",
						async : false,
						success : function(data) {
							var html = "<option value=''></option>";
							for (i in data.data) {
								html += "<option value="+data.data[i].id+">"
										+ data.data[i].name + "</option>";
							}
							$("#MAIN_COMPANY").html(html);

						}
					});
					//添加 抄送单位下拉菜单
					$.ajax({
						url : "unit/selectByCHAO",
						type : "post",
						async : false,
						success : function(data) {
							var html = "<option value=''></option>";
							for (i in data.data) {
								html += "<option value="+data.data[i].id+">"
										+ data.data[i].name + "</option>";
							}
							$("#COPY_COMPANY").html(html);

						}
					});
					//获取当前登陆人所在科室
					$.ajax({
						url : "orgController/getOrgByLogin",
						type : "post",
						async : false,
						success : function(data) {
							var html = "<option value=''></option>";
							for (i in data.data) {
								html += "<option value="+data.data[i].oId+">"
										+ data.data[i].oName + "</option>";
							}
							$("#HOST_DEPARTMENT").html(html);

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
