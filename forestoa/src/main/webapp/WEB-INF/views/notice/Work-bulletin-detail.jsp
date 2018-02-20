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
				<span>通知详细</span> <span id="receiveDetails">接收详情</span>
			</div>
			<div class="tabCon">
				<article class="page-container">
					<form class="form form-horizontal" id="form-article-add">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2"><span
								class="c-red">*</span>通知/通告标题：</label>
							<div class="formControls col-xs-8 col-sm-9 mt-5">								
									<span id="noticeTitle" name="noticeTitle"></span>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2"><span
								class="c-red">*</span>通知/通告类型：</label>
							<div class="formControls col-xs-8 col-sm-9 mt-5">
									<span id="noticeType" name="noticeType"></span>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<textarea id="noticeContent" class="textarea" cols="50"
									rows="10" disabled>无</textarea>
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2"></label>
							<div class="formControls col-xs-8 col-sm-9 ">
								<input id="read" type="checkbox" name="read" value="1" ><span id="read2">已阅</span>
							</div>
						</div>
						<div class="row cl"></div>

						<div class="row cl">
							<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2"
								id="quxiao" style="display: none">
								<button id="read1" class="btn btn-default radius" type="button">&nbsp;&nbsp;确定&nbsp;&nbsp;</button>
							</div>
						</div>
					</form>
				</article>
			</div>
			<div class="tabCon">
				<div class="mt-20">
					<table id="noticeTable"
						class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
						<thead>
							<tr class="text-c">
								<th>序号</th>
								<th>警号</th>
								<th>姓名</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${ctxStatic}/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<!--PageOffice.js-->
	<script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>
	<script type="text/javascript"
		src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		/*tab*/
		$("#tab-system").Huitab({
			index : 0
		});
		var str = location.href; //取得整个地址栏
		var num = str.indexOf("?");
		str = str.substr(num + 1);
		var noticeId = strs = str.split("=")[1];		
		$(document).ready(function() {
			var url = "notice/selectByKey?" + str;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {					
					$("#noticeTitle").text(result.data.noticeTitle);
					$("#noticeType").text(result.data.noticeType);
					$("#noticeContent").val(result.data.noticeContent);
					$("#noticeReceiver").val(result.data.noticeReceiver);
				}
			});
		});
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
		$("#read").on("click",function(){
			
			if($('#read').is(':checked')) {
				$('#quxiao').show();
			};
			if(!$('#read').is(':checked')) {
				$('#quxiao').hide();
			};
			
		});
		var user=${sessionScope.loginuser};		
		if(user.userNumber=="admin"){
			$('#quxiao').show();
			$('#receiveDetails').show();
			$('#read').hide();
			$('#read2').hide();
			
		}
		if(user.userNumber!="admin"){
			$('#receiveDetails').hide();
			
			
		}	
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
		//点击确定按钮向后台添加数据
	    $("#quxiao").on("click", function () {
	        var status = $("input:checkbox:checked").val();
	        $.ajax({
	            type: "post",
	            url: "userNotice/update",
	            data:{
	                "status":status,
	                "noticeId":noticeId,
	            },

	            success: function (data) {

	                if (data.success == false) {
	                	layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
	                }

	                if (data.success==true) {
	                    window.location.href = ctx+"/Workbulletin";//人员添加成功则跳转到人员管理主页面
	                    window.parent.location.reload();
	                    parent.layer.close(index);
	                }
	            },
	            error: function () {
	            }
	        });

	    });
		
		$(function() {
			//第一次加载表格
			createTable();
		});
		//初始化datatable

		function createTable() {
			$("#noticeTable")
					.dataTable(
							{
								//"bAutoWidth": true,
								"destroy" : true, //销毁表格对象
								//"aLengthMenu": [5, 10, 20],  //用户可自选每页展示数量 5条或10条
								"searching" : false,//禁用搜索（搜索框） */
								"serverSide" : true, //服务器分页
								"searching" : false, //关闭搜索框
								"ordering" : false, //是否允许用户排序
								"bInfo" : true, //是否显示页脚信息，DataTables插件左下角显示记录数
								"bLengthChange" : false, //去掉每页多少条框体 
								"language" : {
									"sProcessing" : "处理中..."
								},
								"ajax" : function(data, callback, settings) {
									/* var param = noticeManage
											.getQueryCondition(data); */
											data.noticeType = $("#Type").val();
											$.ajax({
												type : "POST",
												url : "userNotice/selectAllByNId?"+str,
												cache : false, //禁用缓存  
												data : data, //传入已封装的参数  
												dataType : "json",
												success : function(result) {
													//封装返回数据  
													var returnData = {};
													returnData.draw = result.data.draw; //这里直接自行返回了draw计数器,应该由后台返回  
													returnData.recordsTotal = result.data.recordsTotal; //总记录数  
													returnData.recordsFiltered = result.data.recordsFiltered; //后台不实现过滤功能，每次查询均视作全部结果  
													returnData.data = result.data.data;
													//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染  
													//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕  
													callback(returnData);
												},
											});
								},
								"createdRow" : function(row, data, index) {
									if (data.status == 0) {
										$('td', row).css('color', 'red');
									}
								},
								"columns" : [//对接收到的json格式数据进行处理，data为json中对应的key
								{
									"width" : "10%",
									"data" : null,
									"targets" : 0
								}, {
									"data" : "user.userNumber"
								},
								{
									"data" : "user.userName"
								}, {
									"data" : "status"
								},
								

								],
								//渲染
								"columnDefs" : [
									{	
					            		 "targets": 3,
					            		 "data": "status",
					            		 "createdCell": function (td, data, rowData, row, col) {
					            		      if (data=='1') {
					            		        $(td).css('color', 'red')
					            		      }
					            		 },
					                     "render": function (data) {
					                    	 if(data=='1'){
					                    		 return "已阅";
					                    	 }
					                    	 else{
					                    		
					                    		    
					                    		 return "未阅";
					                    		 }
					                     }
					            		 
					            	 },

								],
								"fnDrawCallback" : function() { //自动编号函数
									var api = this.api();
									//varstartIndex = api.context[0]._iDisplayStart; //获取到本页开始的条数 　
									api.column(0).nodes().each(
											function(cell, i) {
												cell.innerHTML = i + 1;
											});
								},
								"initComplete": function(settings, json) {
								    //初始化完成之后的回调函数
									$('#noticeTable').attr("style","width=100%");
								 },

							})
		};

		/* var noticeManage = {
			getQueryCondition : function(data) {
				var param = {};
				param.noticeType = $("#Type").val();//查询条件  
				//组装分页参数  
				param.start = data.start;
				param.length = data.length;
				param.draw = data.draw;
				return param;
			}
		}; */

		$("#btn_search").click(function() {
			/* var table = $('#noticeTable').DataTable();
			table.draw(false); */
			
			$('#noticeTable').dataTable().fnDestroy();
	    	createTable();
		});

		//将时间戳格式化
		function getMyDate(time) {
			if (typeof (time) == "undefined") {
				return "";
			}
			var oDate = new Date(time), oYear = oDate.getFullYear(), oMonth = oDate
					.getMonth() + 1, oDay = oDate.getDate(), oHour = oDate
					.getHours(), oMin = oDate.getMinutes(), oSen = oDate
					.getSeconds(), oTime = oYear + '-' + getzf(oMonth) + '-'
					+ getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin)
					+ ':' + getzf(oSen);//最后拼接时间

			return oTime;
		};

		//补0操作,当时间数据小于10的时候，给该数据前面加一个0
		function getzf(num) {
			if (parseInt(num) < 10) {
				num = '0' + num;
			}
			return num;
		}
		
	</script>
</body>
</html>
